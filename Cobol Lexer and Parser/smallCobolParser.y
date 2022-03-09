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

%token <string> PROGRAM_ID
%token <string> DISPLAY
%token <string> STOP
%token <string> RUN

%token <char> PERIOD
%token <char> APOSTROPHE

//WHAT I HAVE GOTTEN TO. EVERYTHING BELOW IS COPY PASTED FROM THE PREVIOUS PARSER BUT NEEDS TO BE REIMPLEMENTED.


%printer { fprintf(yyoutput, "%s", $$); } ID;
%printer { fprintf(yyoutput, "%d", $$); } NUMBER;

%type <ast> Program 

%start Program

%%


// identification division declaration in cobol (line 1)
// recognize an identification division declaration if line is in order:
// IDENTIFICATION_DIVISION, period

IDDiv:	IDENTIFICATION DIVISION PERIOD { printf("\n RECOGNIZED RULE: Identification Division Declaration %s\n");


// logic for id division declaration



					}



// program id declaration in cobol (line 2)
// recognize a program id declaration if line is in order:
// PROGRAM-ID, period, ID 

ProgramID:	PROGRAM_ID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program ID %s\n", $2);


// logic for program id



					    }



// environment division declaration in cobol (line 3)
// recognize an environment division declaration if line is in order:
// ENVIRONMENT_DIVISION, period

EnvDiv:	ENVIRIONMENT_DIVISION PERIOD { printf("\n RECOGNIZED RULE: Environment Division Declaration %s\n", $2);}


// logic for environment division declaration



				      }



// procedure division declaration in cobol (line 4)
// recognize a procedure division declaration if line is in order:
// PROCEDURE_DIVISION, period

ProcDiv:	PROCEDURE_DIVISION PERIOD { printf("\n RECOGNIZED RULE: Procedure Division Declaration %s\n", $2);}


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
