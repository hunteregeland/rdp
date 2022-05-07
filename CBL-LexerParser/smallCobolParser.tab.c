/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.3"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Using locations.  */
#define YYLSP_NEEDED 0



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




/* Copy the first part of user declarations.  */
#line 1 "smallCobolParser.y"


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* #include "symbolTable.h" */
#include "AST.h"


extern int yylex();
extern int yyparse();
extern FILE* yyin;

void yyerror(const char* s);
char currentScope[50]; /* global or the name of the function */



/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif

#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 21 "smallCobolParser.y"
{
	int number;
	char character;
	char* string;
	struct AST* ast;
}
/* Line 193 of yacc.c.  */
#line 212 "smallCobolParser.tab.c"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif



/* Copy the second part of user declarations.  */


/* Line 216 of yacc.c.  */
#line 225 "smallCobolParser.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int i)
#else
static int
YYID (i)
    int i;
#endif
{
  return i;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss;
  YYSTYPE yyvs;
  };

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack)					\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack, Stack, yysize);				\
	Stack = &yyptr->Stack;						\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  6
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   146

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  46
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  28
/* YYNRULES -- Number of rules.  */
#define YYNRULES  66
/* YYNRULES -- Number of states.  */
#define YYNSTATES  134

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   300

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint8 yyprhs[] =
{
       0,     0,     3,     7,    10,    13,    15,    20,    24,    29,
      32,    34,    37,    40,    43,    48,    51,    57,    64,    69,
      75,    80,    85,    91,    96,   102,   107,   113,   118,   123,
     128,   133,   138,   143,   148,   153,   158,   163,   167,   171,
     173,   175,   177,   179,   181,   183,   184,   187,   188,   191,
     192,   195,   200,   204,   207,   212,   213,   217,   219,   223,
     225,   229,   233,   239,   243,   247,   251
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      47,     0,    -1,    48,    49,    50,    -1,    67,    51,    -1,
      68,    69,    -1,    69,    -1,    72,    52,    53,    73,    -1,
      72,    52,    73,    -1,    15,    31,     5,    31,    -1,     5,
      31,    -1,    54,    -1,    54,    53,    -1,    55,    31,    -1,
      16,     6,    -1,    16,     6,    32,     5,    -1,    17,     5,
      -1,    20,    56,    21,    54,    22,    -1,    23,    54,    24,
      25,    57,     3,    -1,    23,    54,     3,    26,    -1,    58,
       5,    27,    29,    59,    -1,    58,     5,    28,    59,    -1,
      58,     5,    28,    61,    -1,    58,     5,    27,    29,    62,
      -1,    58,     5,    28,    62,    -1,    58,     5,    27,    29,
      63,    -1,    58,     5,    28,    63,    -1,    58,     5,    27,
      29,    60,    -1,    58,     5,    28,    60,    -1,    58,     5,
      28,    64,    -1,    41,     3,    30,     5,    -1,    41,     5,
      30,     5,    -1,    41,    65,    30,     5,    -1,    41,    66,
      30,     5,    -1,    41,     3,    30,    66,    -1,    41,    65,
      30,    66,    -1,    41,     5,    30,    66,    -1,    41,    66,
      30,    66,    -1,     5,    57,     5,    -1,     5,    57,     3,
      -1,    33,    -1,    34,    -1,    35,    -1,    36,    -1,    37,
      -1,    38,    -1,    -1,     4,     4,    -1,    -1,    42,    59,
      -1,    -1,    45,    60,    -1,    42,    39,     3,    40,    -1,
      59,    43,    59,    -1,    44,    59,    -1,    45,    39,     3,
      40,    -1,    -1,     3,    32,    65,    -1,     3,    -1,     5,
      32,    66,    -1,     5,    -1,     7,    11,    31,    -1,     8,
      11,    31,    -1,     9,    11,    31,    70,    71,    -1,    12,
      14,    31,    -1,    13,    14,    31,    -1,    10,    11,    31,
      -1,    18,    19,    31,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,    94,    94,   101,   108,   108,   115,   116,   124,   127,
     133,   134,   145,   153,   157,   164,   168,   173,   177,   185,
     188,   191,   198,   201,   207,   210,   216,   219,   222,   229,
     233,   237,   241,   245,   249,   253,   257,   265,   268,   274,
     274,   274,   274,   274,   274,   277,   278,   281,   281,   284,
     284,   287,   290,   293,   296,   299,   299,   299,   302,   302,
     310,   318,   325,   333,   336,   343,   351
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUMBER", "DIGIT", "ID", "STRING",
  "IDENTIFICATION", "ENVIRIONMENT", "DATA", "PROCEDURE", "DIVISION",
  "FILEE", "WORKINGSTORAGE", "SECTION", "PROGRAMID", "DISPLAY", "ACCEPT",
  "STOP", "RUN", "IF", "THEN", "ENDIF", "PERFORM", "UNTIL", "COUNT",
  "TIMES", "PICTURE", "PIC", "IS", "TO", "PERIOD", "COMMA", "GT_OP",
  "LT_OP", "EQ_OP", "DOUBLE_EQ_OP", "GT_EQ_OP", "LT_EQ_OP",
  "OPEN_PARENTHESES", "CLOSE_PARENTHESES", "ADD", "NINE", "LETTERV",
  "LETTERS", "LETTERX", "$accept", "Program", "Module1", "Module2",
  "Module3", "ProgID", "ProcID", "Statements", "Statement", "Expr",
  "Condition", "Operator", "DoubleDigit", "Nines", "Xs", "IntPicClause",
  "FloatClause", "UnsignedClause", "StringPicClause", "NumberClause",
  "IDClause", "IDDiv", "EnvDiv", "DataDiv", "FileSec", "WSSec", "ProcDiv",
  "StopRun", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    46,    47,    48,    49,    49,    50,    50,    51,    52,
      53,    53,    54,    55,    55,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    55,    55,    55,
      55,    55,    55,    55,    55,    55,    55,    56,    56,    57,
      57,    57,    57,    57,    57,    58,    58,    59,    59,    60,
      60,    61,    62,    63,    64,    65,    65,    65,    66,    66,
      67,    68,    69,    70,    71,    72,    73
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     3,     2,     2,     1,     4,     3,     4,     2,
       1,     2,     2,     2,     4,     2,     5,     6,     4,     5,
       4,     4,     5,     4,     5,     4,     5,     4,     4,     4,
       4,     4,     4,     4,     4,     4,     4,     3,     3,     1,
       1,     1,     1,     1,     1,     0,     2,     0,     2,     0,
       2,     4,     3,     2,     4,     0,     3,     1,     3,     1,
       3,     3,     5,     3,     3,     3,     3
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
       0,     0,     0,     0,     0,     0,     1,     0,     0,     0,
       0,     5,     0,     3,    60,     0,     0,     0,     2,     0,
       4,     0,    61,     0,     0,     0,    45,     0,     0,     0,
      65,     9,     0,     0,     0,     0,     0,    45,    55,     0,
      10,     0,     0,     7,     8,     0,     0,    62,    46,    13,
      15,     0,     0,     0,     0,     0,     0,     0,     0,     6,
      11,    12,     0,    63,     0,     0,    66,    39,    40,    41,
      42,    43,    44,     0,    45,     0,     0,     0,    55,     0,
       0,     0,     0,     0,    47,    64,    14,    38,    37,     0,
      18,     0,    29,    33,    57,    56,    30,    35,    59,    58,
      31,    34,    32,    36,    47,    47,    47,    49,    20,    27,
      21,    23,    25,    28,    16,     0,    47,    49,    19,    26,
      22,    24,     0,    48,    53,     0,    50,    47,    17,     0,
       0,    52,    51,    54
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
      -1,     2,     3,     9,    18,    13,    26,    39,    40,    41,
      53,    73,    42,   123,   126,   110,   111,   112,   113,    57,
      58,     4,    10,    11,    29,    47,    19,    43
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -85
static const yytype_int8 yypact[] =
{
      12,    35,    64,    32,    51,    36,   -85,    57,    58,    61,
      63,   -85,    39,   -85,   -85,    42,    43,    65,   -85,    70,
     -85,    72,   -85,    66,    48,    49,    -2,    50,    68,    71,
     -85,   -85,    79,    80,    82,    69,    84,     9,    44,    67,
       7,    59,    86,   -85,   -85,    62,    78,   -85,   -85,    73,
     -85,    75,    18,    74,     4,    27,    30,    77,    81,   -85,
     -85,   -85,   -19,   -85,    83,    89,   -85,   -85,   -85,   -85,
     -85,   -85,   -85,    60,     9,    76,    85,    91,    94,    93,
      95,    96,    98,    87,   -39,   -85,   -85,   -85,   -85,    90,
     -85,    18,    88,   -85,    92,   -85,    88,   -85,    88,   -85,
      88,   -85,    88,   -85,     0,    19,    97,   -35,    56,   -85,
     -85,   -85,   -85,   -85,   -85,   101,    97,    99,    56,   -85,
     -85,   -85,   105,   -85,   -85,   106,   -85,    97,   -85,   100,
     102,   -85,   -85,   -85
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -85,   -85,   -85,   -85,   -85,   -85,   -85,   103,   -36,   -85,
     -85,    22,   -85,   -84,   -67,   -85,    11,    13,   -85,    40,
     -46,   -85,   -85,   109,   -85,   -85,   -85,   107
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -46
static const yytype_int16 yytable[] =
{
     108,    54,    32,   105,   125,   106,   107,    75,    83,    84,
     117,    32,   -45,    32,    33,    34,    35,   109,    36,     1,
     118,    37,   124,    33,    34,    33,    34,    36,    76,    36,
      37,    93,    37,    97,    99,   101,   103,   119,    89,    38,
       7,     8,   116,   131,   106,   117,     5,    55,    38,    56,
      38,    67,    68,    69,    70,    71,    72,    77,   122,    78,
      79,   116,    80,    87,     6,    88,    12,    14,    15,    16,
      21,    17,     8,    22,    23,    25,    24,    27,    28,    30,
      31,    44,    45,    48,    46,    35,    49,    50,    51,    52,
      61,    62,    64,    63,    86,    74,    92,    94,    96,   127,
      98,   100,    90,   102,   128,    65,    66,    81,   129,   130,
      91,    82,   114,   115,    85,   120,   104,   121,    95,    20,
      80,     0,     0,     0,    78,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,   116,
     132,     0,   133,    60,   117,     0,    59
};

static const yytype_int8 yycheck[] =
{
      84,    37,     4,    42,    39,    44,    45,     3,    27,    28,
      45,     4,     5,     4,    16,    17,    18,    84,    20,     7,
     104,    23,   106,    16,    17,    16,    17,    20,    24,    20,
      23,    77,    23,    79,    80,    81,    82,   104,    74,    41,
       8,     9,    42,   127,    44,    45,    11,     3,    41,     5,
      41,    33,    34,    35,    36,    37,    38,    30,    39,    32,
      30,    42,    32,     3,     0,     5,    15,    31,    11,    11,
      31,    10,     9,    31,    31,     5,    11,     5,    12,    31,
      31,    31,    14,     4,    13,    18,     6,     5,    19,     5,
      31,     5,    14,    31,     5,    21,     5,     3,     5,    43,
       5,     5,    26,     5,     3,    32,    31,    30,     3,     3,
      25,    30,    22,    91,    31,   104,    29,   104,    78,    10,
      32,    -1,    -1,    -1,    32,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    42,
      40,    -1,    40,    40,    45,    -1,    39
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     7,    47,    48,    67,    11,     0,     8,     9,    49,
      68,    69,    15,    51,    31,    11,    11,    10,    50,    72,
      69,    31,    31,    31,    11,     5,    52,     5,    12,    70,
      31,    31,     4,    16,    17,    18,    20,    23,    41,    53,
      54,    55,    58,    73,    31,    14,    13,    71,     4,     6,
       5,    19,     5,    56,    54,     3,     5,    65,    66,    73,
      53,    31,     5,    31,    14,    32,    31,    33,    34,    35,
      36,    37,    38,    57,    21,     3,    24,    30,    32,    30,
      32,    30,    30,    27,    28,    31,     5,     3,     5,    54,
      26,    25,     5,    66,     3,    65,     5,    66,     5,    66,
       5,    66,     5,    66,    29,    42,    44,    45,    59,    60,
      61,    62,    63,    64,    22,    57,    42,    45,    59,    60,
      62,    63,    39,    59,    59,    39,    60,    43,     3,     3,
       3,    59,    40,    40
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if defined YYLTYPE_IS_TRIVIAL && YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      case 3: /* "NUMBER" */
#line 79 "smallCobolParser.y"
	{ fprintf(yyoutput, "%d", (yyvaluep->number)); };
#line 877 "smallCobolParser.tab.c"
	break;
      case 4: /* "DIGIT" */
#line 80 "smallCobolParser.y"
	{ fprintf(yyoutput, "%d", (yyvaluep->number)); };
#line 882 "smallCobolParser.tab.c"
	break;
      case 5: /* "ID" */
#line 78 "smallCobolParser.y"
	{ fprintf(yyoutput, "%s", (yyvaluep->string)); };
#line 887 "smallCobolParser.tab.c"
	break;
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *bottom, yytype_int16 *top)
#else
static void
yy_stack_print (bottom, top)
    yytype_int16 *bottom;
    yytype_int16 *top;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; bottom <= top; ++bottom)
    YYFPRINTF (stderr, " %d", *bottom);
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      fprintf (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      fprintf (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */



/* The look-ahead symbol.  */
int yychar;

/* The semantic value of the look-ahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
  
  int yystate;
  int yyn;
  int yyresult;
  /* Number of tokens to shift before error messages enabled.  */
  int yyerrstatus;
  /* Look-ahead token as an internal (translated) token number.  */
  int yytoken = 0;
#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

  /* Three stacks and their tools:
     `yyss': related to states,
     `yyvs': related to semantic values,
     `yyls': related to locations.

     Refer to the stacks thru separate pointers, to allow yyoverflow
     to reallocate them elsewhere.  */

  /* The state stack.  */
  yytype_int16 yyssa[YYINITDEPTH];
  yytype_int16 *yyss = yyssa;
  yytype_int16 *yyssp;

  /* The semantic value stack.  */
  YYSTYPE yyvsa[YYINITDEPTH];
  YYSTYPE *yyvs = yyvsa;
  YYSTYPE *yyvsp;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  YYSIZE_T yystacksize = YYINITDEPTH;

  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;


  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY;		/* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */

  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;


	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),

		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss);
	YYSTACK_RELOCATE (yyvs);

#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;


      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     look-ahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to look-ahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a look-ahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid look-ahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the look-ahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token unless it is eof.  */
  if (yychar != YYEOF)
    yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:
#line 94 "smallCobolParser.y"
    { printf("\n RECOGNIZED PROGRAM: COBOL Program End\n\n");
;}
    break;

  case 3:
#line 101 "smallCobolParser.y"
    { printf("\n RECOGNIZED MODULE: End Module 1: Identification Division\n\n"); 
;}
    break;

  case 4:
#line 108 "smallCobolParser.y"
    { printf("\n RECOGNIZED MODULE: End Module 2: Environment & Data Division\n\n"); ;}
    break;

  case 5:
#line 108 "smallCobolParser.y"
    { printf("\n RECOGNIZED MODULE: End Module 2: Data Division (No Env Division)\n\n");
;}
    break;

  case 6:
#line 115 "smallCobolParser.y"
    { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division\n\n"); ;}
    break;

  case 7:
#line 116 "smallCobolParser.y"
    { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division (no statements)\n\n");
;}
    break;

  case 8:
#line 124 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Program ID Declaration\n\n");
;}
    break;

  case 9:
#line 127 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Procedure ID Declaration\n\n");
;}
    break;

  case 10:
#line 133 "smallCobolParser.y"
    {(yyval.ast) = (yyvsp[(1) - (1)].ast);;}
    break;

  case 11:
#line 134 "smallCobolParser.y"
    {(yyval.ast) = (yyvsp[(2) - (2)].ast);;}
    break;

  case 12:
#line 145 "smallCobolParser.y"
    {(yyval.ast) = (yyvsp[(1) - (2)].ast); ;}
    break;

  case 13:
#line 153 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Display Call\n");
            printf(" JAVA: system.out.println('%s');\n\n",(yyvsp[(2) - (2)].string));
			/* this doesn't put the string in the java 'code' currently */
		;}
    break;

  case 14:
#line 157 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Display Call With Concatenation\n");
            printf(" JAVA: system.out.println('%s' + ID);\n\n",(yyvsp[(2) - (4)].string));
			/* for some reason only the DISPLAY STRING worked without including PERIOD */
			/* this and all below require it for period to be parsed inside the function call */
			/* this means that all function calls only work with periods. */
		;}
    break;

  case 15:
#line 164 "smallCobolParser.y"
    {printf("\n RECOGNIZED RULE: Accept ID\n");
			printf(" JAVA: %s = input.nextLine();\n\n", (yyvsp[(2) - (2)].string));
		;}
    break;

  case 16:
#line 168 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: If Statement");
			printf("JAVA: if($2) {$4}");
			/* makeTree(,,) */
		;}
    break;

  case 17:
#line 173 "smallCobolParser.y"
    {printf("\n RECOGNIZED RULE: While loop");
			printf("JAVA: while($4 $5 %i) $2}",(yyvsp[(6) - (6)].number));
		;}
    break;

  case 18:
#line 177 "smallCobolParser.y"
    {printf("\n RECOGNIZED RULE: For loop");
			printf("JAVA: for(int i=0; i<%i;i++) {$2}",(yyvsp[(3) - (4)].number));
		;}
    break;

  case 19:
#line 185 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");
			printf("JAVA: int $2 = $5");
		;}
    break;

  case 20:
#line 188 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: int $2 = $4");
		;}
    break;

  case 21:
#line 191 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: int $2 = $4");
		;}
    break;

  case 22:
#line 198 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 1");
			printf("JAVA: float %s = $5", (yyvsp[(2) - (5)].string));
		;}
    break;

  case 23:
#line 201 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 2");
			printf("JAVA: float %s = $4", (yyvsp[(2) - (4)].string));
		;}
    break;

  case 24:
#line 207 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Un-Signed Variable Declaration: Type 1");
			printf("JAVA: needs extra package");
		;}
    break;

  case 25:
#line 210 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Un-Signed Variable Declaration: Type 2");
			printf("JAVA: needs extra package");
		;}
    break;

  case 26:
#line 216 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");
			printf("JAVA: String %s = $5", (yyvsp[(2) - (5)].string));
		;}
    break;

  case 27:
#line 219 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: String %s = $4", (yyvsp[(2) - (4)].string));
		;}
    break;

  case 28:
#line 222 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: String %s = $4", (yyvsp[(2) - (4)].string));
		;}
    break;

  case 29:
#line 229 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input");
			printf("JAVA: %s = %s + %i", (yyvsp[(4) - (4)].string), (yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].number));
		;}
    break;

  case 30:
#line 233 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Single ID Input");
			printf("JAVA: %s = %s + %s", (yyvsp[(4) - (4)].string), (yyvsp[(4) - (4)].string), (yyvsp[(2) - (4)].string)); 
		;}
    break;

  case 31:
#line 237 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs");
			printf("JAVA: %s = %s + $2", (yyvsp[(4) - (4)].string), (yyvsp[(4) - (4)].string)); 
		;}
    break;

  case 32:
#line 241 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Multiple ID Inputs");
			printf("JAVA: %s = %s + $2", (yyvsp[(4) - (4)].string), (yyvsp[(4) - (4)].string)); 
		;}
    break;

  case 33:
#line 245 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %i", (yyvsp[(2) - (4)].number)); 
		;}
    break;

  case 34:
#line 249 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
		;}
    break;

  case 35:
#line 253 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %s", (yyvsp[(2) - (4)].string)); 
		;}
    break;

  case 36:
#line 257 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
		;}
    break;

  case 37:
#line 265 "smallCobolParser.y"
    {
			//makeTree(,,)
		;}
    break;

  case 38:
#line 268 "smallCobolParser.y"
    {

		;}
    break;

  case 39:
#line 274 "smallCobolParser.y"
    {;}
    break;

  case 40:
#line 274 "smallCobolParser.y"
    {;}
    break;

  case 41:
#line 274 "smallCobolParser.y"
    {;}
    break;

  case 42:
#line 274 "smallCobolParser.y"
    {;}
    break;

  case 43:
#line 274 "smallCobolParser.y"
    {;}
    break;

  case 44:
#line 274 "smallCobolParser.y"
    {
;}
    break;

  case 45:
#line 277 "smallCobolParser.y"
    {printf("DOUBLEDIGIT EMPTY RULE");;}
    break;

  case 46:
#line 278 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Double Digit\n");
;}
    break;

  case 48:
#line 281 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Nines\n");
;}
    break;

  case 50:
#line 284 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: X's\n");
;}
    break;

  case 51:
#line 287 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Integer Pic Clause\n");
;}
    break;

  case 52:
#line 290 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Float Clause\n");
;}
    break;

  case 53:
#line 293 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Un-signed Clause\n");
;}
    break;

  case 54:
#line 296 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: String Pic Clause\n");
;}
    break;

  case 56:
#line 299 "smallCobolParser.y"
    {;}
    break;

  case 57:
#line 299 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Number Clause\n");
;}
    break;

  case 58:
#line 302 "smallCobolParser.y"
    {;}
    break;

  case 59:
#line 302 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: ID Clause\n");
;}
    break;

  case 60:
#line 310 "smallCobolParser.y"
    { printf("\n RECOGNIZED DIVISION: Identification Division Declaration\n\n");
;}
    break;

  case 61:
#line 318 "smallCobolParser.y"
    { printf("\n RECOGNIZED DIVISION: Environment Division Declaration\n\n");
;}
    break;

  case 62:
#line 325 "smallCobolParser.y"
    { printf("\n RECOGNIZED DIVISION: Data Division Declaration\n\n");
;}
    break;

  case 63:
#line 333 "smallCobolParser.y"
    { printf("\n RECOGNIZED SECTION: File Section Declaration\n\n");
;}
    break;

  case 64:
#line 336 "smallCobolParser.y"
    { printf("\n RECOGNIZED SECTION: Working-Storage Section Declaration\n\n");
;}
    break;

  case 65:
#line 343 "smallCobolParser.y"
    { printf("\n RECOGNIZED DIVISION: Procedure Division Declaration\n\n");
;}
    break;

  case 66:
#line 351 "smallCobolParser.y"
    { printf("\n RECOGNIZED RULE: Stop Run\n\n");
;}
    break;


/* Line 1267 of yacc.c.  */
#line 1949 "smallCobolParser.tab.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;


  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse look-ahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse look-ahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  if (yyn == YYFINAL)
    YYACCEPT;

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#ifndef yyoverflow
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEOF && yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}


#line 356 "smallCobolParser.y"


int main(int argc, char**argv)	
{
/*
	#ifdef YYDEBUG
		yydebug = 1;
	#endif
*/
	printf("\n\n##### COMPILER STARTED #####\n\n");
	
	if (argc > 1){
	  if(!(yyin = fopen(argv[1], "r")))
          {
		perror(argv[1]);
		return(1);
	  }
	}
	yyparse();
}

void yyerror(const char* s) {
	fprintf(stderr, "Parse error: %s\n", s);
	exit(1);
}

