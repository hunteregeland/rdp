%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <math.h>

#define YY_DECL int yylex()
#include "parser.tab.h"

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
    return PLUS_OP;
}

"-"  {printf("%s : OPERATOR\n", yytext);
    return HYPHEN_OP;
}

"*"  {printf("%s : OPERATOR\n", yytext);
    return MULIPLY_OP;
}

"/"  {printf("%s : OPERATOR\n", yytext);
    return DIVIDE_OP;
}

"**" {printf("%s : OPERATOR\n", yytext);
    return EXPONENT_OP;
}

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

"<>"  {printf("%s : OPERATOR\n", yytext);
    return NOT_EQ_OP;
}

"*>"  {printf("%s : OPERATOR\n", yytext);
    return COMMENT_OP;
}

">>"  {printf("%s : OPERATOR\n", yytext);
    return COMPILER_DIRECTIVE_OP;
}

"("  {printf("%s : OPERATOR\n", yytext);
    return LEFT_PARENTHESES_OP;
}

")"  {printf("%s : OPERATOR\n", yytext);
    return RIGHT_PARENTHESES_OP;
}

"ACCEPT"  {printf("%s : KEYWORD\n", yytext); 
    return ACCEPT;
}

"ACCESS"  {printf("%s : KEYWORD\n", yytext); 
    return ACCESS;
}

"ADD"  {printf("%s : KEYWORD\n", yytext); 
    return ADD;
}

"ADDRESS"  {printf("%s : KEYWORD\n", yytext); 
    return ADDRESS;
}

"ADVANCING"  {printf("%s : KEYWORD\n", yytext); 
    return ADVANCING;
}

"AFTER"  {printf("%s : KEYWORD\n", yytext); 
    return AFTER;
}

"ALL"  {printf("%s : KEYWORD\n", yytext); 
    return ALL;
}

"ALLOCATE"  {printf("%s : KEYWORD\n", yytext); 
    return ALLOCATE;
}

"ALPHABET"  {printf("%s : KEYWORD\n", yytext); 
    return ALPHABET;
}

"ALPHABETIC"  {printf("%s : KEYWORD\n", yytext); 
    return ALPHABETIC;
}

"ALPHABETIC-LOWER"  {printf("%s : KEYWORD\n", yytext); 
    return ALPHABETIC_LOWER;
}

"ALPHABETIC-UPPER"  {printf("%s : KEYWORD\n", yytext); 
    return ALPHABETIC_UPPER;
}

"ALPHANUMERIC"  {printf("%s : KEYWORD\n", yytext); 
    return ALPHANUMERIC;
}

"ALPHANUMERIC-EDITED"  {printf("%s : KEYWORD\n", yytext); 
    return ALPHANUMERIC_EDITED;
}

"ALSO"  {printf("%s : KEYWORD\n", yytext); 
    return ALSO;
}

"ALTER"  {printf("%s : KEYWORD\n", yytext); 
    return ALTER;
}

"ALTERNATIVE"  {printf("%s : KEYWORD\n", yytext); 
    return ALTERNATIVE;
}

"AND"  {printf("%s : KEYWORD\n", yytext); 
    return AND;
}

"ANY"  {printf("%s : KEYWORD\n", yytext); 
    return ANY;
}

"APPLY"  {printf("%s : KEYWORD\n", yytext); 
    return APPLY;
}

"ARE"  {printf("%s : KEYWORD\n", yytext);
    return ARE;
}

"AREA"  {printf("%s : KEYWORD\n", yytext);
    return AREA;
}

"AREAS"  {printf("%s : KEYWORD\n", yytext);
    return AREAS;
}

"ASCENDING"  {printf("%s : KEYWORD\n", yytext);
    return ASCENDING;
}

"ASSIGN"  {printf("%s : KEYWORD\n", yytext);
    return ASSIGN;
}

"AT"  {printf("%s : KEYWORD\n", yytext);
    return AT;
}

"AUTHOR"  {printf("%s : KEYWORD\n", yytext);
    return AUTHOR;
}

"BASIS"  {printf("%s : KEYWORD\n", yytext);
    return BASIS;
}

"BEFORE"  {printf("%s : KEYWORD\n", yytext);
    return BEFORE;
}

"BEGINNING"  {printf("%s : KEYWORD\n", yytext);
    return BEGINNING;
}

"BINARY"  {printf("%s : KEYWORD\n", yytext);
    return BINARY;
}

"BLANK"  {printf("%s : KEYWORD\n", yytext);
    return BLANK;
}

"BLOCK"  {printf("%s : KEYWORD\n", yytext);
    return BLOCK;
}

"BOTTOM"  {printf("%s : KEYWORD\n", yytext);
    return BOTTOM;
}

"BY"  {printf("%s : KEYWORD\n", yytext);
    return BY;
}

"BYTE-LENGTH"  {printf("%s : KEYWORD\n", yytext);
    return BYTE_LENGTH;
}

"CALL"  {printf("%s : KEYWORD\n", yytext);
    return CALL;
}

"CANCEL"  {printf("%s : KEYWORD\n", yytext);
    return CANCEL;
}

"CBL"  {printf("%s : KEYWORD\n", yytext);
    return CBL;
}

"CD"  {printf("%s : KEYWORD\n", yytext);
    return CD;
}

"CF"  {printf("%s : KEYWORD\n", yytext);
    return CF;
}

"CH"  {printf("%s : KEYWORD\n", yytext);
    return CH;
}

"CHARACTER"  {printf("%s : KEYWORD\n", yytext);
    return CHARACTER;
}

"CHARACTERS"  {printf("%s : KEYWORD\n", yytext);
    return CHARACTERS;
}

"CLASS"  {printf("%s : KEYWORD\n", yytext);
    return CLASS;
}

"CLASS-ID"  {printf("%s : KEYWORD\n", yytext);
    return CLASS_ID;
}

"CLOCK-UNITS"  {printf("%s : KEYWORD\n", yytext)
    return CLOCK_UNITS;
}

"CLOSE"  {printf("%s : KEYWORD\n", yytext);
    return CLOSE;
}

"COBOL"  {printf("%s : KEYWORD\n", yytext);
    return COBOL;
}

"CODE"  {printf("%s : KEYWORD\n", yytext);
    return CODE;
}

"CODE-SET"  {printf("%s : KEYWORD\n", yytext);
    return CODE_SET;
}

"COLLATING"  {printf("%s : KEYWORD\n", yytext);
    return COLLATING;
}

"COLUMN"  {printf("%s : KEYWORD\n", yytext);
    return COLUMN;
}

"COM-REG"  {printf("%s : KEYWORD\n", yytext);
    return COM_REG;
}

"COMMA"  {printf("%s : KEYWORD\n", yytext);
    return COMMA;
}

"COMMON"  {printf("%s : KEYWORD\n", yytext);
    return COMMON;
}

"COMMUNICATION"  {printf("%s : KEYWORD\n", yytext);
    return COMMUNICATION;
}

"COMP"  {printf("%s : KEYWORD\n", yytext);
    return COMP;
}

"COMP-1"  {printf("%s : KEYWORD\n", yytext);
    return COMP_1;
}

"COMP-2"  {printf("%s : KEYWORD\n", yytext);
    return COMP_2;
}

"COMP-3"  {printf("%s : KEYWORD\n", yytext);
    return COMP_3;
}

"COMP-4"  {printf("%s : KEYWORD\n", yytext);
    return COMP_4;
}

"COMP-5"  {printf("%s : KEYWORD\n", yytext);
    return COMP_5;
}

"COMPUTATIONAL"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTATIONAL;
}

"COMPUTATIONAL-1"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTATIONAL_1;
}

"COMPUTATIONAL-2"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTATIONAL_2;
}

"COMPUTATIONAL-3"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTATIONAL_3;
}

"COMPUTATIONAL-4"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTATIONAL_4;
}

"COMPUTATIONAL-5"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTATIONAL_5;
}

"COMPUTE"  {printf("%s : KEYWORD\n", yytext);
    return COMPUTE;
}

"CONFIGURATION"  {printf("%s : KEYWORD\n", yytext);
    return CONFIGURATION;
}

"CONTAINS"  {printf("%s : KEYWORD\n", yytext);
    return CONTAINS;
}

"CONTENT"  {printf("%s : KEYWORD\n", yytext);
    return CONTENT;
}

"CONTINUE"  {printf("%s : KEYWORD\n", yytext);
    return CONTINUE;
}

"CONTROL"  {printf("%s : KEYWORD\n", yytext);
    return CONTROL;
}

"CONTROLS"  {printf("%s : KEYWORD\n", yytext);
    return CONTROLS;
}

"CONVERTING"  {printf("%s : KEYWORD\n", yytext);
    return CONVERTING;
}

"COPY"  {printf("%s : KEYWORD\n", yytext);
    return COPY;
}

"CORR"  {printf("%s : KEYWORD\n", yytext);
    return CORR;
}

"CORRESPONDING"  {printf("%s : KEYWORD\n", yytext);
    return CORRESPONDING;
}

"COUNT"  {printf("%s : KEYWORD\n", yytext);
    return COUNT;
}

"CURRENCY"  {printf("%s : KEYWORD\n", yytext);
    return CURRENCY;
}

"DATA"  {printf("%s : KEYWORD\n", yytext);
    return DATA;
}

"DATE"  {printf("%s : KEYWORD\n", yytext);
    return DATE;
}

"DATE-COMPILED"  {printf("%s : KEYWORD\n", yytext);
    return DATE_COMPILED;
}

"DATE-WRITTEN"  {printf("%s : KEYWORD\n", yytext);
    return DATE_WRITTEN;
}

"DAY"  {printf("%s : KEYWORD\n", yytext);
    return DAY;
}

"DAY-OF-WEEK"  {printf("%s : KEYWORD\n", yytext);
    return DAY_OF_WEEK;
}

"DBCS"  {printf("%s : KEYWORD\n", yytext);
    return DBCS;
}

"DE"  {printf("%s : KEYWORD\n", yytext);
    return DE;
}

"DEBUG-CONTENTS"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_CONTENTS;
}

"DEBUG-ITEM"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_ITEM;
}

"DEBUG-LINE"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_LINE;
}

"DEBUG-NAME"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_NAME;
}

"DEBUG-SUB-1"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_SUB_1;
}

"DEBUG-SUB-2"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_SUB_2;
    }

"DEBUG-SUB-3"  {printf("%s : KEYWORD\n", yytext);
    return DEBUG_SUB_3;
}

"DEBUGGING"  {printf("%s : KEYWORD\n", yytext);
    return DEBUGGING;
}

"DECIMAL-POINT"  {printf("%s : KEYWORD\n", yytext);
    return DECIMAL_POINT;
}

"DECLARATIVES"  {printf("%s : KEYWORD\n", yytext);
    return DECLARATIVES;
}

"DEFAULT"  {printf("%s : KEYWORD\n", yytext);
    return DEFAULT;
}

"DELETE"  {printf("%s : KEYWORD\n", yytext);
    return DELETE;
}

"DELIMITED"  {printf("%s : KEYWORD\n", yytext);
    return DELIMITED;
}

"DELIMITER"  {printf("%s : KEYWORD\n", yytext);
    return DELIMITER;
}

"DEPENDING"  {printf("%s : KEYWORD\n", yytext);
    return DEPENDING;
}

"DESCENDING"  {printf("%s : KEYWORD\n", yytext);
    return DESCENDING;
}

"DESTINATION"  {printf("%s : KEYWORD\n", yytext);
    return DESTINATION;
}

"DETAIL"  {printf("%s : KEYWORD\n", yytext);
    return DETAIL;
}

"DISABLE"  {printf("%s : KEYWORD\n", yytext);
    return DISABLE;
}

"DISPLAY"  {printf("%s : KEYWORD\n", yytext);
    return DISPLAY;
}

"DISPLAY-1"  {printf("%s : KEYWORD\n", yytext);
    return DISPLAY_1;
}

"DIVIDE"  {printf("%s : KEYWORD\n", yytext);
    return DIVIDE;
}

"DIVISION"  {printf("%s : KEYWORD\n", yytext);
    return DIVISION;
}

"DOWN"  {printf("%s : KEYWORD\n", yytext);
    return DOWN;
}

"DUPLICATES"  {printf("%s : KEYWORD\n", yytext);
    return DUPLICATES;
}

"DYNAMIC"  {printf("%s : KEYWORD\n", yytext);
    return DYNAMIC;
}

"EGCS"  {printf("%s : KEYWORD\n", yytext);
    return EGCS;
}

"EGI"  {printf("%s : KEYWORD\n", yytext);
    return EGI;
}

"EJECT"  {printf("%s : KEYWORD\n", yytext);
    return EJECT;
}

"ELSE"  {printf("%s : KEYWORD\n", yytext);
    return ELSE;
}

"EMI"  {printf("%s : KEYWORD\n", yytext);
    return EMI;
}

"ENABLE"  {printf("%s : KEYWORD\n", yytext);
    return ENABLE;
}

"END"  {printf("%s : KEYWORD\n", yytext);
    return END;
}

"END-ADD"  {printf("%s : KEYWORD\n", yytext);
    return END_ADD;
}

"END-CALL"  {printf("%s : KEYWORD\n", yytext);
    return END_CALL;
}

"END-COMPUTE"  {printf("%s : KEYWORD\n", yytext);
    return END_COMPUTE;
}

"END-DELETE"  {printf("%s : KEYWORD\n", yytext);
    return END_DELETE;
}

"END-DIVIDE"  {printf("%s : KEYWORD\n", yytext);
    return END_DIVIDE;
}

"END-EVALUATE"  {printf("%s : KEYWORD\n", yytext);
    return END_EVALUATE;
}

"END-EXEC"  {printf("%s : KEYWORD\n", yytext);
    return END_EXEC;
}

"END-IF"  {printf("%s : KEYWORD\n", yytext);
    return END_IF;
}

"END-INVOKE"  {printf("%s : KEYWORD\n", yytext);
    return END_INVOKE;
}

"END-JSON"  {printf("%s : KEYWORD\n", yytext);
    return END_JSON;
}

"END-MULTIPLY"  {printf("%s : KEYWORD\n", yytext);
    return END_MULTIPLY;
}

"END-OF-PAGE"  {printf("%s : KEYWORD\n", yytext);
    return END_OF_PAGE;
}

"END-PERFORM"  {printf("%s : KEYWORD\n", yytext);
    return END_PERFORM;
}

"END-READ"  {printf("%s : KEYWORD\n", yytext);
    return END_READ;
}

"END-RECEIVE"  {printf("%s : KEYWORD\n", yytext);
    return END_RECEIVE;
}

"END-RETURN"  {printf("%s : KEYWORD\n", yytext);
    return END_RETURN;
}

"END-REWRITE"  {printf("%s : KEYWORD\n", yytext);
    return END_REWRITE;
}

"END-SEARCH"  {printf("%s : KEYWORD\n", yytext);
    return END_SEARCH;
}

"END-START"  {printf("%s : KEYWORD\n", yytext);
    return END_START;
}

"END-STRING"  {printf("%s : KEYWORD\n", yytext);
    return END_STRING;
}

"END-SUBTRACT"  {printf("%s : KEYWORD\n", yytext);
    return END_SUBTRACT;
}

"END-UNSTRING"  {printf("%s : KEYWORD\n", yytext);
    return END_UNSTRING;
}

"END-WRITE"  {printf("%s : KEYWORD\n", yytext);
    return END_WRITE;
}

"END-XML"  {printf("%s : KEYWORD\n", yytext);
    return END_XML;
}

"ENDING"  {printf("%s : KEYWORD\n", yytext);
    return ENDING;
}

"ENTER"  {printf("%s : KEYWORD\n", yytext);
    return ENTER;
}

"ENTRY"  {printf("%s : KEYWORD\n", yytext);
    return ENTRY;
}

"ENVIRONMENT"  {printf("%s : KEYWORD\n", yytext);
    return ENVIRONMENT;
}

"EOP"  {printf("%s : KEYWORD\n", yytext);
    return EOP;
}

"EQUAL"  {printf("%s : KEYWORD\n", yytext);
    return EQUAL;
}

"ERROR"  {printf("%s : KEYWORD\n", yytext);
    return ERROR;
}

"ESI"  {printf("%s : KEYWORD\n", yytext);
    return ESI;
}

"EVALUATE"  {printf("%s : KEYWORD\n", yytext);
    return EVALUATE;
}

"EVERY"  {printf("%s : KEYWORD\n", yytext);
    return EVERY;
}

"EXCEPTION"  {printf("%s : KEYWORD\n", yytext);
    return EXCEPTION;
}

"EXEC"  {printf("%s : KEYWORD\n", yytext);
    return EXEC;
}

"EXECUTE"  {printf("%s : KEYWORD\n", yytext);
    return EXECUTE;
}

"EXIT"  {printf("%s : KEYWORD\n", yytext);
    return EXIT;
}

"EXTEND"  {printf("%s : KEYWORD\n", yytext)
    return EXTEND;
}

"EXTERNAL"  {printf("%s : KEYWORD\n", yytext);
    return EXTERNAL;
}

"FACTORY"  {printf("%s : KEYWORD\n", yytext);
    return FACTORY;
}

"FALSE"  {printf("%s : KEYWORD\n", yytext);
    return FALSE;
}

"FD"  {printf("%s : KEYWORD\n", yytext);
    return FD;
}

"FILE"  {printf("%s : KEYWORD\n", yytext);
    return FILE;
}

"FILE-CONTROL"  {printf("%s : KEYWORD\n", yytext);
    return FILE_CONTROL;
}

"FILLER"  {printf("%s : KEYWORD\n", yytext);
    return FILLER;
}

"FINAL"  {printf("%s : KEYWORD\n", yytext);
    return FINAL;
}

"FIRST"  {printf("%s : KEYWORD\n", yytext);
    return FIRST;
}

"FOOTING"  {printf("%s : KEYWORD\n", yytext);
    return FOOTING;
}

"FOR"  {printf("%s : KEYWORD\n", yytext);
    return FOR;
}

"FREE"  {printf("%s : KEYWORD\n", yytext);
    return FREE;
}

"FROM"  {printf("%s : KEYWORD\n", yytext);
    return FROM;
}

"FUNCTION"  {printf("%s : KEYWORD\n", yytext);
    return FUNCTION;
}

"FUNCTION-POINTER"  {printf("%s : KEYWORD\n", yytext);
    return FUNCTION_POINTER;
}

"GENERATE"  {printf("%s : KEYWORD\n", yytext);
    return GENERATE;
}

"GIVING"  {printf("%s : KEYWORD\n", yytext);
    return GIVING;
}

"GLOBAL"  {printf("%s : KEYWORD\n", yytext);
    return GLOBAL;
}

"GO"  {printf("%s : KEYWORD\n", yytext);
    return GO;
}

"GOBACK"  {printf("%s : KEYWORD\n", yytext);
    return GOBACK;
}

"GREATER"  {printf("%s : KEYWORD\n", yytext);
    return GREATER;
}

"GROUP"  {printf("%s : KEYWORD\n", yytext);
    return GROUP;
}

"GROUP-USAGE"  {printf("%s : KEYWORD\n", yytext);
    return GROUP_USAGE;
}

"HEADING"  {printf("%s : KEYWORD\n", yytext);
    return HEADING;
}

"HIGH-VALUE"  {printf("%s : KEYWORD\n", yytext);
    return HIGH_VALUE;
}

"HGIH-VALUES"  {printf("%s : KEYWORD\n", yytext);
    return HIGH_VALUES;
}

"I-O"  {printf("%s : KEYWORD\n", yytext);
    return I_O;
}

"I-O-CONTROL"  {printf("%s : KEYWORD\n", yytext);
    return I_O_CONTROL;
}

"ID"  {printf("%s : KEYWORD\n", yytext);
    return ID;
}

"IDENTIFICATION"  {printf("%s : KEYWORD\n", yytext);
    return IDENTIFICATION;
}

"IF"  {printf("%s : KEYWORD\n", yytext);
    return IF;
}

"IN"  {printf("%s : KEYWORD\n", yytext);
    return IN;
}

"INDEX"  {printf("%s : KEYWORD\n", yytext);
    return INDEX;
}

"INDEXED"  {printf("%s : KEYWORD\n", yytext);
    return INDEXED;
}

"INDICATE"  {printf("%s : KEYWORD\n", yytext);
    return INDICATE;
}

"INHERITS"  {printf("%s : KEYWORD\n", yytext);
    return INHERITS;
}

"INITIAL"  {printf("%s : KEYWORD\n", yytext);
    return INITIAL;
}

"INITIALIZE"  {printf("%s : KEYWORD\n", yytext);
    return INITIALIZE;
}

"INITIATE"  {printf("%s : KEYWORD\n", yytext);
    return INITIATE;
}

"INPUT"  {printf("%s : KEYWORD\n", yytext);
    return INPUT;
}

"INPUT-OUTPUT"  {printf("%s : KEYWORD\n", yytext);
    return INPUT_OUTPUT;
}

"INSERT"  {printf("%s : KEYWORD\n", yytext);
    return INSERT;
}

"INSPECT"  {printf("%s : KEYWORD\n", yytext);
    return INSPECT;
}

"INSTALLATION"  {printf("%s : KEYWORD\n", yytext);
    return INSTALLATION;
}

"INTO"  {printf("%s : KEYWORD\n", yytext);
    return INTO;
}

"INVALID"  {printf("%s : KEYWORD\n", yytext);
    return INVALID;
}

"INVOKE"  {printf("%s : KEYWORD\n", yytext);
    return INVOKE;
}

"IS"  {printf("%s : KEYWORD\n", yytext);
    return IS;
}

"JAVA"  {printf("%s : KEYWORD\n", yytext);
    return JAVA;
}

"JNIENVPTR"  {printf("%s : KEYWORD\n", yytext);
    return JNIENVPTR;
}

"JSON"  {printf("%s : KEYWORD\n", yytext);
    return JSON;
}

"JSON-CODE"  {printf("%s : KEYWORD\n", yytext);
    return JSON_CODE;
}

"JSON-STATUS"  {printf("%s : KEYWORD\n", yytext);
    return JSON_STATUS;
}

"JUST"  {printf("%s : KEYWORD\n", yytext);
    return JUST;
}

"JUSTIFIED"  {printf("%s : KEYWORD\n", yytext);
    return JUSTIFIED;
}

"KANJI"  {printf("%s : KEYWORD\n", yytext);
    return KANJI;
}

"KEY"  {printf("%s : KEYWORD\n", yytext);
    return KEY;
}

"LABEL"  {printf("%s : KEYWORD\n", yytext);
    return LABEL;
}

"LAST"  {printf("%s : KEYWORD\n", yytext);
    return LAST;
}

"LEADING"  {printf("%s : KEYWORD\n", yytext);
    return LEADING;
}

"LEFT"  {printf("%s : KEYWORD\n", yytext);
    return LEFT;
}

"LENGTH"  {printf("%s : KEYWORD\n", yytext);
    return LENGTH;
}

"LESS"  {printf("%s : KEYWORD\n", yytext);
    return LESS;
}

"LIMIT"  {printf("%s : KEYWORD\n", yytext);
    return LIMIT;
}

"LIMITS"  {printf("%s : KEYWORD\n", yytext);
    return LIMITS;
}

"LINAGE"  {printf("%s : KEYWORD\n", yytext);
    return LINAGE;
}

"LINAGE-COUNTER"  {printf("%s : KEYWORD\n", yytext);
    return LINAGE_COUNTER;
}

"LINE"  {printf("%s : KEYWORD\n", yytext);
    return LINE;
}

"LINE-COUNTER"  {printf("%s : KEYWORD\n", yytext);
    return LINE_COUNTER;
}

"LINES"  {printf("%s : KEYWORD\n", yytext);
    return LINES;
}

"LINKAGE"  {printf("%s : KEYWORD\n", yytext);
    return LINKAGE;
}

"LOCAL-STORAGE"  {printf("%s : KEYWORD\n", yytext);
    return LOCAL_STORAGE;
}

"LOCK"  {printf("%s : KEYWORD\n", yytext);
    return LOCK;
}

"LOW-VALUE"  {printf("%s : KEYWORD\n", yytext);
    return LOW_VALUE;
}

"LOW-VALUES"  {printf("%s : KEYWORD\n", yytext);
    return LOW_VALUES;
}

"MEMORY"  {printf("%s : KEYWORD\n", yytext);
    return MEMORY;
}

"MERGE"  {printf("%s : KEYWORD\n", yytext);
    return MERGE;
}

"MESSAGE"  {printf("%s : KEYWORD\n", yytext);
    return MESSAGE;
}

"METHOD"  {printf("%s : KEYWORD\n", yytext);
    return METHOD;
}

"METHOD-ID"  {printf("%s : KEYWORD\n", yytext);
    return METHOD_ID;
}

"MODE"  {printf("%s : KEYWORD\n", yytext);
    return MODE;
}

"MODULES"  {printf("%s : KEYWORD\n", yytext);
    return MODULES;
}

"MORE-LABELS"  {printf("%s : KEYWORD\n", yytext);
    return MORE_LABELS;
}

"MOVE"  {printf("%s : KEYWORD\n", yytext);
    return MOVEL
}

"MULTIPLE"  {printf("%s : KEYWORD\n", yytext);
    return MULTIPLE;
}

"MULTIPLY"  {printf("%s : KEYWORD\n", yytext);
    return MULTIPLY;
}

"NATIONAL"  {printf("%s : KEYWORD\n", yytext);
    return NATIONAL;
}

"NATIONAL-EDITED"  {printf("%s : KEYWORD\n", yytext);
    return NATIONAL_EDITED;
}

"NATIVE"  {printf("%s : KEYWORD\n", yytext);
    return NATIVE;
}

"NEGATIVE"  {printf("%s : KEYWORD\n", yytext);
    return NEGATIVE;
}

"NEXT"  {printf("%s : KEYWORD\n", yytext);
    return NEXT;
}

"NO"  {printf("%s : KEYWORD\n", yytext);
    return NO;
}

"NOT"  {printf("%s : KEYWORD\n", yytext);
    return NOT;
}

"NULL"  {printf("%s : KEYWORD\n", yytext);
    return NULL;
}

"NULLS"  {printf("%s : KEYWORD\n", yytext);
    return NULLS;
}

"NUMBER"  {printf("%s : KEYWORD\n", yytext)
    return MUMBER;
}

"NUMERIC"  {printf("%s : KEYWORD\n", yytext);
    return NUMERIC;
}

"NUMERIC-EDITED"  {printf("%s : KEYWORD\n", yytext);
    return NUMERIC_EDITED;
}

"OBJECT"  {printf("%s : KEYWORD\n", yytext);
    return OBJECT;
}

"OBJECT-COMPUTER"  {printf("%s : KEYWORD\n", yytext);
    return OBJECT_COMPUTER;
}

"OCCURS"  {printf("%s : KEYWORD\n", yytext);
    return OCCURS;
}

"OF"  {printf("%s : KEYWORD\n", yytext);
    return OF;
}

"OFF"  {printf("%s : KEYWORD\n", yytext);
    return OFF;
}

"OMITTED"  {printf("%s : KEYWORD\n", yytext);
    return OMITTED;
}

"ON"  {printf("%s : KEYWORD\n", yytext);
    return ON;
}

"OPEN"  {printf("%s : KEYWORD\n", yytext);
    return OPEN;
}

"OPTIONAL"  {printf("%s : KEYWORD\n", yytext);
    return OPTIONAL;
}

"OR"  {printf("%s : KEYWORD\n", yytext);
    return OR;
}

"ORDER"  {printf("%s : KEYWORD\n", yytext);
    return ORDER;
}

"ORGANIZATION"  {printf("%s : KEYWORD\n", yytext);
    return ORGANIZATION;
}

"OTHER"  {printf("%s : KEYWORD\n", yytext);
    return OTHER;
}

"OUTPUT"  {printf("%s : KEYWORD\n", yytext);
    return OUTPUT;
}

"OVERFLOW"  {printf("%s : KEYWORD\n", yytext);
    return OVERFLOW;
}

"OVERRIDE"  {printf("%s : KEYWORD\n", yytext);
    return OVERRIDE;
}

"PACKED-DECIMAL"  {printf("%s : KEYWORD\n", yytext);
    return PACKED_DECIMAL;
}

"PADDING"  {printf("%s : KEYWORD\n", yytext);
    return PADDING;
}

"PAGE"  {printf("%s : KEYWORD\n", yytext);
    return PAGE;
}

"PAGE-COUNTER"  {printf("%s : KEYWORD\n", yytext);
    return PAGE_COUNTER;
}

"PASSWORD"  {printf("%s : KEYWORD\n", yytext);
    return PASSWORD;
}

"PERFORM"  {printf("%s : KEYWORD\n", yytext);
    return PERFORM;
}

"PF"  {printf("%s : KEYWORD\n", yytext);
    return PF;
}

"PH"  {printf("%s : KEYWORD\n", yytext);
    return PH;
}

"PIC"  {printf("%s : KEYWORD\n", yytext);
    return PIC;
}

"PICTURE"  {printf("%s : KEYWORD\n", yytext);
    return PICTURE;
}

"PLUS"  {printf("%s : KEYWORD\n", yytext);
    return PLUS;
}

"POINTER"  {printf("%s : KEYWORD\n", yytext);
    return POINTER;
}

"POINTER-32"  {printf("%s : KEYWORD\n", yytext);
    return POINTER_32;
}

"POSITION"  {printf("%s : KEYWORD\n", yytext);
    return POSITION;
}

"POSITIVE"  {printf("%s : KEYWORD\n", yytext);
    return POSITIVE;
}

"PRINTING"  {printf("%s : KEYWORD\n", yytext);
    return PRINTING;
}

"PROCEDURE"  {printf("%s : KEYWORD\n", yytext);
    return PROCEDURE;
}

"PROCEDURE-POINTER"  {printf("%s : KEYWORD\n", yytext);
    return PROCEDURE_POINTER;
}

"PROCEDURES"  {printf("%s : KEYWORD\n", yytext);
    return PROCEDURES;
}

"PROCEED"  {printf("%s : KEYWORD\n", yytext);
    return PROCEED;
}

"PROCESSING"  {printf("%s : KEYWORD\n", yytext);
    return PROCESSING;
}

"PROGRAM"  {printf("%s : KEYWORD\n", yytext);
    return PROGRAM;
}

"PROGRAM-ID"  {printf("%s : KEYWORD\n", yytext);
    return PROGRAM_ID;
}

"PURGE"  {printf("%s : KEYWORD\n", yytext);
    return PURGE;
}

"QUEUE"  {printf("%s : KEYWORD\n", yytext);
    return QUEUE;
}

"QUOTE"  {printf("%s : KEYWORD\n", yytext);
    return QUOTE;
}

"QUOTES"  {printf("%s : KEYWORD\n", yytext);
    return QUOTES;
}

"RANDOM"  {printf("%s : KEYWORD\n", yytext);
    return RANDOM;
}

"RD"  {printf("%s : KEYWORD\n", yytext);
    return RD;
}

"READ"  {printf("%s : KEYWORD\n", yytext);
    return READ;
}

"READY"  {printf("%s : KEYWORD\n", yytext);
    return READY;
}

"RECEIVE"  {printf("%s : KEYWORD\n", yytext);
    return RECEIVE;
}

"RECORD"  {printf("%s : KEYWORD\n", yytext);
    return RECORD;
}

"RECORDING"  {printf("%s : KEYWORD\n", yytext);
    return RECORDING;
}

"RECORDS"  {printf("%s : KEYWORD\n", yytext);
    return RECORDS;
}

"RECURSIVE"  {printf("%s : KEYWORD\n", yytext);
    return RECURSIVE;
}

"REDEFINES"  {printf("%s : KEYWORD\n", yytext);
    return REDEFINES;
}

"REEL"  {printf("%s : KEYWORD\n", yytext);
    return REEL;
}

"REFERENCE"  {printf("%s : KEYWORD\n", yytext);
    return REFERENCE;
}

"REFERENCES"  {printf("%s : KEYWORD\n", yytext);
    return REFERENCES;
}

"RELATIVE"  {printf("%s : KEYWORD\n", yytext);
    return RELATIVE;
}

"RELEASE"  {printf("%s : KEYWORD\n", yytext);
    return RELEASE;
}

"RELOAD"  {printf("%s : KEYWORD\n", yytext);
    return RELOAD;
}

"REMAINDER"  {printf("%s : KEYWORD\n", yytext);
    return REMAINDER;
}

"REMOVAL"  {printf("%s : KEYWORD\n", yytext);
    return REMOVAL;
}

"RENAMES"  {printf("%s : KEYWORD\n", yytext);
    return RENAMES;
}

"REPLACE"  {printf("%s : KEYWORD\n", yytext);
    return REPLACE;
}

"REPLACING"  {printf("%s : KEYWORD\n", yytext);
    return REPLACING;
}

"REPORT"  {printf("%s : KEYWORD\n", yytext);
    return REPORT;
}

"REPORTING"  {printf("%s : KEYWORD\n", yytext);
    return REPORTING;
}

"REPORTS"  {printf("%s : KEYWORD\n", yytext);
    return REPORTS;
}

"REPOSITORY"  {printf("%s : KEYWORD\n", yytext);
    return REPOSITORY;
}

"RERUN"  {printf("%s : KEYWORD\n", yytext);
    return RERUN;
}

"RESERVE"  {printf("%s : KEYWORD\n", yytext);
    return RESERVE;
}

"RESET"  {printf("%s : KEYWORD\n", yytext);
    return RESET;
}

"RETURN"  {printf("%s : KEYWORD\n", yytext);
    return RETURN;
}

"RETURN-CODE"  {printf("%s : KEYWORD\n", yytext);
    return RETURN_CODE;
}

"RETURNING"  {printf("%s : KEYWORD\n", yytext);
    return RETURNING;
}

"REVERSED"  {printf("%s : KEYWORD\n", yytext);
    return REVERSED;
}

"REWIND"  {printf("%s : KEYWORD\n", yytext);
    return REWIND;
}

"REWRITE"  {printf("%s : KEYWORD\n", yytext);
    return REWRITE;
}

"RF"  {printf("%s : KEYWORD\n", yytext);
    return RF;
}

"RH"  {printf("%s : KEYWORD\n", yytext);
    return RH;
}

"RIGHT"  {printf("%s : KEYWORD\n", yytext);
    return RIGHT;
}

"ROUNDED"  {printf("%s : KEYWORD\n", yytext);
    return ROUNDED;
}

"RUN"  {printf("%s : KEYWORD\n", yytext);
    return RUN;
}

"SAME"  {printf("%s : KEYWORD\n", yytext);
    return SAME;
}

"SD"  {printf("%s : KEYWORD\n", yytext);
    return SD;
}

"SEARCH"  {printf("%s : KEYWORD\n", yytext);
    return SEARCH;
}

"SECTION"  {printf("%s : KEYWORD\n", yytext);
    return SECTION;
}

"SECURITY"  {printf("%s : KEYWORD\n", yytext);
    return SECURITY;
}

"SEGMENT"  {printf("%s : KEYWORD\n", yytext);
    return SEGMENT;
}

"SEGMENT-LIMIT"  {printf("%s : KEYWORD\n", yytext);
    return SEGMENT_LIMIT;
}

"SELECT"  {printf("%s : KEYWORD\n", yytext);
    return SELECT;
}

"SELF"  {printf("%s : KEYWORD\n", yytext);
    return SELF;
}

"SEND"  {printf("%s : KEYWORD\n", yytext);
    return SEND;
}

"SENTENCE"  {printf("%s : KEYWORD\n", yytext);
    return SENTENCE;
}

"SEPARATE"  {printf("%s : KEYWORD\n", yytext);
    return SEPARATE;
}

"SEQUENCE"  {printf("%s : KEYWORD\n", yytext);
    return SEQUENCE;
}

"SEQUENTIAL"  {printf("%s : KEYWORD\n", yytext);
    return SEQUENTIAL;
}

"SERVICE"  {printf("%s : KEYWORD\n", yytext);
    return SERVICE;
}

"SET"  {printf("%s : KEYWORD\n", yytext);
    return SET;
}

"SHIFT-IN"  {printf("%s : KEYWORD\n", yytext);
    return SHIFT_IN;
}

"SHIFT-OUT"  {printf("%s : KEYWORD\n", yytext);
    return SHIFT_OUT;
}

"SIGN"  {printf("%s : KEYWORD\n", yytext);
    return SIGN;
}

"SIZE"  {printf("%s : KEYWORD\n", yytext);
    return SIZE;
}

"SKIP1"  {printf("%s : KEYWORD\n", yytext);
    return SKIP1;
}

"SKIP2"  {printf("%s : KEYWORD\n", yytext);
    return SKIP2;
}

"SKIP3"  {printf("%s : KEYWORD\n", yytext);
    return SKIP3;
}

"SORT"  {printf("%s : KEYWORD\n", yytext);
    return SORT;
}

"SORT-CONTROL"  {printf("%s : KEYWORD\n", yytext);
    return SORT_CONTROL;
}

"SORT-CORE-SIZE"  {printf("%s : KEYWORD\n", yytext);
    return SORT_CORE-SIZE;
}

"SORT-FILE-SIZE"  {printf("%s : KEYWORD\n", yytext);
    return SORT_FILE-SIZE;
}

"SORT-MERGE"  {printf("%s : KEYWORD\n", yytext);
    return SORT_MERGE;
}

"SORT-MESSAGE"  {printf("%s : KEYWORD\n", yytext);
    return SORT_MESSAGE;
}

"SORT-MODE-SIZE"  {printf("%s : KEYWORD\n", yytext);
    return SORT_MODE-SIZE;
}

"SORT-RETURN"  {printf("%s : KEYWORD\n", yytext);
    return SORT_RETURN;
}

"SOURCE"  {printf("%s : KEYWORD\n", yytext);
    return SOURCE;
}

"SOURCE-COMPUTER"  {printf("%s : KEYWORD\n", yytext);
    return SOURCE_COMPUTER;
}

"SPACE"  {printf("%s : KEYWORD\n", yytext);
    return SPACE;
}

"SPACES"  {printf("%s : KEYWORD\n", yytext);
    return SPACES;
}

"SPECIAL-NAMES"  {printf("%s : KEYWORD\n", yytext);
    return SPECIAL_NAMES;
}

"SQL"  {printf("%s : KEYWORD\n", yytext);
    return SQL;
}

"SQLIMS"  {printf("%s : KEYWORD\n", yytext);
    return SQLIMS;
}

"STANDARD"  {printf("%s : KEYWORD\n", yytext);
    return STANDARD;
}

"STANDARD-1"  {printf("%s : KEYWORD\n", yytext);
    return STANDARD_1;
}

"STANDARD-2"  {printf("%s : KEYWORD\n", yytext);
    return STANDARD_2;
}

"START"  {printf("%s : KEYWORD\n", yytext);
    return START;
}

"STATUS"  {printf("%s : KEYWORD\n", yytext);
    return STATUS;
}

"STOP"  {printf("%s : KEYWORD\n", yytext);
    return STOP;
}

"STRING"  {printf("%s : KEYWORD\n", yytext);
    return STRING;
}

"SUB-QUEUE-1"  {printf("%s : KEYWORD\n", yytext);
    return sub_QUEUE_1;
}

"SUB-QUEUE-2"  {printf("%s : KEYWORD\n", yytext);
    return sub_QUEUE_2;
}

"SUB-QUEUE-3"  {printf("%s : KEYWORD\n", yytext);
    return sub_QUEUE_3;
}

"SUBTRACT"  {printf("%s : KEYWORD\n", yytext);
    return SUBTRACT;
}

"SUM"  {printf("%s : KEYWORD\n", yytext);
    return SUM;
}

"SUPER"  {printf("%s : KEYWORD\n", yytext);
    return SUPER;
}

"SUPPRESS"  {printf("%s : KEYWORD\n", yytext);
    return SUPPRESS;
}

"SYMBOLIC"  {printf("%s : KEYWORD\n", yytext);
    return SYMBOLIC;
}

"SYNC"  {printf("%s : KEYWORD\n", yytext);
    return SYNC;
}

"SYNCHRONIZED"  {printf("%s : KEYWORD\n", yytext);
    return SYNCHRONIZED;
}

"TABLE"  {printf("%s : KEYWORD\n", yytext);
    return TABLE;
}

"TALLY"  {printf("%s : KEYWORD\n", yytext);
    return TALLYl
}

"TALLYING"  {printf("%s : KEYWORD\n", yytext);
    return TALLYING;
}

"TAPE"  {printf("%s : KEYWORD\n", yytext);
    return TAPE;
}

"TERMINAL"  {printf("%s : KEYWORD\n", yytext);
    return TERMINAL;
}

"TERMINATE"  {printf("%s : KEYWORD\n", yytext);
    return TERMINATE;
}

"TEST"  {printf("%s : KEYWORD\n", yytext);
    return TEST;
}

"TEXT"  {printf("%s : KEYWORD\n", yytext);
    return TEXT;
}

"THAN"  {printf("%s : KEYWORD\n", yytext);
    return THAN;
}

"THEN"  {printf("%s : KEYWORD\n", yytext);
    return THEN;
}

"THROUGH"  {printf("%s : KEYWORD\n", yytext);
    return THROUGH;
}

"THRU"  {printf("%s : KEYWORD\n", yytext);
    return THRU;
}

"TIME"  {printf("%s : KEYWORD\n", yytext);
    return TIME;
}

"TIMES"  {printf("%s : KEYWORD\n", yytext);
    return TIMES;
}

"TITLE"  {printf("%s : KEYWORD\n", yytext);
    return TITLE;
}

"TO"  {printf("%s : KEYWORD\n", yytext);
    return TO;
}

"TOP"  {printf("%s : KEYWORD\n", yytext);
    return TOP;
}

"TRACE"  {printf("%s : KEYWORD\n", yytext);
    return TRACE;
}

"TRAILING"  {printf("%s : KEYWORD\n", yytext);
    return TRAILING;
}

"TRUE"  {printf("%s : KEYWORD\n", yytext);
    return TRUE;
}

"TYPE"  {printf("%s : KEYWORD\n", yytext);
    return TYPE;
}

"UNIT"  {printf("%s : KEYWORD\n", yytext);
    return UNIT;
}

"UNSTRING"  {printf("%s : KEYWORD\n", yytext);
    return UNSTRING;
}

"UNTIL"  {printf("%s : KEYWORD\n", yytext);
    return UNTIL;
}

"UP"  {printf("%s : KEYWORD\n", yytext);
    return UP;
}

"UPON"  {printf("%s : KEYWORD\n", yytext);
    return UPON;
}

"USAGE"  {printf("%s : KEYWORD\n", yytext);
    return USAGE;
}

"USE"  {printf("%s : KEYWORD\n", yytext);
    return USE;
}

"USIING"  {printf("%s : KEYWORD\n", yytext);
    return USIING;
}

"UTF-8"  {printf("%s : KEYWORD\n", yytext);
    return UTF_8;
}

"VALUE"  {printf("%s : KEYWORD\n", yytext);
    return VALUE;
}

"VALUES"  {printf("%s : KEYWORD\n", yytext);
    return VALUES;
}

"VARYING"  {printf("%s : KEYWORD\n", yytext);
    return VARYING;
}

"VOLATILE"  {printf("%s : KEYWORD\n", yytext);
    return VOLATILE;
}

"WHEN"  {printf("%s : KEYWORD\n", yytext);
    return WHEN;
}

"WHEN-COMPILED"  {printf("%s : KEYWORD\n", yytext);
    return WHEN_COMPILED;
}

"WITH"  {printf("%s : KEYWORD\n", yytext);
    return WITH;
}

"WORDS"  {printf("%s : KEYWORD\n", yytext);
    return WORDS;
}

"WORKING-STORAGE"  {printf("%s : KEYWORD\n", yytext);
    return WORKDING_STORAGE;
}

"WRITE"  {printf("%s : KEYWORD\n", yytext);
    return WRITE;
}

"WRITE-ONLY"  {printf("%s : KEYWORD\n", yytext);
    return WRITE_ONLY;
}

"XML"  {printf("%s : KEYWORD\n", yytext);
    return XML;
}

"XML-CODE"  {printf("%s : KEYWORD\n", yytext);
    return XML_CODE;
}

"XML-EVENT"  {printf("%s : KEYWORD\n", yytext);
    return XML_EVENT;
}

"XML-INFORMATION"  {printf("%s : KEYWORD\n", yytext);
    return XML_INFORMATION;
}

"XML-NAMESPACE"  {printf("%s : KEYWORD\n", yytext);
    return XML_NAMEPSPACE;
}

"XML-NAMEPSPACE-PREFIX"  {printf("%s : KEYWORD\n", yytext);
    return XML_NAMEPSPACE_PREFIX;
}

"XML-NNAMESPACE"  {printf("%s : KEYWORD\n", yytext);
    return XML_NNAMESPACE;
}

"XML-NNAMESPACE-PREFIX"  {printf("%s : KEYWORD\n", yytext);
    return XML_NNAMESPACE_PREFIX;
}

"XML-INTEXT"  {printf("%s : KEYWORD\n", yytext);
    return XML_INTEXT;
}

"XML-SCHEMA"  {printf("%s : KEYWORD\n", yytext);
    return XML_SCHEMA;
}

"XML-TEXT"  {printf("%s : KEYWORD\n", yytext);
    return XML_TEXT;
}

"ZERO"  {printf("%s : KEYWORD\n", yytext);
    return ZERO;
}

"ZEROES"  {printf("%s : KEYWORD\n", yytext);
    return ZEROES;
}

"ZEROS"  {printf("%s : KEYWORD\n", yytext);
    return ZEROS;
}

"."  {printf("%s : SEPARATOR\n", yytext);
    return PERIOD_SEP;
}

","  {printf("%s : SEPARATOR\n", yytext);
    return COMMA_SEP;
}

{DIGIT}     {printf("%s : DIGIT\n", yytext);
    return DIGIT;
}

{ID}        {printf("%s : ID\n", yytext);
    return ID;
} 

" " ;

{WS} {}

.   {printf("%s : Unrecognized symbol.\n", yytext);}

%%
