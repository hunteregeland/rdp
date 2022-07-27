%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* #include "symbolTable.h" */
#include "AST.h"


extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
char currentScope[50]; /* global or the name of the function */

%}


%union {
	int number;
	char character;
	char* string;
	struct AST* ast;
}

%token <number> NUMBER
%token <number> DIGIT
%token <string> ID
%token <string> STRING

%token <string> IDENTIFICATION
%token <string> ENVIRIONMENT
%token <string> DATA
%token <string> PROCEDURE
%token <string> DIVISION

%token <string> FILEE
%token <string> WORKINGSTORAGE
%token <string> LOCALSTORAGE
%token <string> LINKAGE
%token <string> SECTION

%token <string> PROGRAMID
%token <string> DISPLAY
%token <string> ACCEPT
%token <string> STOP
%token <string> RUN

%token <string> IF
%token <string> THEN
%token <string> ENDIF
%token <string> PERFORM
%token <string> UNTIL
%token <string> TIMES
%token <string> PICTURE
%token <string> PIC
%token <string> IS
%token <string> TO

%token <character> PERIOD
%token <character> COMMA
%token <character> GT_OP
%token <character> LT_OP
%token <character> EQ_OP
%token <character> DOUBLE_EQ_OP
%token <character> GT_EQ_OP
%token <character> LT_EQ_OP
%token <character> OPEN_PARENTHESES
%token <character> CLOSE_PARENTHESES
%token <character> ADD

%token <character> NINE
%token <character> LETTERV
%token <character> LETTERS
%token <character> LETTERX

%printer { fprintf(yyoutput, "%s", $$); } ID;
%printer { fprintf(yyoutput, "%d", $$); } NUMBER;
%printer { fprintf(yyoutput, "%d", $$); } DIGIT;

%type <ast> CobolProgram Modules Module Module1 Module2 Module3 Module4 IDDiv EnvDiv Sections Section DataSection DataDiv ProcSection ProcSectionLeft ProcSectionRight ProcDivAndID ProcDiv ProcID FileSec WSSec LinkageSec LSSec ProgID Statements Statement Expr StopRun DoubleDigit Condition Operator Nines IntPicClause StringPicClause FloatClause UnsignedClause NumberClause IDClause Xs 

%start CobolProgram

%%

/* the test program doesn't have a data division, but we will need one as that's how you define variables in cobol */



/* basic structure of the current cobol test program */

CobolProgram:	Modules { printf("\n RECOGNIZED PROGRAM: COBOL Program End\n\n");
					  printf("------------Start of AST------------\n");
					  $$ = $1;
					  //printAST($$,0);
					  
					  //manualAST($$);
					  
					  printf("\n------------End of AST------------\n");
									  
};

/*Modules can be recursive to implement any amount of modules in any order or a single module*/
Modules: 	

		Module Modules {
				printf("\n MODULE MODULES: Module End\n\n");
				printf("\nDollar 1 = ");
				printf($1);
				printf("\nDollar 2 = ");
				printf($2);

				// ast
				$1->left = $2;
				$$ = $1;
			}
		| Module {  
				printf("\n MODULE: Module End\n\n");
				printf("\nDollar 1 = ");
				printf($1);

				// ast
				$$ = $1;
};

Module: 
		
		STOP {
			$$ = $1;
			printf("\nEOF\n");
		}

		/*
		ID PERIOD{
			$$ = $1;
			}
		|
		*/
		
		| Module1{printf("\n RECOGNIZED MODULE: Module1 End\n\n");

				printf("\nDollar 1 = ");
				printf($1);

				// ast
				$$ = $1;
				
				}
		| Module2{printf("\n RECOGNIZED MODULE: Module2 End\n\n");

				printf("\nDollar 1 = ");
				printf($1);		

				// ast
				$$ = $1;
				
				}
		| Module3{printf("\n RECOGNIZED MODULE: Module3 End\n\n");
				printf("\nDollar 1 = ");
				printf($1);

				// ast
				$$ = $1;
				
				}
		| Module4{printf("\n RECOGNIZED MODULE: Module4 End\n\n");
				printf("\nDollar 1 = ");
				printf($1);

				// ast
				$$ = $1;
				
				}
;

/* part of the program including the identification division and the program id declaration */

Module1:	IDDiv ProgID { printf("\n RECOGNIZED MODULE: End Module 1: Identification Division\n\n"); 
						   printf("\nDollar 1 = ");
						   printf($1);
						   printf("\nDollar 2 = ");
						   printf($2);
						   //$1->left = $2;
						   //$$ = $1;

						   // ast
						   $$->left = $1;
						   $$->right = $2;
};

/* part of the program that contains the data division */

Module2:	DataSection { printf("\n RECOGNIZED MODULE: End Module 2: Data Division\n\n");
						printf("\nDollar 1 = ");
						printf($1);

						// ast
						$$ = $1;	
};


/* part of the program that contains the environment division */

Module3:	EnvDiv { printf("\n RECOGNIZED MODULE: End Module 2: Env Division\n\n");
					   printf("\nDollar 1 = ");
					   printf($1);

					   // ast
					   $$ = $1;					   
};




/* part of the program that contains the procedure division and everything that is inside it, which is statements since this is where all executable code is written */

Module4:	ProcSection { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division\n\n");

				printf("\nDollar 1 = ");
				printf($1);
				printf("\nDollar 2 = ");
				printf($2); 
				printf("\nDollar 3 = ");
				printf($3);

				// ast
				$$ = $1;

 }
			| ProcDivAndID StopRun { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division (no statements)\n\n");
							
				printf("\nDollar 1 = ");
				printf($1);
				printf("\nDollar 2 = ");
				printf($2); 
				printf("\nDollar 3 = ");
				printf($3);

				// ast
				$$->left = $1;
				$$->right = $2;

				/*

											             Module4
							    ProcDivAndID------------/       \-------------------------StopRun
						 ProcDiv            ProcID									  STOP       RUN
				PROCEDURE       DIVISON		  |
											  ID

				*/


};

ProcSection:	ProcSectionLeft ProcSectionRight {

					// ast
					$$->left = $1;
					$->right = $2;

	/*

											   ProcSection
					 ProcSectionLeft----------/           \-----------ProcSectionRight
			  ProcDiv               ProcID				     Statements				  \------StopRun
	 PROCEDURE		 DIVISION		  |			   Statements          Statement		 STOP       RUN
									  ID		...			Statement

	*/

};

ProcSectionLeft:	ProcDiv ProcID {

						// ast
						$$->left = $1;
						$$->right = $2;

	/*

						ProcSectionLeft
				 ProcDiv               ProcID
		PROCEDURE		DIVISION		 |
										 ID

	*/

};

ProcSectionRight:	Statements StopRun {

						// ast
						$$->left = $1;
						$$->right = $2;

	/*

								ProcSectionRight
					  Statements                \------StopRun
			Statements          Statement		   STOP       RUN
		 ...          Statement					 

	*/

};

ProcDivAndID:	ProcDiv ProcID {

					// ast
					$$->left = $1;
					$$->right = $2;

	/*

						ProcDivAndID
				ProcDiv				\---ProcID
	   PROCEDURE       DIVISION			   |
	   									  ID

	*/

};	

ProcID:	ID PERIOD { printf("\n RECOGNIZED RULE: Procedure ID Declaration\n\n");

			printf("\nDollar 1 = ");
			printf($1);
		
			// ast
			$$ = $1;

};

ProgID:		PROGRAMID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program ID Declaration\n\n");
		
				printf("\nDollar 1 = ");
				printf($1);
				printf("\nDollar 3 = ");
				printf($3);
				
				// ast
				$$->left = $3;
				$$->right = $1;

				/*

					 ProgID
				  ID	   PROGRAMID

				*/


};


/* this is a recursive way to read however many statements in the procedure division */

Statements:	
		
		Statement Statements { 

			printf("\nDollar 1 = ");
			printf($1);
			printf("\nDollar 2 = ");
			printf($2);

			// ast
			$$->left = $3;
			$$->right = $1;

			/*

													Statements
										Statements           Statement
							Statements            Statement		 |
				Statements            Statement		  |         Expr
			 ...						  |          Expr
			 							Expr

			*/
		}

		| Statement {	

			printf("\nDollar 1 = ");
			printf($1);

			// ast
			$$ = $1;

};


/* statements in cobol, currently only contains the one used in the test program and one extra */
/* this needs to be updated to have all cobol statements */
/* use '|' to put multiple different statements in here */



/* A statement can be a period or an expression with a period. *Note in cobol expressions technically dont need periods sometimes so maybe worth looking into */
Statement:	Expr PERIOD {

			printf("\nDollar 1 = ");
			printf($1);

			// ast
			$$ = $1;

};
							
			/* this needs to be redone, as we need to check for a period inside each
			expression, not up here. if we don't check in each expression, we will not
			get the print statements when the function does not include a period */



Expr:   | DISPLAY STRING { 

			printf("\n RECOGNIZED RULE: Display Call\n");
			printf($2);
			printf("\nDollar 2 = ");
            printf(" JAVA: system.out.println('%s');\n\n",$2);
			/* this doesn't put the string in the java 'code' currently */

			// ast
			$$->left = $1;
			$$->right = $2;
			/*

					Expr
			DISPLAY	     STRING

			*/
		}
		| DISPLAY STRING COMMA ID { 

			printf("\n RECOGNIZED RULE: Display Call With Concatenation\n");
            printf(" JAVA: system.out.println('%s' + ID);\n\n",$2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
			/* for some reason only the DISPLAY STRING worked without including PERIOD */
			/* this and all below require it for period to be parsed inside the function call */
			/* this means that all function calls only work with periods. */

			// ast
			$$->left = $1;
			$1-left = $2;
			$1-right = $4;
			/*

							Expr
					DISPLAY		 NULL
	 		 STRING		   ID
			
			*/
		}

		| ACCEPT ID {

			printf("\n RECOGNIZED RULE: Accept ID\n");
			printf(" JAVA: %s = input.nextLine();\n\n", $2);
			printf("\nDollar 2 = ");
		    printf($2);

			// ast
			$$->left = $1;
			$$->right = $2;
			/*

					Expr
			 ACCEPT	     ID

			*/

		}

		| IF Condition THEN Statement ENDIF { 

			printf("\n RECOGNIZED RULE: If Statement");
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $2;
			$1->right = $4;

			/*

							Expr
					 		 |
			 		 		 IF
					Condition   \------------Statement
						|							   Expr
		(e.g EQ-OP)  Operator						...    ...
		 		  ID         ID

			*/
			
		}

		| PERFORM Statement UNTIL Condition {printf("\n RECOGNIZED RULE: While loop");

			// this is kinda iffy

			// ast
			$$->left = $4;
			$$->right = $2;

			/*

								Expr
					  Condition     \------------Statement
						  |							       Expr
		  (e.g EQ-OP)  Operator							...    ...
			 		ID         ID

			*/

		}
		
		| PERFORM Statement NUMBER TIMES {printf("\n RECOGNIZED RULE: For loop");

			printf("JAVA: for(int i=0; i<%i;i++) {$2}",$3);
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 3 = ");
			printf($3);

			// ast
			
			/*

											Expr
						 LT_EQ_OP---------/     \--Statement
			   iteration		 NUMBER				        Expr
					  									 ...    ...

			*/
			
		}


		/* define any byte-sized integer variable in cobol */

		/* to define an integer in cobol you use 9's as how many bytes you want the integer to be in the range of, e.g. 999 means 0-999 */
		/* only problem here is it seeing a 9 and making sure it calls it a NINE and not a NUMBER, but maybe that doesn't matter? */
		/* variables aren't really defined fully in java until they get called in the procedure division so this might be a mess to translate to java */
		| DoubleDigit ID PICTURE IS Nines { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");

			printf("JAVA: int $2 = $5");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 5 = ");
			printf($5);
			
		}
		| DoubleDigit ID PIC Nines { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");

			printf("JAVA: int $2 = $4");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

		}
		| DoubleDigit ID PIC IntPicClause { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");

			printf("JAVA: int $2 = $4");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

		}

		/* define any byte-sized float variable in cobol */
		/* to do this you put a V between 9's wherever you want the decimal to be located, e.g. 99V999 allows for 00.000-99.999 */
		/* similar problem as above, is V called as a character or LETTERV? */
		| DoubleDigit ID PICTURE IS FloatClause { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 1");

			printf("JAVA: float %s = $5", $2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 5 = ");
			printf($5);

		}
		| DoubleDigit ID PIC FloatClause { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 2");

			printf("JAVA: float %s = $4", $2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

		}

		/* define any byte-sized un-signed variable in cobol */
		/* to do this you put an S before however many 9's as bytes, e.g. S999 allows for 0-999 bytes while being un-signed */
		| DoubleDigit ID PICTURE IS UnsignedClause { printf("\n RECOGNIZED RULE: Any-Digit Un-Signed Variable Declaration: Type 1");

			printf("JAVA: needs extra package");

		}
		| DoubleDigit ID PIC UnsignedClause { printf("\n RECOGNIZED RULE: Any-Digit Un-Signed Variable Declaration: Type 2");

			printf("JAVA: needs extra package");

		}

		/* define any byte-sized string variable in cobol */
		/* strings aren't assigned to the variable in cobol until they do so in the procedure division, so translating this to java will be a mess */
		| DoubleDigit ID PICTURE IS Xs { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");

			printf("JAVA: String %s = $5", $2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 5 = ");
			printf($5);

		}
		| DoubleDigit ID PIC Xs { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");

			printf("JAVA: String %s = $4", $2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

		}
		| DoubleDigit ID PIC StringPicClause { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");

			printf("JAVA: String %s = $4", $2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

		}


		/* add statement */

		/* using a single literal input */
		| ADD NUMBER TO ID { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input");

			printf("JAVA: %s = %s + %i", $4, $4, $2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $2;
			$1->right = $4;

			/*

						Expr
						 |
						ADD
				 NUMBER    ID

			*/

		}
		/* using a single id input */
		| ADD ID TO ID { printf("\n RECOGNIZED RULE: Add Statement: Single ID Input");

			printf("JAVA: %s = %s + %s", $4, $4, $2); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $2;
			$1->right = $4;

			/*

						Expr
						 |
						ADD
				     ID    ID

			*/
		}
		/* using multiple literal inputs */
		| ADD NumberClause TO ID { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs");

			printf("JAVA: %s = %s + $2", $4, $4); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $2;
			$1->right = $4;

			/*

														Expr
														 |
														ADD
									NumberClause-------/   \---------ID
						NumberClause	        NUMBER
			NumberClause            NUMBER
		 ...

			*/
		}
		/* using multiple id inputs */
		| ADD IDClause TO ID { printf("\n RECOGNIZED RULE: Add Statement: Multiple ID Inputs");

			printf("JAVA: %s = %s + $2", $4, $4); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $2;
			$1->right = $4;

			/*

												Expr
												 |
												ADD
								IDClause-------/   \---------ID
						IDClause	    ID
			    IDClause        ID
			 ...

			*/

		}
		/* using a single literal input & multiple id outputs */
		| ADD NUMBER TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input & Multiple ID Outputs");

			printf("JAVA: $4 = $4 + %i", $2); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $4;
			$1->right = $2;

			/*

												Expr
												 |
												ADD
								IDClause-------/   \---------NUMBER
						IDClause	    ID
			    IDClause        ID
			 ...

			*/
		}
		/* using multiple literal inputs & multiple id outputs */
		| ADD NumberClause TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs & Multiple ID Outputs");

			printf("JAVA: $4 = $4 + $2"); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			/*

														Expr
														 |
														ADD
									NumberClause-------/   \--------------IDClause
						NumberClause	        NUMBER      	  IDClause        ID
			NumberClause            NUMBER                IDClause		  ID
		 ...										   ...

			*/
		}
		/* using a single id input & multiple id outputs */
		| ADD ID TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");

			printf("JAVA: $4 = $4 + %s", $2); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $4;
			$1->right = $2;

			/*

												Expr
												 |
												ADD
								IDClause-------/   \---------ID
						IDClause	    ID
			    IDClause        ID
			 ...

			*/

		}
		/* using multiple id inputs & multiple id outputs */
		| ADD IDClause TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");

			printf("JAVA: $4 = $4 + $2"); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);

			// ast
			$$ = $1;
			$1->left = $2;
			$1->right = $4;

			/*

													Expr
													 |
													ADD
									IDClause-------/   \--------------IDClause
						    IDClause	    ID      	      IDClause        ID
			        IDClause        ID                IDClause		  ID
		         ...							   ...

			*/

		}

;


/* Need to figure out how to set up Condition */
Condition:	ID Operator ID {
		
			// ast
			$$ = $2;
			$2->left = $1;
			$2->right = $3;

			/*

					Operator
			 	 ID	        ID

			*/

		} 
		| ID Operator NUMBER {

			// ast
			$$ = $2;
			$2->left = $1;
			$2->right = $3;

			/*

					Operator
			 	 ID	        NUMBER

			*/

		}
;

/* Need to list all operators. Can be >, <, =, ==, >=, <=, != */
Operator:	GT_OP {$$ = $1;} | LT_OP {$$ = $1;} | EQ_OP {$$ = $1;} | DOUBLE_EQ_OP {$$ = $1;} | GT_EQ_OP {$$ = $1;} | LT_EQ_OP {$$ = $1;}
;

DoubleDigit: {printf("DOUBLEDIGIT EMPTY RULE");}	

	| DIGIT DIGIT { printf("\n RECOGNIZED RULE: Double Digit\n");
	
};

Nines:	| NINE Nines { printf("\n RECOGNIZED RULE: Nines\n");
};

Xs:	| LETTERX Xs { printf("\n RECOGNIZED RULE: X's\n");
};

IntPicClause:	NINE OPEN_PARENTHESES NUMBER CLOSE_PARENTHESES { printf("\n RECOGNIZED RULE: Integer Pic Clause\n");
};

FloatClause: Nines LETTERV Nines { printf("\n RECOGNIZED RULE: Float Clause\n");
};

UnsignedClause:	LETTERS Nines { printf("\n RECOGNIZED RULE: Un-signed Clause\n");
};

StringPicClause:	LETTERX OPEN_PARENTHESES NUMBER CLOSE_PARENTHESES { printf("\n RECOGNIZED RULE: String Pic Clause\n");
};

NumberClause:	NUMBER COMMA NumberClause {
				printf("\n RECOGNIZED RULE: Number Clause\n");

				// ast
				$$->left = $3;
				$$->right = $1;

				/*

													NumberClause
										NumberClause            NUMBER
							NumberClause            NUMBER
				NumberClause            NUMBER
			 ...

				*/

			}   | NUMBER { 
				printf("\n RECOGNIZED RULE: Number Clause\n");

				// ast
				$$ = $1;

};

IDClause:	ID COMMA IDClause {
			printf("\n RECOGNIZED RULE: ID Clause\n");

			// ast
			$$->left = $3;
			$$->right = $1;

			/*

											IDClause
								   IDClause         ID
					      IDClause         ID
		         IDClause         ID
			  ...

			*/


		}   | ID { 
			printf("\n RECOGNIZED RULE: ID Clause\n");

			// ast
			$$ = $1;

};


/* identification division declaration in cobol */
/* recognize an identification division declaration if line is in order: */
/* IDENTIFICATION, DIVISION, . */

IDDiv:	IDENTIFICATION DIVISION PERIOD { 
	printf("\n RECOGNIZED DIVISION: Identification Division Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

				   IDDiv
 	 IDENTIFICATION     DIVISION

	*/

};


/* environment division declaration in cobol */
/* recognize an environment division declaration if line is in order: */
/* ENVIRONMENT, DIVISION, . */

EnvDiv:	ENVIRIONMENT DIVISION PERIOD { 
	printf("\n RECOGNIZED DIVISION: Environment Division Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

				   EnvDiv
 	    ENVIRONMENT      DIVISION

	*/

};

/* data division declaration in cobol */
/* recognize an environment division declaration if line is in order: */
/* DATA, DIVISION, . */		

DataDiv:	DATA DIVISION PERIOD {
	printf("\n RECOGNIZED DIVISION: Data Division Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

		   DataDiv
	   DATA       DIVISION

	*/

};	

DataSection: DataDiv Sections{

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

				   DataSection
 	    	DataDiv           \--------------------Sections
		DATA       DIVISION						       |
											    	Section
											Sections
										 	   |
					 						Section
									Sections
										|
			 						 Section
		 						  ...		
	*/
	
};

Sections: Section Sections {

		// ast
		$1->left = $2;
		$$ = $1;

		/*

							Sections
							    |
							 Section
					 Sections
					 	|
					 Section
			 Sections
				|
			 Section
		  ...

		*/

		// ^^^^ THIS MIGHT NEED TO BE CHANGED, I THINK THE WAY NumberClause WORKS MAKES MORE SENSE, THIS MIGHT BE WHY OUR DISPLAY BREAKS?
		// ALTHOUGH THEY COULD BOTH BE VIABLE SOLUTIONS TO THE SAME RECURSION

	}
	| Section {

		// ast
		$$ = $1;

	}

Section:	LSSec {$$ = $1;} | FileSec {$$ = $1;} | LinkageSec {$$ = $1;} | WSSec {$$ = $1;}
;	


/* sections of the data division include the file section, */

FileSec:	FILEE SECTION PERIOD { printf("\n RECOGNIZED SECTION: File Section Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

			FileSec
	  FILEE		   SECTION

	*/

};

LinkageSec:	LINKAGE SECTION PERIOD {printf("\n RECOGNIZED SECTION: Linkage Section Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

			LinkageSec
	 LINKAGE		  SECTION

	*/

};

LSSec: LOCALSTORAGE SECTION PERIOD {printf("\n RECOGNIZED SECTION: Local-Storage Section Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

				  LSSec
	  LOCALSTORAGE     SECTION

	*/

};

WSSec:	WORKINGSTORAGE SECTION PERIOD { printf("\n RECOGNIZED SECTION: Working-Storage Section Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

					WSSec
	  WORKINGSTORAGE     SECTION

	*/

};

/* procedure division declaration in cobol */
/* recognize a procedure division declaration if line is in order: */
/* PROCEDURE, DIVISION, . */

ProcDiv:	PROCEDURE DIVISION PERIOD { printf("\n RECOGNIZED DIVISION: Procedure Division Declaration\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

		        ProcDiv
	   PROCEDURE       DIVISION

	*/

};


/* stop run call in cobol */

StopRun:	STOP RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run\n\n");

	// ast
	$$->left = $1;
	$$->right = $2;

	/*

		   StopRun
	   STOP       RUN

	*/

};



%%

int main(int argc, char**argv)	
{
	/*
	#ifdef YYDEBUG
		yydebug = 1;
	#endif
	*/
	

	printf("\n\n##### COMPILER STARTED #####\n\n");
	
	if (argc > 1){
	  if(!(yyin = fopen(argv[1], "r")))
          {
		perror(argv[1]);
		return(1);
	  }
	}
	yyparse();
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}
