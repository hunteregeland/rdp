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
LETTER  [A-za-z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT})*
NUMBER  {DIGIT}+(\.{DIGIT}+)?(E[+-]?{DIGIT}+)?

%%  

"char"  {printf("%s : OPERATOR\n", yytext);
    return TYPE;
}

"int"  {printf("%s : OPERATOR\n", yytext);
    return TYPE;
}


"+"  {printf("%s : OPERATOR\n", yytext);
    return PLUS_OP;
}

"-"  {printf("%s : OPERATOR\n", yytext);
    return HYPHEN_OP;
}

"*"  {printf("%s : OPERATOR\n", yytext);
    return MULTIPLY_OP;
}

"="  {printf("%s : OPERATOR\n", yytext);
    return EQ_OP;
}

";"  {printf("%s : OPERATOR\n", yytext);
    return SEMICOLON;
}

"ACCEPT"  {printf("%s : KEYWORD\n", yytext); 
    return ACCEPT;
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
