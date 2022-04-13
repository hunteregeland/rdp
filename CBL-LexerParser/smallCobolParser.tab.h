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
     FILE = 265,
     WORKINGSTORAGE = 266,
     LINKAGE = 267,
     SCREEN = 268,
     SECTION = 269,
     PROCEDURE = 270,
     DIVISION = 271,
     PROGRAMID = 272,
     DISPLAY = 273,
     ACCEPT = 274,
     STOP = 275,
     RUN = 276,
     IF = 277,
     THEN = 278,
     ENDIF = 279,
     PERFORM = 280,
     UNTIL = 281,
     COUNT = 282,
     TIMES = 283,
     PICTURE = 284,
     PIC = 285,
     IS = 286,
     TO = 287,
     PERIOD = 288,
     COMMA = 289,
     GT_OP = 290,
     LT_OP = 291,
     EQ_OP = 292,
     DOUBLE_EQ_OP = 293,
     GT_EQ_OP = 294,
     LT_EQ_OP = 295,
     OPEN_PARENTHESES = 296,
     CLOSE_PARENTHESES = 297,
     ADD = 298,
     NINE = 299,
     LETTERV = 300,
     LETTERS = 301,
     LETTERX = 302
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
#define FILE 265
#define WORKINGSTORAGE 266
#define LINKAGE 267
#define SCREEN 268
#define SECTION 269
#define PROCEDURE 270
#define DIVISION 271
#define PROGRAMID 272
#define DISPLAY 273
#define ACCEPT 274
#define STOP 275
#define RUN 276
#define IF 277
#define THEN 278
#define ENDIF 279
#define PERFORM 280
#define UNTIL 281
#define COUNT 282
#define TIMES 283
#define PICTURE 284
#define PIC 285
#define IS 286
#define TO 287
#define PERIOD 288
#define COMMA 289
#define GT_OP 290
#define LT_OP 291
#define EQ_OP 292
#define DOUBLE_EQ_OP 293
#define GT_EQ_OP 294
#define LT_EQ_OP 295
#define OPEN_PARENTHESES 296
#define CLOSE_PARENTHESES 297
#define ADD 298
#define NINE 299
#define LETTERV 300
#define LETTERS 301
#define LETTERX 302




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
#line 150 "smallCobolParser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

