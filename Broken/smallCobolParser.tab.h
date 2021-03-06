/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_SMALLCOBOLPARSER_TAB_H_INCLUDED
# define YY_YY_SMALLCOBOLPARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
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
    DOUBLE_EQ_OP = 288,
    GT_EQ_OP = 289,
    LT_EQ_OP = 290,
    PERIOD = 291,
    COMMA = 292,
    GT_OP = 293,
    LT_OP = 294,
    EQ_OP = 295,
    OPEN_PARENTHESES = 296,
    CLOSE_PARENTHESES = 297,
    ADD = 298,
    NINE = 299,
    LETTERV = 300,
    LETTERS = 301,
    LETTERX = 302
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 21 "smallCobolParser.y"

	int number;
	char character;
	char* string;
	struct AST* ast;

#line 112 "smallCobolParser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SMALLCOBOLPARSER_TAB_H_INCLUDED  */
