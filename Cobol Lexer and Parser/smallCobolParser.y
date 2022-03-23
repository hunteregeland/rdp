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

%token <char> PERIOD
%token <char> APOSTROPHE



%printer { fprintf(yyoutput, "%s", $$); } ID;
%printer { fprintf(yyoutput, "%d", $$); } NUMBER;

%type <ast> Program 

%start Program

%%

/* the test program doesn't have a data division, but we will need one as that's how you define variables in cobol */



/* basic structure of the current cobol test program */

Program:	Module1 Module2 Module3 { printf("\n RECOGNIZED RULE: COBOL Program Start %s\n");






					}


/* part of the program including the identification division and the program id declaration */
/* lines 1 & 2 */

Module1:	IDDiv ProgID { printf("\n RECOGNIZED RULE: Module1: Identification Division %s\n"); 






					}


/* part of the program that contains the environment division */
/* line 3 */

Module2:	EnvDiv { printf("\n RECOGNIZED RULE: Module2: Environment Division %s\n");






					}


/* part of the program that contains the procedure division and everything that is inside it, which is statements since this is where all executable code is written */
/* lines 4-6 */

Module3:	ProcDiv Statements StopRun { printf("\n RECOGNIZED RULE: Module3: Procedure Division %s\n");






					}


/* the program id syntax, this is the part of line 2 that defines the program name */
/* line 2 */
/* this needs to bee fixed, we cannot recognize PROGRAM-ID currently */

ProgID:		PROGRAMID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program Start %s\n");






					}


/* this is a recursive way to read however many statements in the procedure division */

Statements:		Statement Statements {$$ = $2}
        		| NULL 
;


/* statements in cobol, currently only contains the one used in the test program and one extra */
/* this needs to be updated to have all cobol statements */
/* use '|' to put multiple different statements in here */

Statement:		DISPLAY STRING PERIOD {$$ = AssignmentStatement("DISP", $2);



					}
        		| ACCEPT ID PERIOD {$$ = AssignmentStatement("ACCEPT", #2);
				

				
					}
									

/* identification division declaration in cobol (line 2) */
/* recognize an identification division declaration if line is in order: */
/* IDENTIFICATION, DIVISION, . */

IDDiv:	IDENTIFICATION DIVISION PERIOD { printf("\n RECOGNIZED RULE: Identification Division Declaration %s\n");






					}


/* environment division declaration in cobol (line 3) */
/* recognize an environment division declaration if line is in order: */
/* ENVIRONMENT, DIVISION, . */

EnvDiv:	ENVIRIONMENT DIVISION PERIOD { printf("\n RECOGNIZED RULE: Environment Division Declaration %s\n", $2);






	
					}


/* procedure division declaration in cobol (line 4) */
/* recognize a procedure division declaration if line is in order: */
/* PROCEDURE, DIVISION, . */

ProcDiv:	PROCEDURE DIVISION PERIOD { printf("\n RECOGNIZED RULE: Procedure Division Declaration %s\n", $2);



/* probably also need a way to carry anything in indented lines under this under the procedure division */




					}


/* display call in cobol (line 5)
/* recognize display if the line is in order:
/* DISPLAY, string, . */
/* i think this is inconsequential now that we have this in the statements list above, but not 100% sure yet */

Display:	DISPLAY STRING PERIOD { printf("\n RECOGNIZED RULE: Display Call %s\n", $2);






				
					}


/* stop run call in cobol (line 6) */
/* recognize display if the line is in order: */
/* STOP, RUN, . */

StopRun:	STOP RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run \n", $2);



	
	


					}



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
