%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

//#include "symbolTable.h"
#include "AST.h"


extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
char currentScope[50]; // global or the name of the function

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
%token <string> STOP
%token <string> RUN

%token <char> PERIOD
%token <char> APOSTROPHE



%printer { fprintf(yyoutput, "%s", $$); } ID;
%printer { fprintf(yyoutput, "%d", $$); } NUMBER;

%type <ast> Program 

%start Program

%%


// identification division declaration in cobol (line 1)
// recognize an identification division declaration if line is in order:
// IDENTIFICATION_DIVISION, period

Program:	Module1 Module2 Module3 { printf("\n RECOGNIZED RULE: COBOL Program Start %s\n");





									}


Module1:	IDDiv ProgID { printf("\n RECOGNIZED RULE: Module1: Identification Division %s\n"); 





						}


Module2:	EnvDiv { printf("\n RECOGNIZED RULE: Module2: Environment Division %s\n");





					}


Module3:	ProcDiv Statements StopRun { printf("\n RECOGNIZED RULE: Module3: Procedure Division %s\n");





										}


ProgID:		PID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program Start %s\n");





								}


Statements:		Statement Statements {$$ = $2}
        		| NULL 
;

Statement:		DISPLAY STRING PERIOD {$$ = AssignmentStatement("DISP", $2);



									}
        		| ACCEPT ID PERIOD {$$ = AssignmentStatement("ACCEPT", #2)
				

				
									}


IDDiv:	IDENTIFICATION DIVISION PERIOD { printf("\n RECOGNIZED RULE: Identification Division Declaration %s\n");


// logic for id division declaration



										}



// program id declaration in cobol (line 2)
// recognize a program id declaration if line is in order:
// PROGRAM-ID, period, ID 

ProgramID:	PROGRAMID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program ID %s\n", $2);


// logic for program id



					    }



// environment division declaration in cobol (line 3)
// recognize an environment division declaration if line is in order:
// ENVIRONMENT_DIVISION, period

EnvDiv:	ENVIRIONMENT DIVISION PERIOD { printf("\n RECOGNIZED RULE: Environment Division Declaration %s\n", $2);}


// logic for environment division declaration



				      }



// procedure division declaration in cobol (line 4)
// recognize a procedure division declaration if line is in order:
// PROCEDURE_DIVISION, period

ProcDiv:	PROCEDURE DIVISION PERIOD { printf("\n RECOGNIZED RULE: Procedure Division Declaration %s\n", $2);}


// logic for procedure division declaration
// probably also need a way to carry anything in indented lines under this under the procedure division.



					  }



// display call in cobol (line 5)
// recognize display if the line is in order:
// DISPLAY, string, period

Display:	DISPLAY STRING PERIOD { printf("\n RECOGNIZED RULE: Display Call %s\n", $2);

// this is where we have to actually do the display?




							}



// stop run call in cobol (line 6)
// recognize display if the line is in order:
// STOP, RUN, period

StopRun:	STOP RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run \n", $2);

// same thing, gotta do the logic for the stop run in here?

	
	

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
