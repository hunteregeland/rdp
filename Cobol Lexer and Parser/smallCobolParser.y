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

%token <character> PERIOD
%token <character> APOSTROPHE
%token <character> GT_OP
%token <character> LT_OP
%token <character> EQ_OP
%token <character> DOUBLE_EQ_OP
%token <character> GT_EQ_OP
%token <character> LT_EQ_OP
%token <character> OPEN_PARENTHESES
%token <character> CLOSE_PARENTHESES

%token <character> NINE
%token <character> LETTERV
%token <character> LETTERS
%token <character> LETTERX

%printer { fprintf(yyoutput, "%s", $$); } ID;
%printer { fprintf(yyoutput, "%d", $$); } NUMBER;
%printer { fprintf(yyoutput, "%d", $$); } DIGIT;

%type <ast> Program Module1 Module2 Module3 IDDiv EnvDiv ProcDiv ProgID Statements Statement Expr Display StopRun DoubleDigit PicClause

%start Program

%%

/* the test program doesn't have a data division, but we will need one as that's how you define variables in cobol */



/* basic structure of the current cobol test program */

Program:	Module1 Module2 Module3 { printf("\n RECOGNIZED RULE: COBOL Program Start %s\n");
};


/* part of the program including the identification division and the program id declaration */
/* lines 1 & 2 */

Module1:	IDDiv ProgID { printf("\n RECOGNIZED RULE: Module1: Identification Division %s\n"); 
};


/* part of the program that contains the environment division */
/* line 3 */

Module2:	EnvDiv { printf("\n RECOGNIZED RULE: Module2: Environment Division %s\n");
};


/* part of the program that contains the procedure division and everything that is inside it, which is statements since this is where all executable code is written */
/* lines 4-6 */

Module3:	ProcDiv Statements StopRun { printf("\n RECOGNIZED RULE: Module3: Procedure Division %s\n");
};


/* the program id syntax, this is the part of line 2 that defines the program name */
/* line 2 */
/* this needs to be fixed, we cannot recognize PROGRAM-ID currently */

ProgID:		PROGRAMID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program Start %s\n");
};


/* this is a recursive way to read however many statements in the procedure division */

Statements:		| Statement Statements {$$ = $2}       		 
;


/* statements in cobol, currently only contains the one used in the test program and one extra */
/* this needs to be updated to have all cobol statements */
/* use '|' to put multiple different statements in here */


/* A statement can be a period or an expression with a period. *Note in cobol expressions technically dont need periods sometimes so maybe worth looking into */
Statement:        PERIOD {} | Expr PERIOD {$$ = $1; }
							| Expr {$$ = $1; }
;

Expr:    DISPLAY STRING { printf("\n RECOGNIZED RULE: Display Call %s\n", $2);
            printf("JAVA: system.out.println('%s');",$2);
		}

		| ACCEPT ID {$$ = AssignmentStatement("ACCEPT", $2);
			printf("JAVA: %s = scanner();",$2);
		}

		| IF Condition THEN Expr ENDIF { printf("\n RECOGNIZED RULE: If Statement");
			printf("JAVA: if(%s) {%s}",$2,$4);
		}

		| PERFORM Expr UNTIL COUNT Operator NUMBER {printf("\n RECOGNIZED RULE: While loop");
			printf("JAVA: while(%s %s %s) {%s}",$4,$5,$6,$2);
			}
		
		| PERFORM Expr NUMBER TIMES {printf("\n RECOGNIZED RULE: For loop");
			printf("JAVA: for(int i=0; i<%s;i++) {%s}",$3,$2);
			}
		/* define any byte-sized integer variable in cobol */
		/* to define an integer in cobol you use 9's as how many bytes you want the integer to be in the range of, e.g. 999 means 0-999 */
		/* only problem here is it seeing a 9 and making sure it calls it a NINE and not a NUMBER, but maybe that doesn't matter? */
		/* variables aren't really defined fully in java until they get called in the procedure division so this might be a mess to translate to java */
		| DoubleDigit ID PICTURE IS Nines { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");
			printf("JAVA: int %s = %s", $2, $5);
		}
		| DoubleDigit ID PIC Nines { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: int %s = %s", $2, $4);
		}
		| DoubleDigit ID PIC IntPicClause { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: int %s = %s", $2, $4);
		}

		/* define any byte-sized float variable in cobol */
		/* to do this you put a V between 9's wherever you want the decimal to be located, e.g. 99V999 allows for 00.000-99.999 */
		/* similar problem as above, is V called as a character or LETTERV? */
		| DoubleDigit ID PICTURE IS FloatClause { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 1");
			printf("JAVA: float %s = %s", $2, $5);
		}
		| DoubleDigit ID PIC FloatClause { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 2");
			printf("JAVA: float %s = %s", $2, $4);
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
			printf("JAVA: String %s = %s", $2, $5);
		}
		| DoubleDigit ID PIC Xs { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: String %s = %s", $2, $4);
		}
		| DoubleDigit ID PIC StringPicClause { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: String %s = %s", $2, $4);
		}
;


/* Need to figure out how to set up Condition */
Condition:	ID Operator ID {} /* add? -> $$ = $1, $2, $3*/


/* Need to list all operators. Can be >, <, =, ==, >=, <=, != */
Operator:	GT_OP | LT_OP | EQ_OP | DOUBLE_EQ_OP | GT_EQ_OP | LT_EQ_OP

DoubleDigit:	| DIGIT DIGIT { printf("\n RECOGNIZED RULE: Double Digit %s\n");
};

Nines:	| NINE Nines { printf("\n RECOGNIZED RULE: Digits %s\n");
};

Xs:	| LETTERX Xs { printf("\n RECOGNIZED RULE: Digits %s\n");
};

IntPicClause:	NINE OPEN_PARENTHESES NUMBER CLOSE_PARENTHESES { printf("\n RECOGNIZED RULE: Integer Pic Clause %s\n");
};

FloatClause: Nines LETTERV Nines { printf("\n RECOGNIZED RULE: Float Clause %s\n");
};

UnsignedClause:	LETTERS Nines { printf("\n RECOGNIZED RULE: Un-signed Clause %s\n");
};

StringPicClause:	LETTERX OPEN_PARENTHESES NUMBER CLOSE_PARENTHESES { printf("\n RECOGNIZED RULE: String Pic Clause %s\n");
};

/* identification division declaration in cobol (line 2) */
/* recognize an identification division declaration if line is in order: */
/* IDENTIFICATION, DIVISION, . */

IDDiv:	IDENTIFICATION DIVISION PERIOD { printf("\n RECOGNIZED RULE: Identification Division Declaration %s\n");
};


/* environment division declaration in cobol (line 3) */
/* recognize an environment division declaration if line is in order: */
/* ENVIRONMENT, DIVISION, . */

EnvDiv:	ENVIRIONMENT DIVISION PERIOD { printf("\n RECOGNIZED RULE: Environment Division Declaration %s\n");
};


/* procedure division declaration in cobol (line 4) */
/* recognize a procedure division declaration if line is in order: */
/* PROCEDURE, DIVISION, . */

ProcDiv:	PROCEDURE DIVISION PERIOD { printf("\n RECOGNIZED RULE: Procedure Division Declaration %s\n");
/* probably also need a way to carry anything in indented lines under this under the procedure division */
};


/* stop run call in cobol (line 6) */
/* recognize display if the line is in order: */
/* STOP, RUN, . */

StopRun:	STOP RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run \n");
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
