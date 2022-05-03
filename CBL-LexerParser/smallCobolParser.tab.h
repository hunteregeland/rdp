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
     DATA = 264,
     PROCEDURE = 265,
     DIVISION = 266,
     FILEE = 267,
     WORKINGSTORAGE = 268,
     SECTION = 269,
     PROGRAMID = 270,
     DISPLAY = 271,
     ACCEPT = 272,
     STOP = 273,
     RUN = 274,
     IF = 275,
     THEN = 276,
     ENDIF = 277,
     PERFORM = 278,
     UNTIL = 279,
     COUNT = 280,
     TIMES = 281,
     PICTURE = 282,
     PIC = 283,
     IS = 284,
     TO = 285,
     PERIOD = 286,
     COMMA = 287,
     GT_OP = 288,
     LT_OP = 289,
     EQ_OP = 290,
     DOUBLE_EQ_OP = 291,
     GT_EQ_OP = 292,
     LT_EQ_OP = 293,
     OPEN_PARENTHESES = 294,
     CLOSE_PARENTHESES = 295,
     ADD = 296,
     NINE = 297,
     LETTERV = 298,
     LETTERS = 299,
     LETTERX = 300
   };
#endif
/* Tokens.  */
#define NUMBER 258
#define DIGIT 259
#define ID 260
#define STRING 261
#define IDENTIFICATION 262
#define ENVIRIONMENT 263
#define DATA 264
#define PROCEDURE 265
#define DIVISION 266
#define FILEE 267
#define WORKINGSTORAGE 268
#define SECTION 269
#define PROGRAMID 270
#define DISPLAY 271
#define ACCEPT 272
#define STOP 273
#define RUN 274
#define IF 275
#define THEN 276
#define ENDIF 277
#define PERFORM 278
#define UNTIL 279
#define COUNT 280
#define TIMES 281
#define PICTURE 282
#define PIC 283
#define IS 284
#define TO 285
#define PERIOD 286
#define COMMA 287
#define GT_OP 288
#define LT_OP 289
#define EQ_OP 290
#define DOUBLE_EQ_OP 291
#define GT_EQ_OP 292
#define LT_EQ_OP 293
#define OPEN_PARENTHESES 294
#define CLOSE_PARENTHESES 295
#define ADD 296
#define NINE 297
#define LETTERV 298
#define LETTERS 299
#define LETTERX 300




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
#line 146 "smallCobolParser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

