%option noyywrap
%option yylineno
%{
#include <stdio.h>
#include <string.h>

#define YY_DECL int yylex()
#include "myParser.tab.h"

int words = 0;
int lineChars = 0;
int chars = 0;
int lines = 1;
int print = 0;

%}

letter      [a-zA-Z]
digit       [0-9]
ID          {letter}({letter}|{digit})*
CHAR        ('.')
STRING      ((\".*\")|('.*'))
delim       [ \t\n]
NUMBER      {digit}+(\.{digit}+)?(E[+\-]?(digit)+)?
UNARYOP		[!]
BINARYOP	[+\*/<>]|==|!=|<=|>=|&&|\|\|
ws          {delim}+
TYPE		"int"|"char"|"float"|"string"
KEYWORD		"write"|"return"|"read"|"writeln"|"break"|"if"|"else"|"while"

%%

(\/\/(.*)(\n|\r\n))		{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("Single line Comment on line %d : %s\n",lines, yytext);
							lines++;
						}

"/*"    				{
							if(print)
								printf("multiline comment starting on line: %d",lines);
							lineChars += 2;
							chars += 2;
							int c;
							while((c = input()) != 0) {
								lineChars++;
								chars++;
								if(c == '*') {
									if((c = input()) == '/'){
										if(print)
											printf(" and ending on line: %d\n\n",lines);
										lineChars++;
										chars++;
										break;
									}else
										unput(c);
								}else{
									if(c == '\n'){
										lines++;
									}
								}
							}
						}

"void"					{
							words++;
							lineChars += strlen(yytext); 
							chars += strlen(yytext);
							if(print)
								printf("%s : VOID\n", yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return VOID;
						}

{TYPE}					{
							words++;
							lineChars += strlen(yytext); 
							chars += strlen(yytext);
							if(print)
								printf("%s : TYPE\n", yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return TYPE;
						}
 
{KEYWORD}				{
							words++;
							lineChars += strlen(yytext); 
							chars += strlen(yytext);
							if(print)
								printf("%s : KEYWORD\n", yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return KEYWORD;
						}

{ID}					{
							words++;
							lineChars += strlen(yytext); 
							chars += strlen(yytext);
							if(print)
								printf("%s : IDENTIFIER\n",yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return ID;
						}

{NUMBER}				{
							words++;
							lineChars += strlen(yytext); 
							chars += strlen(yytext);
							if(print)
								printf("%s : NUMBER\n",yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return NUMBER;
						}

{CHAR}					{
							words++;
							lineChars += strlen(yytext); 
							chars += strlen(yytext);
							if(print)
								printf("%s : Char\n",yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return CHAR;
						}	
 
{STRING} 				{
							words++;
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("%s : String\n", yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return STRING;
						}

{UNARYOP}				{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("%s : Un op\n",yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return UNARYOP;
						}

{BINARYOP}				{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("%s : Bin op\n",yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return BINARYOP;
						}

"["						{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("[ : open Square\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return OPENSQUARE;
						}

"]"						{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("] : closed Square\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return CLOSEDSQUARE;
						}

"{"						{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("{ : open Squiggle\n\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return OPENCURLY;
						}


"}"						{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("} : closed Squiggle\n\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return CLOSEDCURLY;
						}

"("						{	
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("( : open Paren\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return OPENPAREN;
						}

")"						{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf(") : closed Paren\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return CLOSEDPAREN;
						}

"-"						{	
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf("- : MINUS\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return MINUS;
						}

";"						{
							chars++;
							lineChars++;
							if(print)
								printf("%s : SEMICOLON\n\n", yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return SEMICOLON;
						}
		
"="						{	
							chars++;
							lineChars++;
							if(print)
								printf("%s : EQ\n", yytext);
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return EQ;
						}

","						{
							lineChars += strlen(yytext); 
							chars+= strlen(yytext);
							if(print)
								printf(", : COMMA\n");
							yylval.token.name = strdup(yytext);
							yylval.token.lineNum = lines;
							yylval.token.charNum = lineChars;
							yylval.token.tokenLength = strlen(yytext);
							return COMMA;
						}
		
[\n]				{
							chars += strlen(yytext);
							lines++;
							lineChars=0;
							//return 0;
						}

[ \t]					{
							chars++;
							lineChars++;
						}

.						{
							chars++;
							lineChars++;
							printf("%s : Unrecognized symbol at line %d char %d\n", yytext,lines,lineChars);
						}
		
%%