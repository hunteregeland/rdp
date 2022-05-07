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
LETTER  [A-Za-z]
DIGIT   [0-9]
ID      {LETTER}({LETTER}|{DIGIT})*
NUMBER  {DIGIT}+(\.{DIGIT}+)?(E[+-]?{DIGIT}+)?
STRING  ['"][A-Za-z0-9:, ]*['"]   

%%  

"char"  {printf("%s : OPERATOR\n", yytext);
    // return TYPE;
}

"int"  {printf("%s : OPERATOR\n", yytext);
    // return TYPE;
}


"+"  {printf("%s : OPERATOR\n", yytext);
    // return PLUS_OP;
}

"-"  {printf("%s : OPERATOR\n", yytext);
    // return HYPHEN_OP;
}

"*"  {printf("%s : OPERATOR\n", yytext);
    // return MULTIPLY_OP;
}

"="  {printf("%s : OPERATOR\n", yytext);
    // return EQ_OP;
}

";"  {printf("%s : OPERATOR\n", yytext);
    // return SEMICOLON;
}

"ACCEPT"  {printf("%s : KEYWORD\n", yytext); 
    // return ACCEPT;
}

{NUMBER}     {printf("%s : NUMBER\n", yytext);
    // return NUMBER;
}

{STRING}     {printf("%s : STRING\n", yytext);
    // return STRING;
}

{ID}        {printf("%s : ID\n", yytext);
    // return ID;
} 





{DELIM} {}
.  {printf("%s: anything", yytext);}
%%

int main(int argc, char**argv)
{
    printf("Compiler started. \n\n");

    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            perror(argv[1]);
            return(1);
        }
    }
    yylex();
}