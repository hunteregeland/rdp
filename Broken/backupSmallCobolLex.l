%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <math.h>

#define YY_DECL int yylex()
#include  "backupParser.tab.h"

%}

%option yylineno

DELIM   [ \t\n]
WS      {DELIM}+
LETTER  [A-Za-z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT}|-)*
NUMBER  {DIGIT}+(\.{DIGIT}+)?(E[+-]?{DIGIT}+)?
STRING  ['][A-Za-z0-9 ]*[']

%%  

">"  {printf("%s : OPERATOR\n", yytext);
    return GT_OP;
}

"<"  {printf("%s : OPERATOR\n", yytext);
    return LT_OP;
}

"="  {printf("%s : OPERATOR\n", yytext); 
    return EQ_OP;
}

"=="  {printf("%s : OPERATOR\n", yytext);
    return DOUBLE_EQ_OP;
}

">="  {printf("%s : OPERATOR\n", yytext);
    return GT_EQ_OP;
}

"<="  {printf("%s : OPERATOR\n", yytext);
    return LT_EQ_OP;
}

"IDENTIFICATION"  {printf("%s : IDENTIFICATION\n", yytext);
    return IDENTIFICATION;
}

"PROGRAM-ID"  {printf("%s : PROGRAMID\n", yytext);
    return PROGRAMID;
}

"DATA"  {printf("%s : DATA\n", yytext);
    return DATA;
}

"FILE"  {printf("%s : FILE\n", yytext);
    return FILE;
}

"WORKING-STORAGE"  {printf("%s : WORKING-STORAGE\n", yytext);
    return WORKINGSTORAGE;
}

"LINKAGE"  {printf("%s : LINKAGE\n", yytext);
    return LINKAGE;
}

"SCREEN"  {printf("%s : SCREEN\n", yytext);
    return SCREEN;
}

"SECTION"  {printf("%s : SECTION\n", yytext);
    return SECTION;
}

"ENVIRONMENT"  {printf("%s : ENVIRONMENT\n", yytext);
    return ENVIRIONMENT;
}

"PROCEDURE"  {printf("%s : PROCEDURE\n", yytext);
    return PROCEDURE;
}

"DIVISION"  {printf("%s : DIVISION\n", yytext);
    return DIVISION;
}

"DISPLAY"  {printf("%s : KEYWORD\n", yytext);
    return DISPLAY;
}

"STOP"  {printf("%s : KEYWORD\n", yytext);
    return STOP;
}

"RUN"  {printf("%s : KEYWORD\n", yytext);
    return RUN;
}

"IF"  {printf("%s : KEYWORD\n", yytext);
    return IF;
}

"PERFORM" {printf("%s : KEYWORD\n", yytext);
    return PERFORM;
}

"UNTIL" {printf("%s : KEYWORD\n", yytext);
    return UNTIL;
}

"COUNT" {printf("%s : KEYWORD\n", yytext);
    return COUNT;
}

"THEN"  {printf("%s : KEYWORD\n", yytext);
    return THEN;
}

"TIMES"  {printf("%s : KEYWORD\n", yytext);
    return TIMES;
}

"END-IF"  {printf("%s : KEYWORD\n", yytext);
    return ENDIF;
}

"PICTURE"  {printf("%s : KEYWORD\n", yytext);
    return PICTURE;
}

"PIC"  {printf("%s : KEYWORD\n", yytext);
    return PIC;
}

"IS"  {printf("%s : KEYWORD\n", yytext);
    return IS;
}

"." {printf("%s : TERMINATOR\n", yytext);
    return PERIOD;
}

"(" {printf("%s : OPERATOR\n", yytext);
    return OPEN_PARENTHESES;
}

")" {printf("%s : OPERATOR\n", yytext);
    return CLOSE_PARENTHESES;
}

"9" {printf("%s : OPERATOR\n", yytext);
    return NINE;
}

"V" {printf("%s : OPERATOR\n", yytext);
    return LETTERV;
}

"S" {printf("%s : OPERATOR\n", yytext);
    return LETTERS;
}

"X" {printf("%s : OPERATOR\n", yytext);
    return LETTERX;
}

"ADD" {printf("%s : KEYWORD\n", yytext);
    return ADD;
}

"TO" {printf("%s : KEYWORD\n", yytext);
    return TO;
}

{NUMBER}     {printf("%s : NUMBER\n", yytext);
    return NUMBER;
}

{DIGIT}     {printf("%s : DIGIT\n", yytext);
    return DIGIT;
}

{STRING}     {printf("%s : STRING\n", yytext);
    return STRING;
}

{ID}        {printf("%s : ID\n", yytext);
    return ID;
} 

{WS} {}

.  {printf("%s: anything\n", yytext);}


%%
