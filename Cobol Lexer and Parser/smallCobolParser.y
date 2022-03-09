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

%token <string> IDENTIFICATION_DIVISION
%token <string> PROGRAM_ID
%token <string> ENVIRIONMENT_DIVISION
%token <string> PROCEDURE_DIVISION
%token <string> DISPLAY
%token <string> STOP_RUN
%token <char> PERIOD
%token <char> APOSTROPHE

//WHAT I HAVE GOTTEN TO. EVERYTHING BELOW IS COPY PASTED FROM THE PREVIOUS PARSER BUT NEEDS TO BE REIMPLEMENTED.


%printer { fprintf(yyoutput, "%s", $$); } ID;
%printer { fprintf(yyoutput, "%d", $$); } NUMBER;

%type <ast> Program DeclList Decl VarDecl Stmt StmtList Expr

%start Program

%%

// display call in cobol (line 5)
// recognize display if the line is in order:
// DISPLAY, apostrophe, whatever needs to be diplayed, apostrophe, period
// i think we could also maybe define a string in the parser to simplify the "APOSTROPHE ID APOSTROPHE" clause

Display:	DISPLAY APOSTROPHE ID APOSTROPHE PERIOD { printf("\n RECOGNIZED RULE: Display Call %s\n", $2);

// this is where we have to actually do the display?




											}

// stop run call in cobol (line 6)
// recognize display if the line is in order:
// STOP, RUN, period

StopRun:	STOP_RUN PERIOD { printf("\n RECOGNIZED RULE: Stop Run \n", $2);

// same thing, gotta do the logic for the stop run in here?

	
	

							}

// program id declaration in cobol (line 2)
// recognize a program id declaration if line is in order:
// PROGRAM-ID, period, ID 

ProgramID:	PROGRAM_ID PERIOD ID PERIOD { printf("\n RECOGNIZED RULE: Program ID %s\n", $2);


// logic for program id



										}

// identification division declaration in cobol (line 1)
// recognize an identification division declaration if line is in order:
// IDENTIFICATION_DIVISION, period

IDDiv:	IDENTIFICATION_DIVISION PERIOD { printf("\n RECOGNIZED RULE: Identification Division Declaration %s\n", $2);}


// logic for id division declaration



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

Program: DeclList { $$ = $1;
					 printf("\n--- Abstract Syntax Tree ---\n\n");
					 //printAST($$,0);
					}
;

DeclList:	Decl DeclList	{ $1->left = $2;
							  $$ = $1;
							}
	| Decl	{ $$ = $1; }
;

Decl:	VarDecl
	| StmtList
;

VarDecl:	TYPE ID SEMICOLON	{ printf("\n RECOGNIZED RULE: Variable declaration %s\n", $2);
									//Symbol Table
									/*
									symTabAccess();
									int inSymTab = found($2, currentScope);
									printf("looking for %s in symtab - found: %d \n", $2, inSymTab);
									
									if (inSymTab == 0) 
										addItem($2, "Var", $1,0, currentScope);
									else
										printf("SEMANTIC ERROR: Var %s is already in the symbol table", $2);
									showSymTable();
									
								  // ---- SEMANTIC ACTIONS by PARSER ----
								    $$ = AST_Type("Type",$1,$2);
									printf("-----------> %s", $$->LHS);
									*/
								}
;

StmtList:	
	| Stmt StmtList
;

Stmt:	SEMICOLON	{}
	| Expr SEMICOLON	{$$ = $1;}
;

Expr:	ID { printf("\n RECOGNIZED RULE: Simplest expression\n"); }
	| ID EQ_OP ID 	{ printf("\n RECOGNIZED RULE: Assignment statement\n"); 
					// ---- SEMANTIC ACTIONS by PARSER ----
					  //$$ = AST_assignment("=",$1,$3);
				}
	| ID EQ_OP NUMBER 	{ printf("\n RECOGNIZED RULE: Assignment statement\n"); 
					   // ---- SEMANTIC ACTIONS by PARSER ----
					   //char str[50];
					   //sprintf(str, "%d", $3); 
					   //$$ = AST_assignment("=",$1, str);
					}
	| WRITE ID 	{ printf("\n RECOGNIZED RULE: WRITE statement\n");
					//$$ = AST_Write("write",$2,"");
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
