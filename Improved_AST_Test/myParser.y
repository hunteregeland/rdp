%{

#include <stdio.h>
#include <stdlib.h>

//imports the functions I wrote in myAST.h
#include "myAST.h"

extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
%}

%union {
    struct token{
        char* name;
        int lineNum;
        int charNum;
        int tokenLength;
    } token;

    //the ast struct is defined in myAST.h
    struct AST* ast;
}

%token <token> VOID
%token <token> TYPE
%token <token> ID
%token <token> KEYWORD
%token <token> STRING
%token <token> UNARYOP
%token <token> BINARYOP
%token <token> OPENSQUARE
%token <token> CLOSEDSQUARE
%token <token> OPENCURLY
%token <token> CLOSEDCURLY
%token <token> OPENPAREN
%token <token> CLOSEDPAREN
%token <token> MINUS
%token <token> SEMICOLON
%token <token> EQ
%token <token> CHAR
%token <token> COMMA
%token <token> NEWLINE
%token <token> NUMBER

%type <token> Primary

%type <ast> VarDecl Expr DeclList FunDecl Program ParamDeclList ParamDeclListTail ParamDecl Block Stmt ExprList ExprListTail BlockBody


%start Program

%%

Program: DeclList   {
                        strcpy($$->nodeValue,"Program-Start");
                        printBetterAST($$,0,0,0);
                    }
;

DeclList: VarDecl DeclList {$$ = AST_Bexpr_Last_Rast($1,"next",$2);}
    | FunDecl DeclList {$$ = AST_Bexpr_Last_Rast($1,"next",$2);}
    | VarDecl {$$ = AST_Bexpr_Last_Rast($1,"next",NULL);}
    | FunDecl {$$ = AST_Bexpr_Last_Rast($1,"next",NULL);}
;

VarDecl: ID EQ Expr SEMICOLON{$$ = AST_Bexpr_Lexpr_Rast($1.name,"=",$3);}
    | ID OPENSQUARE Expr CLOSEDSQUARE EQ Expr SEMICOLON{
                                                char typeAssign[50];
                                                sprintf(typeAssign,"array-assign-%s",$1.name);
                                                $$ = AST_Bexpr_Last_Rast($3,typeAssign,$6);
                                                refactorAST($$);
                                                }
    | TYPE ID {printf("missing semicolon on line %d at character %d stopping compile\n", $2.lineNum, $2.charNum); return 0;}
    | TYPE ID EQ Expr {printf("missing semicolon on line %d at character %d stopping compile\n", $2.lineNum, $2.charNum); return 0;}
    | TYPE ID EQ Expr SEMICOLON {
                                $$ = AST_Bexpr_Lexpr_Rast($2.name,$1.name,$4);
                                refactorAST($$);
                                }
    | TYPE ID SEMICOLON {
                        $$ = AST_Bexpr_Lexpr_Rexpr($1.name,"assign",$2.name);
                        }
    | TYPE ID OPENSQUARE Expr CLOSEDSQUARE {printf("missing semicolon on line %d at character %d stopping compile\n", $2.lineNum, $5.charNum); return 0;} 
    | TYPE ID OPENSQUARE Expr CLOSEDSQUARE SEMICOLON {
                                                        char typeAssign[50];
                                                        sprintf(typeAssign,"%s-arr",$1.name);
                                                        $$ = AST_Bexpr_Lexpr_Rast($2.name,typeAssign,$4);}
;

FunDecl:  ID OPENPAREN ParamDeclList CLOSEDPAREN Block {printf("type not defined for function %s on line %d\n",$1.name,$1.lineNum);return 0;}
    | TYPE ID OPENPAREN ParamDeclList CLOSEDPAREN {printf("function %s body not defined on line %d\n",$2.name,$1.lineNum);return 0;}
    | TYPE ID OPENPAREN ParamDeclList Block {printf("function %s missing \")\" for param definition on line %d\n",$2.name,$1.lineNum);return 0;}
    | TYPE ID ParamDeclList Block {printf("function %s missing paretheses for param definition on line %d\n",$2.name,$1.lineNum);return 0;}
    | TYPE ID OPENPAREN ParamDeclList CLOSEDPAREN Block {
                                                        char typeAssign[50];
                                                        sprintf(typeAssign,"%s-%s",$1.name,$2.name);
                                                        $$ = AST_Bexpr_Last_Rast($4,typeAssign,$6);}
    | VOID ID OPENPAREN ParamDeclList CLOSEDPAREN Block {char typeAssign[50];
                                                        sprintf(typeAssign,"%s-%s",$1.name,$2.name);
                                                        $$ = AST_Bexpr_Last_Rast($4,typeAssign,$6);}
;

ParamDeclList: {$$ = AST_Bexpr_Last_Rast(NULL,"No-param",NULL);}
    | ParamDeclListTail
;

ParamDeclListTail: ParamDecl {$$ = $1;}
    | ParamDecl COMMA ParamDeclListTail {$$ = AST_Bexpr_Last_Rast($1,"param-list",$3);}
    | ParamDecl COMMA {printf("trailing comma in param decl on line %d\n",$2.lineNum);return 0;}
    | COMMA {printf("extra comma in param decl on line %d\n",$1.lineNum);return 0;}
    | ParamDecl ParamDeclListTail {printf("Param decl missing comma\n");return 0;}
;

ParamDecl: TYPE {printf("no id on param decl on line %d\n",$1.lineNum); return 0;}
    | ID {printf("no type on param decl on line %d\n",$1.lineNum); return 0;}
    | TYPE ID {$$ = AST_Bexpr_Lexpr_Rexpr($1.name,"param",$2.name);}
    | TYPE ID OPENSQUARE CLOSEDSQUARE {$$ = AST_Bexpr_Lexpr_Rexpr($1.name,"array-param",$2.name);}
;

BlockBody: VarDecl BlockBody {$$ = AST_Bexpr_Last_Rast($1,"next",$2);}
    | Stmt BlockBody {$$ = AST_Bexpr_Last_Rast($1,"next",$2);}
    | VarDecl {$$ = AST_Bexpr_Last_Rast($1,"next",NULL);}
    | Stmt {$$ = AST_Bexpr_Last_Rast($1,"next",NULL);}
;

Block: OPENCURLY BlockBody CLOSEDCURLY {$$ = $2;}
    | OPENCURLY CLOSEDCURLY {printf("function body not defined for func on line %d\n",$1.lineNum);return 0;}
    | OPENCURLY BlockBody {printf("function body not closed for func on line %d\n",$1.lineNum);return 0;}
;

Stmt: SEMICOLON {$$ = AST_Bexpr_Last_Rast(NULL,$1.name,NULL);}
    | Expr SEMICOLON {$$ = $1;}
    | KEYWORD Expr {printf("missing semicolon on line %d\n",$1.lineNum);return 0;}
    | KEYWORD Expr SEMICOLON {$$ = AST_Bexpr_Lexpr_Rast($1.name,"action",$2);}
    | KEYWORD ID SEMICOLON {$$ = AST_Bexpr_Lexpr_Rexpr($1.name,"action",$2.name);}
    | KEYWORD {printf("missing semicolon on line %d\n",$1.lineNum);return 0;}
    | KEYWORD SEMICOLON {$$ = AST_Bexpr_Lexpr_Rast($1.name,"action",NULL);}
    | KEYWORD OPENPAREN Expr CLOSEDPAREN Block KEYWORD Block SEMICOLON {struct AST* temp = AST_Bexpr_Last_Rast($5,$6.name,$7);
                                                              $$ = AST_Bexpr_Last_Rast($3,$1.name,temp);}
    | KEYWORD OPENPAREN Expr CLOSEDPAREN Block SEMICOLON {$$ = AST_Bexpr_Last_Rast($3,$1.name,$5);}
    | KEYWORD OPENPAREN Expr CLOSEDPAREN {printf("%s statement block not defined on line %d\n",$1.name,$1.lineNum);return 0;}
    | KEYWORD OPENPAREN CLOSEDPAREN Block {printf("%s statement not defined on line %d\n",$1.name,$1.lineNum);return 0;}
    | ID OPENPAREN CLOSEDPAREN SEMICOLON {$$ = AST_Bexpr_Last_Rast(NULL,$1.name,NULL);}
    | ID OPENPAREN CLOSEDPAREN {printf("missing semicolon on line %d\n",$1.lineNum);return 0;}
    | ID OPENPAREN ExprList CLOSEDPAREN SEMICOLON {$$ = AST_Bexpr_Last_Rast($3,$1.name,NULL);}
    | Block
;

Expr: Primary {$$ = AST_Bexpr_Last_Rast(NULL,$1.name,NULL);}
    | UNARYOP Expr {$$ = AST_Bexpr_Lexpr_Rast($1.name,"Unary",$2);}
    | MINUS Expr {$$ = AST_Bexpr_Lexpr_Rast($1.name,"Unary",$2);}
    | Expr BINARYOP Expr 
        {
        $$ = AST_Bexpr_Last_Rast($1,$2.name,$3);
        }
    | Expr BINARYOP {printf("missing right side of binary operation on line %d\n",$2.lineNum);return 0;}
    | BINARYOP Expr {printf("missing left side of binary operation on line %d at char %d\n",$1.lineNum,$1.charNum);return 0;}
    | Expr MINUS Expr {$$ = AST_Bexpr_Last_Rast($1,$2.name,$3);}
    | Expr MINUS {printf("missing right side of binary operation on line %d\n",$2.lineNum);return 0;}
    | ID EQ Expr{$$ = AST_Bexpr_Lexpr_Rast($1.name,"=",$3);}
    | Expr EQ ID {printf("cannot assign ID to expression on line %d\n",$2.lineNum);return 0;}
    | ID OPENSQUARE Expr CLOSEDSQUARE EQ Expr {$$ = AST_Bexpr_Last_Rast($3,"array-assign",$6);}
    | ID OPENSQUARE CLOSEDSQUARE EQ Expr {printf("must provide array index on line %d\n",$1.lineNum);return 0;}
    | ID OPENPAREN ExprList CLOSEDPAREN {$$ = AST_Bexpr_Lexpr_Rast($1.name,"fun-call",$3);}
    | OPENPAREN Expr CLOSEDPAREN {$$ = $2;}
    | OPENPAREN Expr {printf("open paretheses not closed on line %d at char %d\n",$1.lineNum,$1.charNum);return 0;}
    | ID OPENSQUARE Expr CLOSEDSQUARE {$$ = AST_Bexpr_Lexpr_Rast($1.name,"array-val",$3);}
;

Primary: ID {$$.name = $1.name;}
    | NUMBER {$$.name = $1.name;}
    | STRING {$$.name = $1.name;}
    | CHAR {$$.name = $1.name;}
    
;

ExprList: {$$ = AST_Bexpr_Last_Rast(NULL,"No-param",NULL);}
    | ExprListTail
;

ExprListTail: Expr 
    | Expr COMMA ExprListTail {$$ = AST_Bexpr_Last_Rast($1,"param-call-list",$3);}
;


%%

int main(int argc, char**argv)
{

	// #ifdef YYDEBUG
	// 	yydebug = 1;
	// #endif

	printf("Compiler started. \n\n");
	
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