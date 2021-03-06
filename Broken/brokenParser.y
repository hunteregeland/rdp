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
%token <string> FILE
%token <string> WORKINGSTORAGE
%token <string> LINKAGE
%token <string> SCREEN
%token <string> SECTION
%token <string> PROCEDURE
%token <string> DIVISION

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
%token <string> DOUBLE_EQ_OP
%token <string> GT_EQ_OP
%token <string> LT_EQ_OP

%token <character> PERIOD
%token <character> COMMA
%token <character> GT_OP
%token <character> LT_OP
%token <character> EQ_OP
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

%type <ast> Program Module1 Module2 Module3 Module4 IDDiv DataDiv EnvDiv ProcDiv ProgID FileSec WSSec LinkSec ScrSec Statements Statement Expr StopRun DoubleDigit Condition Operator Nines IntPicClause StringPicClause FloatClause UnsignedClause NumberClause IDClause Xs

%start Program

%%

/* the test program doesn't have a data division, but we will need one as that's how you define variables in cobol */



/* basic structure of the current cobol test program */

Program:	Module1 {printf("\n\nModule 1 done\n\n");} Module2 {printf("\n\nModule 2 done\n\n");} Module3 {printf("\n\nModule 3 done\n\n");} Module4 { printf("\n RECOGNIZED RULE: COBOL Program Start\n");
};


/* part of the program including the identification division and the program id declaration */

Module1:	IDDiv ProgID { printf("\n RECOGNIZED RULE: Module1: Identification Division\n"); 
};

/* part of the program including the data division and underlying sections */
/* FileSec Statements WSSec Statements LinkSec Statements ScrSec Statements */

Module2:	DataDiv { printf("\n RECOGNIZED RULE: Module2: Data Division\n");
};

/* part of the program that contains the environment division */

Module3:	EnvDiv { printf("\n RECOGNIZED RULE: Module3: Environment Division\n");
};


/* part of the program that contains the procedure division and everything that is inside it, which is statements since this is where all executable code is written */

Module4:	ProcDiv Statements StopRun { printf("\n RECOGNIZED RULE: Module4: Procedure Division\n");
};


/* the program id syntax, this is the part of line 2 that defines the program name */
/* line 2 */
/* this needs to be fixed, we cannot recognize PROGRAM-ID currently */

ProgID:		PROGRAMID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program Start\n");
};

FileSec:	| FILE SECTION PERIOD { printf("\n RECOGNIZED RULE: File Section Declaration\n");
};

WSSec:	| WORKINGSTORAGE SECTION PERIOD { printf("\n RECOGNIZED RULE: Working-Storage Section Declaration\n");
};

LinkSec:	| LINKAGE SECTION PERIOD { printf("\n RECOGNIZED RULE: Linkage Section Declaration\n");
};

ScrSec:	| SCREEN SECTION PERIOD { printf("\n RECOGNIZED RULE: Screen Section Declaration\n");
};


/* this is a recursive way to read however many statements in the procedure division */

Statements:	
	| Statement Statements {$$ = $2;}
;


/* statements in cobol, currently only contains the one used in the test program and one extra */
/* this needs to be updated to have all cobol statements */
/* use '|' to put multiple different statements in here */


/* A statement can be a period or an expression with a period. *Note in cobol expressions technically dont need periods sometimes so maybe worth looking into */
Statement:        PERIOD {} | Expr PERIOD {$$ = $1; }
							| Expr {$$ = $1; }
;

Expr:    DISPLAY STRING { printf("\n RECOGNIZED RULE: Display Call\n");
            printf("JAVA: system.out.println('%s');",$2);
		}

		| ACCEPT ID {printf("\n RECOGNIZED RULE: Accept ID\n");
			printf("JAVA: %s = input.nextLine();",$2);
		}

		| IF Condition THEN Statement ENDIF { printf("\n RECOGNIZED RULE: If Statement");
			printf("JAVA: if($2) {$4}");
			/* makeTree(,,) */
		}

		| PERFORM Statement UNTIL COUNT Operator NUMBER {printf("\n RECOGNIZED RULE: While loop");
			printf("JAVA: while($4 $5 %i) $2}",$6);
		}
		
		| PERFORM Statement NUMBER TIMES {printf("\n RECOGNIZED RULE: For loop");
			printf("JAVA: for(int i=0; i<%i;i++) {$2}",$3);
		}

		/* define any byte-sized integer variable in cobol */
		/* to define an integer in cobol you use 9's as how many bytes you want the integer to be in the range of, e.g. 999 means 0-999 */
		/* only problem here is it seeing a 9 and making sure it calls it a NINE and not a NUMBER, but maybe that doesn't matter? */
		/* variables aren't really defined fully in java until they get called in the procedure division so this might be a mess to translate to java */
		| DoubleDigit ID PICTURE IS Nines { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");
			printf("JAVA: int $2 = $5");
		}
		| DoubleDigit ID PIC Nines { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: int $2 = $4");
		}
		| DoubleDigit ID PIC IntPicClause { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: int $2 = $4");
		}

		/* define any byte-sized float variable in cobol */
		/* to do this you put a V between 9's wherever you want the decimal to be located, e.g. 99V999 allows for 00.000-99.999 */
		/* similar problem as above, is V called as a character or LETTERV? */
		| DoubleDigit ID PICTURE IS FloatClause { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 1");
			printf("JAVA: float %s = $5", $2);
		}
		| DoubleDigit ID PIC FloatClause { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 2");
			printf("JAVA: float %s = $4", $2);
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
		}
		| DoubleDigit ID PIC Xs { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: String %s = $4", $2);
		}
		| DoubleDigit ID PIC StringPicClause { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: String %s = $4", $2);
		}

		/* add statement */

		/* using a single literal input */
		| ADD NUMBER TO ID { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input");
			printf("JAVA: %s = %s + %i", $4, $4, $2);
		}
		/* using a single id input */
		| ADD ID TO ID { printf("\n RECOGNIZED RULE: Add Statement: Single ID Input");
			printf("JAVA: %s = %s + %s", $4, $4, $2); 
		}
		/* using multiple literal inputs */
		| ADD NumberClause TO ID { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs");
			printf("JAVA: %s = %s + $2", $4, $4); 
		}
		/* using multiple id inputs */
		| ADD IDClause TO ID { printf("\n RECOGNIZED RULE: Add Statement: Multiple ID Inputs");
			printf("JAVA: %s = %s + $2", $4, $4); 
		}
		/* using a single literal input & multiple id outputs */
		| ADD NUMBER TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %i", $2); 
		}
		/* using multiple literal inputs & multiple id outputs */
		| ADD NumberClause TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
		}
		/* using a single id input & multiple id outputs */
		| ADD ID TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %i", $2); 
		}
		/* using multiple id inputs & multiple id outputs */
		| ADD IDClause TO IDClause { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
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

DoubleDigit:	| DIGIT DIGIT { printf("\n RECOGNIZED RULE: Double Digit\n");
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

NumberClause:	NUMBER COMMA NumberClause { printf("\n RECOGNIZED RULE: Number Clause\n");
};

IDClause:	ID COMMA IDClause { printf("\n RECOGNIZED RULE: ID Clause\n");
};


/* identification division declaration in cobol (line 2) */
/* recognize an identification division declaration if line is in order: */
/* IDENTIFICATION, DIVISION, . */

IDDiv:	IDENTIFICATION DIVISION PERIOD { printf("\n RECOGNIZED RULE: Identification Division Declaration\n");
};

/* data division declaration in cobol (line 3) */
/* recognize an data division declaration if line is in order: */
/* DATA, DIVISION, . , FILE, SECTION, WORKING-STORAGE, SECTION, ETC.*/

DataDiv:	DATA DIVISION PERIOD { printf("\n RECOGNIZED RULE: Data Division Declaration\n");
};	

/* environment division declaration in cobol (line 3) */
/* recognize an environment division declaration if line is in order: */
/* ENVIRONMENT, DIVISION, . */

EnvDiv:	ENVIRIONMENT DIVISION PERIOD { printf("\n RECOGNIZED RULE: Environment Division Declaration\n");
};


/* procedure division declaration in cobol (line 4) */
/* recognize a procedure division declaration if line is in order: */
/* PROCEDURE, DIVISION, . */

ProcDiv:	PROCEDURE DIVISION PERIOD { printf("\n RECOGNIZED RULE: Procedure Division Declaration\n");
/* probably also need a way to carry anything in indented lines under this under the procedure division */
};


/* stop run call in cobol (line 6) */
/* recognize display if the line is in order: */
/* STOP, RUN, . */

StopRun:	STOP RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run\n");
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
