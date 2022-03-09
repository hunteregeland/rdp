%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <math.h>

#define YY_DECL int yylex()
#include  "parser.tab.h"

%}

%option yylineno

DELIM   [ \t\n]
WS      {DELIM}+
LETTER  [A-Za-z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT})*
NUMBER  {DIGIT}+(\.{DIGIT}+)?(E[+-]?{DIGIT}+)?

%%  

"IDENTIFICATION DIVISION"  {printf("%s : DIVISION\n", yytext);
    return IDENTIFICATION_DIVISION;
}

"PROGRAM-ID"  {printf("%s : PROGRAM NAME\n", yytext);
    return PROGRAM_ID;
}


"ENVIRONMENT DIVISION"  {printf("%s : DIVISION\n", yytext);
    return ENVIRIONMENT_DIVISION;
}

"PROCEDURE DIVISION"  {printf("%s : DIVISION\n", yytext);
    return PROCEDURE_DIVISION;
}

"DISPLAY"  {printf("%s : KEYWORD\n", yytext);
    return DISPLAY;
}

"STOP RUN"  {printf("%s : KEYWORD\n", yytext);
    return STOP_RUN;
}

"." {printf("%s : OPERATOR\n", yytext);
    return PERIOD;
}

{NUMBER}     {printf("%s : NUMBER\n", yytext);
    return NUMBER;
}

{ID}        {printf("%s : ID\n", yytext);
    return ID;
} 

{DELIM} {}

.  {printf("%s: anything", yytext);}

%%
