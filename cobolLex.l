%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <math.h>

#define YY_DECL int yylex()

%}

%option yylineno

DIGIT [0-9]
ID [A-Z][A-Z0-9]*

%%

"+"  {printf("%s : OPERATOR\n", yytext);}

"-"  {printf("%s : OPERATOR\n", yytext);}

"*"  {printf("%s : OPERATOR\n", yytext);}

"/"  {printf("%s : OPERATOR\n", yytext);}

"**" {printf("%s : OPERATOR\n", yytext);}

">"  {printf("%s : OPERATOR\n", yytext);}

"<"  {printf("%s : OPERATOR\n", yytext);}

"="  {printf("%s : OPERATOR\n", yytext);}

"=="  {printf("%s : OPERATOR\n", yytext);}

">="  {printf("%s : OPERATOR\n", yytext);}

"<="  {printf("%s : OPERATOR\n", yytext);}

"<>"  {printf("%s : OPERATOR\n", yytext);}

"*>"  {printf("%s : OPERATOR\n", yytext);}

">>"  {printf("%s : OPERATOR\n", yytext);}

"("  {printf("%s : OPERATOR\n", yytext);}

")"  {printf("%s : OPERATOR\n", yytext);}

"ACCEPT"  {printf("%s : KEYWORD\n", yytext);}

"ACCESS"  {printf("%s : KEYWORD\n", yytext);}

"ADD"  {printf("%s : KEYWORD\n", yytext);}

"ADDRESS"  {printf("%s : KEYWORD\n", yytext);}

"ADVANCING"  {printf("%s : KEYWORD\n", yytext);}

"AFTER"  {printf("%s : KEYWORD\n", yytext);}

"ALL"  {printf("%s : KEYWORD\n", yytext);}

"ALLOCATE"  {printf("%s : KEYWORD\n", yytext);}

"ALPHABET"  {printf("%s : KEYWORD\n", yytext);}

"ALPHABETIC"  {printf("%s : KEYWORD\n", yytext);}

"ALPHABETIC-LOWER"  {printf("%s : KEYWORD\n", yytext);}

"ALPHABETIC-UPPER"  {printf("%s : KEYWORD\n", yytext);}

"ALPHANUMERIC"  {printf("%s : KEYWORD\n", yytext);}

"ALPHANUMERIC-EDITED"  {printf("%s : KEYWORD\n", yytext);}

"ALSO"  {printf("%s : KEYWORD\n", yytext);}

"ALTER"  {printf("%s : KEYWORD\n", yytext);}

"ALTERNATIVE"  {printf("%s : KEYWORD\n", yytext);}

"AND"  {printf("%s : KEYWORD\n", yytext);}

"ANY"  {printf("%s : KEYWORD\n", yytext);}

"APPLY"  {printf("%s : KEYWORD\n", yytext);}

"ARE"  {printf("%s : KEYWORD\n", yytext);}

"AREA"  {printf("%s : KEYWORD\n", yytext);}

"AREAS"  {printf("%s : KEYWORD\n", yytext);}

"ASCENDING"  {printf("%s : KEYWORD\n", yytext);}

"ASSIGN"  {printf("%s : KEYWORD\n", yytext);}

"AT"  {printf("%s : KEYWORD\n", yytext);}

"AUTHOR"  {printf("%s : KEYWORD\n", yytext);}

"BASIS"  {printf("%s : KEYWORD\n", yytext);}

"BEFORE"  {printf("%s : KEYWORD\n", yytext);}

"BEGINNING"  {printf("%s : KEYWORD\n", yytext);}

"BINARY"  {printf("%s : KEYWORD\n", yytext);}

"BLANK"  {printf("%s : KEYWORD\n", yytext);}

"BLOCK"  {printf("%s : KEYWORD\n", yytext);}

"BOTTOM"  {printf("%s : KEYWORD\n", yytext);}

"BY"  {printf("%s : KEYWORD\n", yytext);}

"BYTE-LENGTH"  {printf("%s : KEYWORD\n", yytext);}

"CALL"  {printf("%s : KEYWORD\n", yytext);}

"CANCEL"  {printf("%s : KEYWORD\n", yytext);}

"CBL"  {printf("%s : KEYWORD\n", yytext);}

"CD"  {printf("%s : KEYWORD\n", yytext);}

"CF"  {printf("%s : KEYWORD\n", yytext);}

"CH"  {printf("%s : KEYWORD\n", yytext);}

"CHARACTER"  {printf("%s : KEYWORD\n", yytext);}

"CHARACTERS"  {printf("%s : KEYWORD\n", yytext);}

"CLASS"  {printf("%s : KEYWORD\n", yytext);}

"CLASS-ID"  {printf("%s : KEYWORD\n", yytext);}

"CLOCK-UNITS"  {printf("%s : KEYWORD\n", yytext);}

"CLOSE"  {printf("%s : KEYWORD\n", yytext);}

"COBOL"  {printf("%s : KEYWORD\n", yytext);}

"CODE"  {printf("%s : KEYWORD\n", yytext);}

"CODE-SET"  {printf("%s : KEYWORD\n", yytext);}

"COLLATING"  {printf("%s : KEYWORD\n", yytext);}

"COLUMN"  {printf("%s : KEYWORD\n", yytext);}

"COM-REG"  {printf("%s : KEYWORD\n", yytext);}

"COMMA"  {printf("%s : KEYWORD\n", yytext);}

"COMMON"  {printf("%s : KEYWORD\n", yytext);}

"COMMUNICATION"  {printf("%s : KEYWORD\n", yytext);}

"COMP"  {printf("%s : KEYWORD\n", yytext);}

"COMP-1"  {printf("%s : KEYWORD\n", yytext);}

"COMP-2"  {printf("%s : KEYWORD\n", yytext);}

"COMP-3"  {printf("%s : KEYWORD\n", yytext);}

"COMP-4"  {printf("%s : KEYWORD\n", yytext);}

"COMP-5"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTATIONAL"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTATIONAL-1"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTATIONAL-2"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTATIONAL-3"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTATIONAL-4"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTATIONAL-5"  {printf("%s : KEYWORD\n", yytext);}

"COMPUTE"  {printf("%s : KEYWORD\n", yytext);}

"CONFIGURATION"  {printf("%s : KEYWORD\n", yytext);}

"CONTAINS"  {printf("%s : KEYWORD\n", yytext);}

"CONTENT"  {printf("%s : KEYWORD\n", yytext);}

"CONTINUE"  {printf("%s : KEYWORD\n", yytext);}

"CONTROL"  {printf("%s : KEYWORD\n", yytext);}

"CONTROLS"  {printf("%s : KEYWORD\n", yytext);}

"CONVERTING"  {printf("%s : KEYWORD\n", yytext);}

"COPY"  {printf("%s : KEYWORD\n", yytext);}

"CORR"  {printf("%s : KEYWORD\n", yytext);}

"CORRESPONDING"  {printf("%s : KEYWORD\n", yytext);}

"COUNT"  {printf("%s : KEYWORD\n", yytext);}

"CURRENCY"  {printf("%s : KEYWORD\n", yytext);}

"DATA"  {printf("%s : KEYWORD\n", yytext);}

"DATE"  {printf("%s : KEYWORD\n", yytext);}

"DATE-COMPILED"  {printf("%s : KEYWORD\n", yytext);}

"DATE-WRITTEN"  {printf("%s : KEYWORD\n", yytext);}

"DAY"  {printf("%s : KEYWORD\n", yytext);}

"DAY-OF-WEEK"  {printf("%s : KEYWORD\n", yytext);}

"DBCS"  {printf("%s : KEYWORD\n", yytext);}

"DE"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-CONTENTS"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-ITEM"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-LINE"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-NAME"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-SUB-1"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-SUB-2"  {printf("%s : KEYWORD\n", yytext);}

"DEBUG-SUB-3"  {printf("%s : KEYWORD\n", yytext);}

"DEBUGGING"  {printf("%s : KEYWORD\n", yytext);}

"DECIMAL-POINT"  {printf("%s : KEYWORD\n", yytext);}

"DECLARATIVES"  {printf("%s : KEYWORD\n", yytext);}

"DEFAULT"  {printf("%s : KEYWORD\n", yytext);}

"DELETE"  {printf("%s : KEYWORD\n", yytext);}

"DELIMITED"  {printf("%s : KEYWORD\n", yytext);}

"DELIMITER"  {printf("%s : KEYWORD\n", yytext);}

"DEPENDING"  {printf("%s : KEYWORD\n", yytext);}

"DESCENDING"  {printf("%s : KEYWORD\n", yytext);}

"DESTINATION"  {printf("%s : KEYWORD\n", yytext);}

"DETAIL"  {printf("%s : KEYWORD\n", yytext);}

"DISABLE"  {printf("%s : KEYWORD\n", yytext);}

"DISPLAY"  {printf("%s : KEYWORD\n", yytext);}

"DISPLAY-1"  {printf("%s : KEYWORD\n", yytext);}

"DIVIDE"  {printf("%s : KEYWORD\n", yytext);}

"DIVISION"  {printf("%s : KEYWORD\n", yytext);}

"DOWN"  {printf("%s : KEYWORD\n", yytext);}

"DUPLICATES"  {printf("%s : KEYWORD\n", yytext);}

"DYNAMIC"  {printf("%s : KEYWORD\n", yytext);}

"EGCS"  {printf("%s : KEYWORD\n", yytext);}

"EGI"  {printf("%s : KEYWORD\n", yytext);}

"EJECT"  {printf("%s : KEYWORD\n", yytext);}

"ELSE"  {printf("%s : KEYWORD\n", yytext);}

"EMI"  {printf("%s : KEYWORD\n", yytext);}

"ENABLE"  {printf("%s : KEYWORD\n", yytext);}

"END"  {printf("%s : KEYWORD\n", yytext);}

"END-ADD"  {printf("%s : KEYWORD\n", yytext);}

"END-CALL"  {printf("%s : KEYWORD\n", yytext);}

"END-COMPUTE"  {printf("%s : KEYWORD\n", yytext);}

"END-DELETE"  {printf("%s : KEYWORD\n", yytext);}

"END-DIVIDE"  {printf("%s : KEYWORD\n", yytext);}

"END-EVALUATE"  {printf("%s : KEYWORD\n", yytext);}

"END-EXEC"  {printf("%s : KEYWORD\n", yytext);}

"END-IF"  {printf("%s : KEYWORD\n", yytext);}

"END-INVOKE"  {printf("%s : KEYWORD\n", yytext);}

"END-JSON"  {printf("%s : KEYWORD\n", yytext);}

"END-MULTIPLY"  {printf("%s : KEYWORD\n", yytext);}

"END-OF-PAGE"  {printf("%s : KEYWORD\n", yytext);}

"END-PERFORM"  {printf("%s : KEYWORD\n", yytext);}

"END-READ"  {printf("%s : KEYWORD\n", yytext);}

"END-RECEIVE"  {printf("%s : KEYWORD\n", yytext);}

"END-RETURN"  {printf("%s : KEYWORD\n", yytext);}

"END-REWRITE"  {printf("%s : KEYWORD\n", yytext);}

"END-SEARCH"  {printf("%s : KEYWORD\n", yytext);}

"END-START"  {printf("%s : KEYWORD\n", yytext);}

"END-STRING"  {printf("%s : KEYWORD\n", yytext);}

"END-SUBTRACT"  {printf("%s : KEYWORD\n", yytext);}

"END-UNSTRING"  {printf("%s : KEYWORD\n", yytext);}

"END-WRITE"  {printf("%s : KEYWORD\n", yytext);}

"END-XML"  {printf("%s : KEYWORD\n", yytext);}

"ENDING"  {printf("%s : KEYWORD\n", yytext);}

"ENTER"  {printf("%s : KEYWORD\n", yytext);}

"ENTRY"  {printf("%s : KEYWORD\n", yytext);}

"ENVIRONMENT"  {printf("%s : KEYWORD\n", yytext);}

"EOP"  {printf("%s : KEYWORD\n", yytext);}

"EQUAL"  {printf("%s : KEYWORD\n", yytext);}

"ERROR"  {printf("%s : KEYWORD\n", yytext);}

"ESI"  {printf("%s : KEYWORD\n", yytext);}

"EVALUATE"  {printf("%s : KEYWORD\n", yytext);}

"EVERY"  {printf("%s : KEYWORD\n", yytext);}

"EXCEPTION"  {printf("%s : KEYWORD\n", yytext);}

"EXEC"  {printf("%s : KEYWORD\n", yytext);}

"EXECUTE"  {printf("%s : KEYWORD\n", yytext);}

"EXIT"  {printf("%s : KEYWORD\n", yytext);}

"EXTEND"  {printf("%s : KEYWORD\n", yytext);}

"EXTERNAL"  {printf("%s : KEYWORD\n", yytext);}

"FACTORY"  {printf("%s : KEYWORD\n", yytext);}

"FALSE"  {printf("%s : KEYWORD\n", yytext);}

"FD"  {printf("%s : KEYWORD\n", yytext);}

"FILE"  {printf("%s : KEYWORD\n", yytext);}

"FILE-CONTROL"  {printf("%s : KEYWORD\n", yytext);}

"FILLER"  {printf("%s : KEYWORD\n", yytext);}

"FINAL"  {printf("%s : KEYWORD\n", yytext);}

"FIRST"  {printf("%s : KEYWORD\n", yytext);}

"FOOTING"  {printf("%s : KEYWORD\n", yytext);}

"FOR"  {printf("%s : KEYWORD\n", yytext);}

"FREE"  {printf("%s : KEYWORD\n", yytext);}

"FROM"  {printf("%s : KEYWORD\n", yytext);}

"FUNCTION"  {printf("%s : KEYWORD\n", yytext);}

"FUNCTION-POINTER"  {printf("%s : KEYWORD\n", yytext);}

"GENERATE"  {printf("%s : KEYWORD\n", yytext);}

"GIVING"  {printf("%s : KEYWORD\n", yytext);}

"GLOBAL"  {printf("%s : KEYWORD\n", yytext);}

"GO"  {printf("%s : KEYWORD\n", yytext);}

"GOBACK"  {printf("%s : KEYWORD\n", yytext);}

"GREATER"  {printf("%s : KEYWORD\n", yytext);}

"GROUP"  {printf("%s : KEYWORD\n", yytext);}

"GROUP-USAGE"  {printf("%s : KEYWORD\n", yytext);}

"HEADING"  {printf("%s : KEYWORD\n", yytext);}

"HIGH-VALUE"  {printf("%s : KEYWORD\n", yytext);}

"HGIH-VALUES"  {printf("%s : KEYWORD\n", yytext);}

"I-O"  {printf("%s : KEYWORD\n", yytext);}

"I-O-CONTROL"  {printf("%s : KEYWORD\n", yytext);}

"ID"  {printf("%s : KEYWORD\n", yytext);}

"IDENTIFICATION"  {printf("%s : KEYWORD\n", yytext);}

"IF"  {printf("%s : KEYWORD\n", yytext);}

"IN"  {printf("%s : KEYWORD\n", yytext);}

"INDEX"  {printf("%s : KEYWORD\n", yytext);}

"INDEXED"  {printf("%s : KEYWORD\n", yytext);}

"INDICATE"  {printf("%s : KEYWORD\n", yytext);}

"INHERITS"  {printf("%s : KEYWORD\n", yytext);}

"INITIAL"  {printf("%s : KEYWORD\n", yytext);}

"INITIALIZE"  {printf("%s : KEYWORD\n", yytext);}

"INITIATE"  {printf("%s : KEYWORD\n", yytext);}

"INPUT"  {printf("%s : KEYWORD\n", yytext);}

"INPUT-OUTPUT"  {printf("%s : KEYWORD\n", yytext);}

"INSERT"  {printf("%s : KEYWORD\n", yytext);}

"INSPECT"  {printf("%s : KEYWORD\n", yytext);}

"INSTALLATION"  {printf("%s : KEYWORD\n", yytext);}

"INTO"  {printf("%s : KEYWORD\n", yytext);}

"INVALID"  {printf("%s : KEYWORD\n", yytext);}

"INVOKE"  {printf("%s : KEYWORD\n", yytext);}

"IS"  {printf("%s : KEYWORD\n", yytext);}

"JAVA"  {printf("%s : KEYWORD\n", yytext);}

"JNIENVPTR"  {printf("%s : KEYWORD\n", yytext);}

"JSON"  {printf("%s : KEYWORD\n", yytext);}

"JSON-CODE"  {printf("%s : KEYWORD\n", yytext);}

"JSON-STATUS"  {printf("%s : KEYWORD\n", yytext);}

"JUST"  {printf("%s : KEYWORD\n", yytext);}

"JUSTIFIED"  {printf("%s : KEYWORD\n", yytext);}

"KANJI"  {printf("%s : KEYWORD\n", yytext);}

"KEY"  {printf("%s : KEYWORD\n", yytext);}

"LABEL"  {printf("%s : KEYWORD\n", yytext);}

"LAST"  {printf("%s : KEYWORD\n", yytext);}

"LEADING"  {printf("%s : KEYWORD\n", yytext);}

"LEFT"  {printf("%s : KEYWORD\n", yytext);}

"LENGTH"  {printf("%s : KEYWORD\n", yytext);}

"LESS"  {printf("%s : KEYWORD\n", yytext);}

"LIMIT"  {printf("%s : KEYWORD\n", yytext);}

"LIMITS"  {printf("%s : KEYWORD\n", yytext);}

"LINAGE"  {printf("%s : KEYWORD\n", yytext);}

"LINAGE-COUNTER"  {printf("%s : KEYWORD\n", yytext);}

"LINE"  {printf("%s : KEYWORD\n", yytext);}

"LINE-COUNTER"  {printf("%s : KEYWORD\n", yytext);}

"LINES"  {printf("%s : KEYWORD\n", yytext);}

"LINKAGE"  {printf("%s : KEYWORD\n", yytext);}

"LOCAL-STORAGE"  {printf("%s : KEYWORD\n", yytext);}

"LOCK"  {printf("%s : KEYWORD\n", yytext);}

"LOW-VALUE"  {printf("%s : KEYWORD\n", yytext);}

"LOW-VALUES"  {printf("%s : KEYWORD\n", yytext);}

"MEMORY"  {printf("%s : KEYWORD\n", yytext);}

"MERGE"  {printf("%s : KEYWORD\n", yytext);}

"MESSAGE"  {printf("%s : KEYWORD\n", yytext);}

"METHOD"  {printf("%s : KEYWORD\n", yytext);}

"METHOD-ID"  {printf("%s : KEYWORD\n", yytext);}

"MODE"  {printf("%s : KEYWORD\n", yytext);}

"MODULES"  {printf("%s : KEYWORD\n", yytext);}

"MORE-LABELS"  {printf("%s : KEYWORD\n", yytext);}

"MOVE"  {printf("%s : KEYWORD\n", yytext);}

"MULTIPLE"  {printf("%s : KEYWORD\n", yytext);}

"MULTIPLY"  {printf("%s : KEYWORD\n", yytext);}

"NATIONAL"  {printf("%s : KEYWORD\n", yytext);}

"NATIONAL-EDITED"  {printf("%s : KEYWORD\n", yytext);}

"NATIVE"  {printf("%s : KEYWORD\n", yytext);}

"NEGATIVE"  {printf("%s : KEYWORD\n", yytext);}

"NEXT"  {printf("%s : KEYWORD\n", yytext);}

"NO"  {printf("%s : KEYWORD\n", yytext);}

"NOT"  {printf("%s : KEYWORD\n", yytext);}

"NULL"  {printf("%s : KEYWORD\n", yytext);}

"NULLS"  {printf("%s : KEYWORD\n", yytext);}

"NUMBER"  {printf("%s : KEYWORD\n", yytext);}

"NUMERIC"  {printf("%s : KEYWORD\n", yytext);}

"NUMERIC-EDITED"  {printf("%s : KEYWORD\n", yytext);}

"OBJECT"  {printf("%s : KEYWORD\n", yytext);}

"OBJECT-COMPUTER"  {printf("%s : KEYWORD\n", yytext);}

"OCCURS"  {printf("%s : KEYWORD\n", yytext);}

"OF"  {printf("%s : KEYWORD\n", yytext);}

"OFF"  {printf("%s : KEYWORD\n", yytext);}

"OMITTED"  {printf("%s : KEYWORD\n", yytext);}

"ON"  {printf("%s : KEYWORD\n", yytext);}

"OPEN"  {printf("%s : KEYWORD\n", yytext);}

"OPTIONAL"  {printf("%s : KEYWORD\n", yytext);}

"OR"  {printf("%s : KEYWORD\n", yytext);}

"ORDER"  {printf("%s : KEYWORD\n", yytext);}

"ORGANIZATION"  {printf("%s : KEYWORD\n", yytext);}

"OTHER"  {printf("%s : KEYWORD\n", yytext);}

"OUTPUT"  {printf("%s : KEYWORD\n", yytext);}

"OVERFLOW"  {printf("%s : KEYWORD\n", yytext);}

"OVERRIDE"  {printf("%s : KEYWORD\n", yytext);}

"PACKED-DECIMAL"  {printf("%s : KEYWORD\n", yytext);}

"PADDING"  {printf("%s : KEYWORD\n", yytext);}

"PAGE"  {printf("%s : KEYWORD\n", yytext);}

"PAGE-COUNTER"  {printf("%s : KEYWORD\n", yytext);}

"PASSWORD"  {printf("%s : KEYWORD\n", yytext);}

"PERFORM"  {printf("%s : KEYWORD\n", yytext);}

"PF"  {printf("%s : KEYWORD\n", yytext);}

"PH"  {printf("%s : KEYWORD\n", yytext);}

"PIC"  {printf("%s : KEYWORD\n", yytext);}

"PICTURE"  {printf("%s : KEYWORD\n", yytext);}

"PLUS"  {printf("%s : KEYWORD\n", yytext);}

"POINTER"  {printf("%s : KEYWORD\n", yytext);}

"POINTER-32"  {printf("%s : KEYWORD\n", yytext);}

"POSITION"  {printf("%s : KEYWORD\n", yytext);}

"POSITIVE"  {printf("%s : KEYWORD\n", yytext);}

"PRINTING"  {printf("%s : KEYWORD\n", yytext);}

"PROCEDURE"  {printf("%s : KEYWORD\n", yytext);}

"PROCEDURE-POINTER"  {printf("%s : KEYWORD\n", yytext);}

"PROCEDURES"  {printf("%s : KEYWORD\n", yytext);}

"PROCEED"  {printf("%s : KEYWORD\n", yytext);}

"PROCESSING"  {printf("%s : KEYWORD\n", yytext);}

"PROGRAM"  {printf("%s : KEYWORD\n", yytext);}

"PROGRAM-ID"  {printf("%s : KEYWORD\n", yytext);}

"PURGE"  {printf("%s : KEYWORD\n", yytext);}

"QUEUE"  {printf("%s : KEYWORD\n", yytext);}

"QUOTE"  {printf("%s : KEYWORD\n", yytext);}

"QUOTES"  {printf("%s : KEYWORD\n", yytext);}

"RANDOM"  {printf("%s : KEYWORD\n", yytext);}

"RD"  {printf("%s : KEYWORD\n", yytext);}

"READ"  {printf("%s : KEYWORD\n", yytext);}

"READY"  {printf("%s : KEYWORD\n", yytext);}

"RECEIVE"  {printf("%s : KEYWORD\n", yytext);}

"RECORD"  {printf("%s : KEYWORD\n", yytext);}

"RECORDING"  {printf("%s : KEYWORD\n", yytext);}

"RECORDS"  {printf("%s : KEYWORD\n", yytext);}

"RECURSIVE"  {printf("%s : KEYWORD\n", yytext);}

"REDEFINES"  {printf("%s : KEYWORD\n", yytext);}

"REEL"  {printf("%s : KEYWORD\n", yytext);}

"REFERENCE"  {printf("%s : KEYWORD\n", yytext);}

"REFERENCES"  {printf("%s : KEYWORD\n", yytext);}

"RELATIVE"  {printf("%s : KEYWORD\n", yytext);}

"RELEASE"  {printf("%s : KEYWORD\n", yytext);}

"RELOAD"  {printf("%s : KEYWORD\n", yytext);}

"REMAINDER"  {printf("%s : KEYWORD\n", yytext);}

"REMOVAL"  {printf("%s : KEYWORD\n", yytext);}

"RENAMES"  {printf("%s : KEYWORD\n", yytext);}

"REPLACE"  {printf("%s : KEYWORD\n", yytext);}

"REPLACING"  {printf("%s : KEYWORD\n", yytext);}

"REPORT"  {printf("%s : KEYWORD\n", yytext);}

"REPORTING"  {printf("%s : KEYWORD\n", yytext);}

"REPORTS"  {printf("%s : KEYWORD\n", yytext);}

"REPOSITORY"  {printf("%s : KEYWORD\n", yytext);}

"RERUN"  {printf("%s : KEYWORD\n", yytext);}

"RESERVE"  {printf("%s : KEYWORD\n", yytext);}

"RESET"  {printf("%s : KEYWORD\n", yytext);}

"RETURN"  {printf("%s : KEYWORD\n", yytext);}

"RETURN-CODE"  {printf("%s : KEYWORD\n", yytext);}

"RETURNING"  {printf("%s : KEYWORD\n", yytext);}

"REVERSED"  {printf("%s : KEYWORD\n", yytext);}

"REWIND"  {printf("%s : KEYWORD\n", yytext);}

"REWRITE"  {printf("%s : KEYWORD\n", yytext);}

"RF"  {printf("%s : KEYWORD\n", yytext);}

"RH"  {printf("%s : KEYWORD\n", yytext);}

"RIGHT"  {printf("%s : KEYWORD\n", yytext);}

"ROUNDED"  {printf("%s : KEYWORD\n", yytext);}

"RUN"  {printf("%s : KEYWORD\n", yytext);}

"SAME"  {printf("%s : KEYWORD\n", yytext);}

"SD"  {printf("%s : KEYWORD\n", yytext);}

"SEARCH"  {printf("%s : KEYWORD\n", yytext);}

"SECTION"  {printf("%s : KEYWORD\n", yytext);}

"SECURITY"  {printf("%s : KEYWORD\n", yytext);}

"SEGMENT"  {printf("%s : KEYWORD\n", yytext);}

"SEGMENT-LIMIT"  {printf("%s : KEYWORD\n", yytext);}

"SELECT"  {printf("%s : KEYWORD\n", yytext);}

"SELF"  {printf("%s : KEYWORD\n", yytext);}

"SEND"  {printf("%s : KEYWORD\n", yytext);}

"SENTENCE"  {printf("%s : KEYWORD\n", yytext);}

"SEPARATE"  {printf("%s : KEYWORD\n", yytext);}

"SEQUENCE"  {printf("%s : KEYWORD\n", yytext);}

"SEQUENTIAL"  {printf("%s : KEYWORD\n", yytext);}

"SERVICE"  {printf("%s : KEYWORD\n", yytext);}

"SET"  {printf("%s : KEYWORD\n", yytext);}

"SHIFT-IN"  {printf("%s : KEYWORD\n", yytext);}

"SHIFT-OUT"  {printf("%s : KEYWORD\n", yytext);}

"SIGN"  {printf("%s : KEYWORD\n", yytext);}

"SIZE"  {printf("%s : KEYWORD\n", yytext);}

"SKIP1"  {printf("%s : KEYWORD\n", yytext);}

"SKIP2"  {printf("%s : KEYWORD\n", yytext);}

"SKIP3"  {printf("%s : KEYWORD\n", yytext);}

"SORT"  {printf("%s : KEYWORD\n", yytext);}

"SORT-CONTROL"  {printf("%s : KEYWORD\n", yytext);}

"SORT-CORE-SIZE"  {printf("%s : KEYWORD\n", yytext);}

"SORT-FILE-SIZE"  {printf("%s : KEYWORD\n", yytext);}

"SORT-MERGE"  {printf("%s : KEYWORD\n", yytext);}

"SORT-MESSAGE"  {printf("%s : KEYWORD\n", yytext);}

"SORT-MODE-SIZE"  {printf("%s : KEYWORD\n", yytext);}

"SORT-RETURN"  {printf("%s : KEYWORD\n", yytext);}

"SOURCE"  {printf("%s : KEYWORD\n", yytext);}

"SOURCE-COMPUTER"  {printf("%s : KEYWORD\n", yytext);}

"SPACE"  {printf("%s : KEYWORD\n", yytext);}

"SPACES"  {printf("%s : KEYWORD\n", yytext);}

"SPECIAL-NAMES"  {printf("%s : KEYWORD\n", yytext);}

"SQL"  {printf("%s : KEYWORD\n", yytext);}

"SQLIMS"  {printf("%s : KEYWORD\n", yytext);}

"STANDARD"  {printf("%s : KEYWORD\n", yytext);}

"STANDARD-1"  {printf("%s : KEYWORD\n", yytext);}

"STANDARD-2"  {printf("%s : KEYWORD\n", yytext);}

"START"  {printf("%s : KEYWORD\n", yytext);}

"STATUS"  {printf("%s : KEYWORD\n", yytext);}

"STOP"  {printf("%s : KEYWORD\n", yytext);}

"STRING"  {printf("%s : KEYWORD\n", yytext);}

"SUB-QUEUE-1"  {printf("%s : KEYWORD\n", yytext);}

"SUB-QUEUE-2"  {printf("%s : KEYWORD\n", yytext);}

"SUB-QUEUE-3"  {printf("%s : KEYWORD\n", yytext);}

"SUBTRACT"  {printf("%s : KEYWORD\n", yytext);}

"SUM"  {printf("%s : KEYWORD\n", yytext);}

"SUPER"  {printf("%s : KEYWORD\n", yytext);}

"SUPPRESS"  {printf("%s : KEYWORD\n", yytext);}

"SYMBOLIC"  {printf("%s : KEYWORD\n", yytext);}

"SYNC"  {printf("%s : KEYWORD\n", yytext);}

"SYNCHRONIZED"  {printf("%s : KEYWORD\n", yytext);}

"TABLE"  {printf("%s : KEYWORD\n", yytext);}

"TALLY"  {printf("%s : KEYWORD\n", yytext);}

"TALLYING"  {printf("%s : KEYWORD\n", yytext);}

"TAPE"  {printf("%s : KEYWORD\n", yytext);}

"TERMINAL"  {printf("%s : KEYWORD\n", yytext);}

"TERMINATE"  {printf("%s : KEYWORD\n", yytext);}

"TEST"  {printf("%s : KEYWORD\n", yytext);}

"TEXT"  {printf("%s : KEYWORD\n", yytext);}

"THAN"  {printf("%s : KEYWORD\n", yytext);}

"THEN"  {printf("%s : KEYWORD\n", yytext);}

"THROUGH"  {printf("%s : KEYWORD\n", yytext);}

"THRU"  {printf("%s : KEYWORD\n", yytext);}

"TIME"  {printf("%s : KEYWORD\n", yytext);}

"TIMES"  {printf("%s : KEYWORD\n", yytext);}

"TITLE"  {printf("%s : KEYWORD\n", yytext);}

"TO"  {printf("%s : KEYWORD\n", yytext);}

"TOP"  {printf("%s : KEYWORD\n", yytext);}

"TRACE"  {printf("%s : KEYWORD\n", yytext);}

"TRAILING"  {printf("%s : KEYWORD\n", yytext);}

"TRUE"  {printf("%s : KEYWORD\n", yytext);}

"TYPE"  {printf("%s : KEYWORD\n", yytext);}

"UNIT"  {printf("%s : KEYWORD\n", yytext);}

"UNSTRING"  {printf("%s : KEYWORD\n", yytext);}

"UNTIL"  {printf("%s : KEYWORD\n", yytext);}

"UP"  {printf("%s : KEYWORD\n", yytext);}

"UPON"  {printf("%s : KEYWORD\n", yytext);}

"USAGE"  {printf("%s : KEYWORD\n", yytext);}

"USE"  {printf("%s : KEYWORD\n", yytext);}

"USIING"  {printf("%s : KEYWORD\n", yytext);}

"UTF-8"  {printf("%s : KEYWORD\n", yytext);}

"VALUE"  {printf("%s : KEYWORD\n", yytext);}

"VALUES"  {printf("%s : KEYWORD\n", yytext);}

"VARYING"  {printf("%s : KEYWORD\n", yytext);}

"VOLATILE"  {printf("%s : KEYWORD\n", yytext);}

"WHEN"  {printf("%s : KEYWORD\n", yytext);}

"WHEN-COMPILED"  {printf("%s : KEYWORD\n", yytext);}

"WITH"  {printf("%s : KEYWORD\n", yytext);}

"WORDS"  {printf("%s : KEYWORD\n", yytext);}

"WORKING-STORAGE"  {printf("%s : KEYWORD\n", yytext);}

"WRITE"  {printf("%s : KEYWORD\n", yytext);}

"WRITE-ONLY"  {printf("%s : KEYWORD\n", yytext);}

"XML"  {printf("%s : KEYWORD\n", yytext);}

"XML-CODE"  {printf("%s : KEYWORD\n", yytext);}

"XML-EVENT"  {printf("%s : KEYWORD\n", yytext);}

"XML-INFORMATION"  {printf("%s : KEYWORD\n", yytext);}

"XML-NAMESPACE"  {printf("%s : KEYWORD\n", yytext);}

"XML-NAMEPSPACE-PREFIX"  {printf("%s : KEYWORD\n", yytext);}

"XML-NNAMESPACE"  {printf("%s : KEYWORD\n", yytext);}

"XML-NNAMESPACE-PREFIX"  {printf("%s : KEYWORD\n", yytext);}

"XML-INTEXT"  {printf("%s : KEYWORD\n", yytext);}

"XML-SCHEMA"  {printf("%s : KEYWORD\n", yytext);}

"XML-TEXT"  {printf("%s : KEYWORD\n", yytext);}

"ZERO"  {printf("%s : KEYWORD\n", yytext);}

"ZEROES"  {printf("%s : KEYWORD\n", yytext);}

"ZEROS"  {printf("%s : KEYWORD\n", yytext);}

"."  {printf("%s : SEPARATOR\n", yytext);}

","  {printf("%s : SEPARATOR\n", yytext);}

" " ;

[ \t\n]+ 

.   {printf("%s : Unrecognized symbol.\n", yytext);}

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