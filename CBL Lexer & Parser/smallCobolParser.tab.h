/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     NUMBER = 258,
     DIGIT = 259,
     ID = 260,
     STRING = 261,
     IDENTIFICATION = 262,
     ENVIRIONMENT = 263,
     PROCEDURE = 264,
     DIVISION = 265,
     PROGRAMID = 266,
     DISPLAY = 267,
     ACCEPT = 268,
     STOP = 269,
     RUN = 270,
     IF = 271,
     THEN = 272,
     ENDIF = 273,
     PERFORM = 274,
     UNTIL = 275,
     COUNT = 276,
     TIMES = 277,
     PICTURE = 278,
     PIC = 279,
     IS = 280,
     TO = 281,
     PERIOD = 282,
     COMMA = 283,
     GT_OP = 284,
     LT_OP = 285,
     EQ_OP = 286,
     DOUBLE_EQ_OP = 287,
     GT_EQ_OP = 288,
     LT_EQ_OP = 289,
     OPEN_PARENTHESES = 290,
     CLOSE_PARENTHESES = 291,
     ADD = 292,
     NINE = 293,
     LETTERV = 294,
     LETTERS = 295,
     LETTERX = 296
   };
#endif
/* Tokens.  */
#define NUMBER 258
#define DIGIT 259
#define ID 260
#define STRING 261
#define IDENTIFICATION 262
#define ENVIRIONMENT 263
#define PROCEDURE 264
#define DIVISION 265
#define PROGRAMID 266
#define DISPLAY 267
#define ACCEPT 268
#define STOP 269
#define RUN 270
#define IF 271
#define THEN 272
#define ENDIF 273
#define PERFORM 274
#define UNTIL 275
#define COUNT 276
#define TIMES 277
#define PICTURE 278
#define PIC 279
#define IS 280
#define TO 281
#define PERIOD 282
#define COMMA 283
#define GT_OP 284
#define LT_OP 285
#define EQ_OP 286
#define DOUBLE_EQ_OP 287
#define GT_EQ_OP 288
#define LT_EQ_OP 289
#define OPEN_PARENTHESES 290
#define CLOSE_PARENTHESES 291
#define ADD 292
#define NINE 293
#define LETTERV 294
#define LETTERS 295
#define LETTERX 296




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 21 "smallCobolParser.y"
{
	int number;
	char character;
	char* string;
	struct AST* ast;
}
/* Line 1529 of yacc.c.  */
#line 138 "smallCobolParser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

