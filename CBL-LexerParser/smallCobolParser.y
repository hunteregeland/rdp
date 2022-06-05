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
%token <string> COUNT
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

%type <ast> Program Modules Module Module1 Module2 Module3 IDDiv EnvDiv DataDiv ProcDiv ProcID FileSec WSSec ProgID Statements Statement Expr StopRun DoubleDigit Condition Operator Nines IntPicClause StringPicClause FloatClause UnsignedClause NumberClause IDClause Xs 

%start Program

%%

/* the test program doesn't have a data division, but we will need one as that's how you define variables in cobol */



/* basic structure of the current cobol test program */

Program:	Modules { printf("\n RECOGNIZED PROGRAM: COBOL Program End\n\n");
					  printf("------------Start of AST------------\n");
					   $$ = $1;
					   printAST($$,0);
					  printf("\n------------End of AST------------\n");
									  
};

/*Modules can be recursive to implement any amount of modules in any order or a single module*/
Modules: Module Modules{printf("\n MODULE MODULES: Module End\n\n");
						 printf("\nDollar 1 = ");
						 printf($1);
						 printf("\nDollar 2 = ");
						 printf($2);
						 //$1->left = $2;
						 $$ = $1;
						}
		| Module {  printf("\n MODULE: Module End\n\n");
					printf("\nDollar 1 = ");
					printf($1);
					 $$ = $1;
};

Module: Module1{printf("\n RECOGNIZED MODULE: Module1 End\n\n");
				printf("\nDollar 1 = ");
				printf($1);
				//$$ = $1;
				}
		| Module2{printf("\n RECOGNIZED MODULE: Module2 End\n\n");
				printf("\nDollar 1 = ");
				printf($1);		
				//$$ = $1;
				}
		| Module3{printf("\n RECOGNIZED MODULE: Module3 End\n\n");
				printf("\nDollar 1 = ");
				printf($1);
				//$$ = $1;
				}
;

/* part of the program including the identification division and the program id declaration */
/* lines 1 & 2 */

Module1:	IDDiv ProgID { printf("\n RECOGNIZED MODULE: End Module 1: Identification Division\n\n"); 
						   printf("\nDollar 1 = ");
						   printf($1);
						   printf("\nDollar 2 = ");
						   printf($2);
						   
						   //$1->left = $2;
						   //$$ = $1;
};



/* part of the program that contains the environment division */
/* line 3 */

Module2:	EnvDiv DataDiv { printf("\n RECOGNIZED MODULE: End Module 2: Environment & Data Division\n\n"); 
						 	 printf("\nDollar 1 = ");
						 	 printf($1);
						 	 printf("\nDollar 2 = ");
						 	 printf($2);} 
			| DataDiv { printf("\n RECOGNIZED MODULE: End Module 2: Data Division (No Env Division)\n\n");
						printf("\nDollar 1 = ");
						printf($1);
			}
			| EnvDiv { printf("\n RECOGNIZED MODULE: End Module 2: Env Division (No Data Division)\n\n");
					   printf("\nDollar 1 = ");
					   printf($1);
};


/* part of the program that contains the procedure division and everything that is inside it, which is statements since this is where all executable code is written */
/* lines 4-6 */

Module3:	ProcDiv ProcID Statements StopRun { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division\n\n");
							 printf("\nDollar 1 = ");
						 	 printf($1);
						 	 printf("\nDollar 2 = ");
						 	 printf($2); 
							 printf("\nDollar 3 = ");
						 	 printf($3);
 }
			| ProcDiv ProcID StopRun { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division (no statements)\n\n");
							 printf("\nDollar 1 = ");
						 	 printf($1);
						 	 printf("\nDollar 2 = ");
						 	 printf($2); 
							 printf("\nDollar 3 = ");
						 	 printf($3);
};


/* the program id syntax, this is the part of line 2 that defines the program name */
/* line 2 */
/* this needs to be fixed, we cannot recognize PROGRAM-ID currently */

ProgID:		PROGRAMID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program ID Declaration\n\n");
							printf("\nDollar 1 = ");
						 	 printf($1);
						 	 printf("\nDollar 3 = ");
						 	 printf($3); 
};

ProcID:	ID PERIOD { printf("\n RECOGNIZED RULE: Procedure ID Declaration\n\n");
							 printf("\nDollar 1 = ");
						 	 printf($1);

};


/* this is a recursive way to read however many statements in the procedure division */

Statements:	Statement {//$$ = $1;
							 printf("\nDollar 1 = ");
						 	 printf($1);

}
	| Statement Statements {//$$ = $2;
							 printf("\nDollar 1 = ");
						 	 printf($1);
							 printf("\nDollar 2 = ");
						 	 printf($2);

	}
;


/* statements in cobol, currently only contains the one used in the test program and one extra */
/* this needs to be updated to have all cobol statements */
/* use '|' to put multiple different statements in here */



/* A statement can be a period or an expression with a period. *Note in cobol expressions technically dont need periods sometimes so maybe worth looking into */
Statement:	Expr PERIOD {//$$ = $1; 
							 printf("\nDollar 1 = ");
						 	 printf($1);
}
							
				/* this needs to be redone, as we need to check for a period inside each
				expression, not up here. if we don't check in each expression, we will not
				get the print statements when the function does not include a period */
;


Expr:    DISPLAY STRING { printf("\n RECOGNIZED RULE: Display Call\n");
						  printf("\nDollar 2 = ");
						  printf($2);
            printf(" JAVA: system.out.println('%s');\n\n",$2);
			/* this doesn't put the string in the java 'code' currently */
		}
		| DISPLAY STRING COMMA ID { printf("\n RECOGNIZED RULE: Display Call With Concatenation\n");
            printf(" JAVA: system.out.println('%s' + ID);\n\n",$2);
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
			/* for some reason only the DISPLAY STRING worked without including PERIOD */
			/* this and all below require it for period to be parsed inside the function call */
			/* this means that all function calls only work with periods. */
		}

		| ACCEPT ID {printf("\n RECOGNIZED RULE: Accept ID\n");
			printf(" JAVA: %s = input.nextLine();\n\n", $2);
			printf("\nDollar 2 = ");
		    printf($2);
		}

		| IF Condition THEN Statement ENDIF { printf("\n RECOGNIZED RULE: If Statement");
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
			/* makeTree(,,) */
		}

		| PERFORM Statement UNTIL COUNT Operator NUMBER {printf("\n RECOGNIZED RULE: While loop");
			printf("JAVA: while($4 $5 %i) $2}",$6);
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 5 = ");
			printf($5);
			printf("\nDollar 6 = ");
			printf($6);
		}
		
		| PERFORM Statement NUMBER TIMES {printf("\n RECOGNIZED RULE: For loop");
			printf("JAVA: for(int i=0; i<%i;i++) {$2}",$3);
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 3 = ");
			printf($3);
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
		}
		/* using a single id input */
		| ADD ID TO ID { printf("\n RECOGNIZED RULE: Add Statement: Single ID Input");
			printf("JAVA: %s = %s + %s", $4, $4, $2); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}
		/* using multiple literal inputs */
		| ADD NumberClause TO ID { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs");
			printf("JAVA: %s = %s + $2", $4, $4); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}
		/* using multiple id inputs */
		| ADD IDClause TO ID { printf("\n RECOGNIZED RULE: Add Statement: Multiple ID Inputs");
			printf("JAVA: %s = %s + $2", $4, $4); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}
		/* using a single literal input & multiple id outputs */
		| ADD NUMBER TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %i", $2); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}
		/* using multiple literal inputs & multiple id outputs */
		| ADD NumberClause TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}
		/* using a single id input & multiple id outputs */
		| ADD ID TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %s", $2); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}
		/* using multiple id inputs & multiple id outputs */
		| ADD IDClause TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
			printf("\nDollar 2 = ");
			printf($2);
			printf("\nDollar 4 = ");
			printf($4);
		}

;


/* Need to figure out how to set up Condition */
Condition:	ID Operator ID {
			//makeTree(,,)
		} 
		| ID Operator NUMBER {

		}/* add? -> $$ = $1, $2, $3*/
;

/* Need to list all operators. Can be >, <, =, ==, >=, <=, != */
Operator:	GT_OP {} | LT_OP {} | EQ_OP {} | DOUBLE_EQ_OP {} | GT_EQ_OP {} | LT_EQ_OP {
};

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

NumberClause:	| NUMBER COMMA NumberClause {} | NUMBER { printf("\n RECOGNIZED RULE: Number Clause\n");
};

IDClause:	ID COMMA IDClause {} | ID { printf("\n RECOGNIZED RULE: ID Clause\n");
};


/* identification division declaration in cobol */
/* recognize an identification division declaration if line is in order: */
/* IDENTIFICATION, DIVISION, . */

IDDiv:	IDENTIFICATION DIVISION PERIOD { printf("\n RECOGNIZED DIVISION: Identification Division Declaration\n\n");
};


/* environment division declaration in cobol */
/* recognize an environment division declaration if line is in order: */
/* ENVIRONMENT, DIVISION, . */

EnvDiv:	ENVIRIONMENT DIVISION PERIOD { printf("\n RECOGNIZED DIVISION: Environment Division Declaration\n\n");
};

/* data division declaration in cobol */
/* recognize an environment division declaration if line is in order: */
/* DATA, DIVISION, . */

DataDiv: 	DATA DIVISION PERIOD FileSec WSSec { printf("\n RECOGNIZED DIVISION: Data Division Declaration\n\n");
};
/* THIS ONLY WORKS IF ALL SECTIONS ARE INCLUDED CURRENTLY */

/* sections of the data division include the file section, */
/* working-storage section, local-storage section, and */
/* linkage section. these are defined below */

FileSec:	FILEE SECTION PERIOD { printf("\n RECOGNIZED SECTION: File Section Declaration\n\n");
};

WSSec:	WORKINGSTORAGE SECTION PERIOD { printf("\n RECOGNIZED SECTION: Working-Storage Section Declaration\n\n");
};

/* procedure division declaration in cobol */
/* recognize a procedure division declaration if line is in order: */
/* PROCEDURE, DIVISION, . */

ProcDiv:	PROCEDURE DIVISION PERIOD { printf("\n RECOGNIZED DIVISION: Procedure Division Declaration\n\n");
};


/* stop run call in cobol (line 6) */
/* recognize display if the line is in order: */
/* STOP, RUN, . */

StopRun:	STOP RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run\n\n");
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
