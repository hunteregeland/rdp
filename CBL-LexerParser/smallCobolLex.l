%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <math.h>

#define YY_DECL int yylex()
#include  "smallCobolParser.tab.h"

%}

%option yylineno

DELIM   [ \t\n\r]
WS      {DELIM}+
LETTER  [A-Za-z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT}|-)*
NUMBER  {DIGIT}+(\.{DIGIT}+)?(E[+-]?{DIGIT}+)?
STRING  ['"][A-Za-z0-9:, ]*['"]



%%  

">"  {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return GT_OP;
}

"<"  {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return LT_OP;
}

"="  {printf("%s : OPERATOR\n", yytext); 
    yylval.string = strdup(yytext);
    return EQ_OP;
}

"=="  {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return DOUBLE_EQ_OP;
}

">="  {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return GT_EQ_OP;
}

"<="  {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return LT_EQ_OP;
}

","  {printf("%s : COMMA\n", yytext);
    yylval.string = strdup(yytext);
    return COMMA;
}

(?i:identification)  {printf("%s : IDENTIFICATION\n", yytext);
    yylval.string = strdup(yytext);
    return IDENTIFICATION;
}

(?i:program-id)  {printf("%s : PROGRAM-ID\n", yytext);
    yylval.string = strdup(yytext);
    return PROGRAMID;
}

(?i:environment)  {printf("%s : ENVIRONMENT\n", yytext);
    yylval.string = strdup(yytext);
    return ENVIRIONMENT;
}

(?i:data)  {printf("%s : DATA\n", yytext);
    yylval.string = strdup(yytext);
    return DATA;
}

(?i:procedure)  {printf("%s : PROCEDURE\n", yytext);
    yylval.string = strdup(yytext);
    return PROCEDURE;
}

(?i:division)  {printf("%s : DIVISION\n", yytext);
    yylval.string = strdup(yytext);
    return DIVISION;
}

(?i:file)  {printf("%s : FILE\n", yytext);
    yylval.string = strdup(yytext);
    return FILEE;
}

(?i:working-storage)  {printf("%s : WORKING-STORAGE\n", yytext);
    yylval.string = strdup(yytext);
    return WORKINGSTORAGE;
}

(?i:local-storage)  {printf("%s : LOCAL-STORAGE\n", yytext);
    yylval.string = strdup(yytext);
    return LOCALSTORAGE;
}

(?i:linkage)  {printf("%s : LINKAGE\n", yytext);
    yylval.string = strdup(yytext);
    return LINKAGE;
}

(?i:section)  {printf("%s : SECTION\n", yytext);
    yylval.string = strdup(yytext);
    return SECTION;
}

(?i:display)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return DISPLAY;
}

(?i:accept)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return ACCEPT;
}

(?i:stop)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return STOP;
}

(?i:run)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return RUN;
}

(?i:if)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return IF;
}

(?i:perform) {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return PERFORM;
}

(?i:until) {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return UNTIL;
}

(?i:count) {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return COUNT;
}

(?i:then)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return THEN;
}

(?i:times)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return TIMES;
}

(?i:end-if)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return ENDIF;
}

(?i:picture)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return PICTURE;
}

(?i:pic)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return PIC;
}

(?i:is)  {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return IS;
}

"." {printf("%s : TERMINATOR\n", yytext);
    yylval.string = strdup(yytext);
    return PERIOD;
}

"(" {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return OPEN_PARENTHESES;
}

")" {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return CLOSE_PARENTHESES;
}

"9" {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return NINE;
}

"V" {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return LETTERV;
}

"S" {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return LETTERS;
}

"X" {printf("%s : OPERATOR\n", yytext);
    yylval.string = strdup(yytext);
    return LETTERX;
}

(?i:add) {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return ADD;
}

(?i:to) {printf("%s : KEYWORD\n", yytext);
    yylval.string = strdup(yytext);
    return TO;
}

{NUMBER}     {printf("%s : NUMBER\n", yytext);
    yylval.number = atoi(strdup(yytext));
    return NUMBER;
}

{DIGIT}     {printf("%s : NUMBER\n", yytext);
    yylval.number = atoi(strdup(yytext));
    return DIGIT;
}

{STRING}     {printf("%s : STRING\n", yytext);
    yylval.string = strdup(yytext);
    return STRING;
}

{ID}        {printf("%s : ID\n", yytext);
    yylval.string = strdup(yytext);
    return ID;
} 

{WS} {}

.  {printf("%s: anything\n", yytext);}


%%
