%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <math.h>

#define YY_DECL int yylex()

%}

%option yylineno

DELIM   [ \t\n]
WS      {DELIM}+
LETTER  [A-za-z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT})*
NUMBER  {DIGIT}+(\.{DIGIT}+)?(E[+-]?{DIGIT}+)?

%%  

"+"  {printf("%s : OPERATOR\n", yytext);
    return PLUS-OP;
}

"-"  {printf("%s : OPERATOR\n", yytext);
    return HYPHEN-OP;
}

"*"  {printf("%s : OPERATOR\n", yytext);
    return MULIPLY-OP;
}

"="  {printf("%s : OPERATOR\n", yytext);
    return EQ-OP;
}

"ACCEPT"  {printf("%s : KEYWORD\n", yytext); 
    return ACCEPT;
}