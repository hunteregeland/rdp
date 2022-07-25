/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "3.5.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
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


#line 89 "smallCobolParser.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Use api.header.include to #include this header
   instead of duplicating it here.  */
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
    PROCEDURE = 265,
    DIVISION = 266,
    FILEE = 267,
    WORKINGSTORAGE = 268,
    LOCALSTORAGE = 269,
    LINKAGE = 270,
    SECTION = 271,
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

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 21 "smallCobolParser.y"

	int number;
	char character;
	char* string;
	struct AST* ast;

#line 196 "smallCobolParser.tab.c"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_SMALLCOBOLPARSER_TAB_H_INCLUDED  */



#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))

/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif

#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(E) ((void) (E))
#else
# define YYUSE(E) /* empty */
#endif

#if defined __GNUC__ && ! defined __ICC && 407 <= __GNUC__ * 100 + __GNUC_MINOR__
/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                            \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

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
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
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
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
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
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  22
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   152

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  48
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  36
/* YYNRULES -- Number of rules.  */
#define YYNRULES  82
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  150

#define YYUNDEFTOK  2
#define YYMAXUTOK   302


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
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
      45,    46,    47
};

#if YYDEBUG
  /* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    96,    96,   110,   119,   128,   140,   146,   152,   158,
     169,   185,   194,   208,   216,   230,   239,   251,   260,   275,
     287,   295,   308,   316,   327,   338,   351,   358,   365,   376,
     383,   393,   396,   402,   409,   416,   427,   435,   443,   451,
     459,   467,   475,   483,   495,   498,   504,   504,   504,   504,
     504,   504,   507,   508,   511,   511,   514,   514,   517,   520,
     523,   526,   529,   529,   529,   532,   532,   540,   551,   563,
     570,   574,   578,   579,   580,   581,   583,   597,   602,   607,
     612,   621,   631
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || 0
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "NUMBER", "DIGIT", "ID", "STRING",
  "IDENTIFICATION", "ENVIRIONMENT", "DATA", "PROCEDURE", "DIVISION",
  "FILEE", "WORKINGSTORAGE", "LOCALSTORAGE", "LINKAGE", "SECTION",
  "PROGRAMID", "DISPLAY", "ACCEPT", "STOP", "RUN", "IF", "THEN", "ENDIF",
  "PERFORM", "UNTIL", "COUNT", "TIMES", "PICTURE", "PIC", "IS", "TO",
  "PERIOD", "COMMA", "GT_OP", "LT_OP", "EQ_OP", "DOUBLE_EQ_OP", "GT_EQ_OP",
  "LT_EQ_OP", "OPEN_PARENTHESES", "CLOSE_PARENTHESES", "ADD", "NINE",
  "LETTERV", "LETTERS", "LETTERX", "$accept", "CobolProgram", "Modules",
  "Module", "Module1", "Module2", "Module3", "Module4", "ProgID", "ProcID",
  "Statements", "Statement", "Expr", "Condition", "Operator",
  "DoubleDigit", "Nines", "Xs", "IntPicClause", "FloatClause",
  "UnsignedClause", "StringPicClause", "NumberClause", "IDClause", "IDDiv",
  "EnvDiv", "DataSection", "Sections", "Section", "DataDiv", "FileSec",
  "LinkageSec", "LocalStorageSec", "WSSec", "ProcDiv", "StopRun", YY_NULLPTR
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[NUM] -- (External) token number corresponding to the
   (internal) symbol number NUM (which must be that of a token).  */
static const yytype_int16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302
};
# endif

#define YYPACT_NINF (-102)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-53)

#define yytable_value_is_error(Yyn) \
  0

  /* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
     STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      27,    -3,     4,    21,    29,  -102,     9,  -102,    27,  -102,
    -102,  -102,  -102,    22,  -102,  -102,    31,    54,   -19,    32,
      47,    48,  -102,  -102,    49,  -102,    62,    67,    68,    69,
    -102,    31,  -102,  -102,  -102,  -102,    53,    -2,  -102,  -102,
    -102,  -102,    82,    55,    56,    57,    58,  -102,  -102,    88,
      87,    89,    75,    90,     8,    45,    77,     6,    65,    94,
    -102,    70,  -102,  -102,  -102,  -102,  -102,    66,  -102,    71,
      17,    78,     3,    41,    42,    73,    76,  -102,  -102,  -102,
     -25,  -102,    97,  -102,  -102,  -102,  -102,  -102,  -102,  -102,
      74,     8,    79,    83,   101,   106,   107,   108,   109,   110,
      80,    20,  -102,  -102,  -102,    92,  -102,    17,    84,  -102,
      85,  -102,    84,  -102,    84,  -102,    84,  -102,    84,  -102,
      24,    28,    81,   -34,    72,  -102,  -102,  -102,  -102,  -102,
    -102,   117,    81,    86,    72,  -102,  -102,  -102,   118,  -102,
    -102,   119,  -102,    81,  -102,    93,    95,  -102,  -102,  -102
};

  /* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
     Performed when YYTABLE does not specify something else to do.  Zero
     means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       0,     0,     0,     0,     0,     5,     0,     2,     4,     6,
       7,     8,     9,     0,    12,    11,     0,     0,     0,     0,
       0,     0,     1,     3,     0,    10,     0,     0,     0,     0,
      69,    71,    73,    74,    72,    75,     0,    52,    67,    68,
      76,    81,     0,     0,     0,     0,     0,    70,    16,     0,
       0,     0,     0,     0,    52,    62,     0,    18,     0,     0,
      14,     0,    77,    80,    79,    78,    53,    20,    22,     0,
       0,     0,     0,     0,     0,     0,     0,    13,    17,    19,
       0,    15,     0,    82,    46,    47,    48,    49,    50,    51,
       0,    52,     0,     0,     0,    62,     0,     0,     0,     0,
       0,    54,    21,    45,    44,     0,    25,     0,    36,    40,
      64,    63,    37,    42,    66,    65,    38,    41,    39,    43,
      54,    54,    54,    56,    27,    34,    28,    30,    32,    35,
      23,     0,    54,    56,    26,    33,    29,    31,     0,    55,
      60,     0,    57,    54,    24,     0,     0,    59,    58,    61
};

  /* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
    -102,  -102,   115,  -102,  -102,  -102,  -102,  -102,  -102,  -102,
      91,   -53,  -102,  -102,    19,  -102,  -101,   -98,  -102,     7,
      10,  -102,    33,   -36,  -102,  -102,  -102,    98,  -102,  -102,
    -102,  -102,  -102,  -102,  -102,    96
};

  /* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     6,     7,     8,     9,    10,    11,    12,    25,    37,
      56,    57,    58,    71,    90,    59,   139,   142,   126,   127,
     128,   129,    75,    76,    13,    14,    15,    30,    31,    16,
      32,    33,    34,    35,    17,    60
};

  /* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
     positive, shift that token.  If negative, reduce the rule whose
     number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int16 yytable[] =
{
     124,    72,    49,   125,   100,   101,    92,   141,    18,    22,
      49,   -52,    49,   133,    38,    19,    50,    51,    52,   134,
      53,   140,   135,    54,    50,    51,    50,    51,    53,    93,
      53,    54,    20,    54,     1,     2,     3,     4,   105,    24,
      21,    55,   147,    26,    27,    28,    29,     5,    73,    55,
      74,    55,    84,    85,    86,    87,    88,    89,   109,    36,
     113,   115,   117,   119,   121,    39,   122,   123,   132,   138,
     122,   133,   132,    94,    96,    95,    97,   103,    43,   104,
      40,    41,    42,    44,    45,    46,    48,    61,    62,    63,
      64,    65,    66,    67,    68,    70,    69,    52,    79,    80,
      82,    91,   102,    81,    83,    98,   108,   106,    99,   110,
     107,   120,   112,   114,   116,   118,   130,   143,    97,    95,
     144,   145,   146,    23,     0,   132,   131,   136,   111,    47,
     137,     0,     0,   133,     0,   148,     0,   149,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    78,     0,
       0,     0,    77
};

static const yytype_int16 yycheck[] =
{
     101,    54,     4,   101,    29,    30,     3,    41,    11,     0,
       4,     5,     4,    47,    33,    11,    18,    19,    20,   120,
      22,   122,   120,    25,    18,    19,    18,    19,    22,    26,
      22,    25,    11,    25,     7,     8,     9,    10,    91,    17,
      11,    43,   143,    12,    13,    14,    15,    20,     3,    43,
       5,    43,    35,    36,    37,    38,    39,    40,    94,     5,
      96,    97,    98,    99,    44,    33,    46,    47,    44,    41,
      46,    47,    44,    32,    32,    34,    34,     3,    16,     5,
      33,    33,    33,    16,    16,    16,    33,     5,    33,    33,
      33,    33,     4,     6,     5,     5,    21,    20,    33,     5,
      34,    23,     5,    33,    33,    32,     5,    28,    32,     3,
      27,    31,     5,     5,     5,     5,    24,    45,    34,    34,
       3,     3,     3,     8,    -1,    44,   107,   120,    95,    31,
     120,    -1,    -1,    47,    -1,    42,    -1,    42,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    57,    -1,
      -1,    -1,    56
};

  /* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
     symbol of state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,     7,     8,     9,    10,    20,    49,    50,    51,    52,
      53,    54,    55,    72,    73,    74,    77,    82,    11,    11,
      11,    11,     0,    50,    17,    56,    12,    13,    14,    15,
      75,    76,    78,    79,    80,    81,     5,    57,    33,    33,
      33,    33,    33,    16,    16,    16,    16,    75,    33,     4,
      18,    19,    20,    22,    25,    43,    58,    59,    60,    63,
      83,     5,    33,    33,    33,    33,     4,     6,     5,    21,
       5,    61,    59,     3,     5,    70,    71,    83,    58,    33,
       5,    33,    34,    33,    35,    36,    37,    38,    39,    40,
      62,    23,     3,    26,    32,    34,    32,    34,    32,    32,
      29,    30,     5,     3,     5,    59,    28,    27,     5,    71,
       3,    70,     5,    71,     5,    71,     5,    71,     5,    71,
      31,    44,    46,    47,    64,    65,    66,    67,    68,    69,
      24,    62,    44,    47,    64,    65,    67,    68,    41,    64,
      64,    41,    65,    45,     3,     3,     3,    64,    42,    42
};

  /* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_int8 yyr1[] =
{
       0,    48,    49,    50,    50,    51,    51,    51,    51,    51,
      52,    53,    54,    55,    55,    56,    57,    58,    58,    59,
      60,    60,    60,    60,    60,    60,    60,    60,    60,    60,
      60,    60,    60,    60,    60,    60,    60,    60,    60,    60,
      60,    60,    60,    60,    61,    61,    62,    62,    62,    62,
      62,    62,    63,    63,    64,    64,    65,    65,    66,    67,
      68,    69,    70,    70,    70,    71,    71,    72,    73,    74,
      75,    75,    76,    76,    76,    76,    77,    78,    79,    80,
      81,    82,    83
};

  /* YYR2[YYN] -- Number of symbols on the right hand side of rule YYN.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     1,     2,     1,     1,     1,     1,     1,     1,
       2,     1,     1,     4,     3,     4,     2,     2,     1,     2,
       2,     4,     2,     5,     6,     4,     5,     4,     4,     5,
       4,     5,     4,     5,     4,     4,     4,     4,     4,     4,
       4,     4,     4,     4,     3,     3,     1,     1,     1,     1,
       1,     1,     0,     2,     0,     2,     0,     2,     4,     3,
       2,     4,     0,     3,     1,     3,     1,     3,     3,     2,
       2,     1,     1,     1,     1,     1,     3,     3,     3,     3,
       3,     3,     3
};


#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)
#define YYEMPTY         (-2)
#define YYEOF           0

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Error token number */
#define YYTERROR        1
#define YYERRCODE       256



/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)

/* This macro is provided for backward compatibility. */
#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


# define YY_SYMBOL_PRINT(Title, Type, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Type, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YYUSE (yyoutput);
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyo, yytoknum[yytype], *yyvaluep);
# endif
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  switch (yytype)
    {
    case 3: /* NUMBER  */
#line 81 "smallCobolParser.y"
         { fprintf(yyoutput, "%d", ((*yyvaluep).number)); }
#line 875 "smallCobolParser.tab.c"
        break;

    case 4: /* DIGIT  */
#line 82 "smallCobolParser.y"
         { fprintf(yyoutput, "%d", ((*yyvaluep).number)); }
#line 881 "smallCobolParser.tab.c"
        break;

    case 5: /* ID  */
#line 80 "smallCobolParser.y"
         { fprintf(yyoutput, "%s", ((*yyvaluep).string)); }
#line 887 "smallCobolParser.tab.c"
        break;

      default:
        break;
    }
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo, int yytype, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yytype < YYNTOKENS ? "token" : "nterm", yytname[yytype]);

  yy_symbol_value_print (yyo, yytype, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp, int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       yystos[+yyssp[yyi + 1 - yynrhs]],
                       &yyvsp[(yyi + 1) - (yynrhs)]
                                              );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

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
#ifndef YYINITDEPTH
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
#   define yystrlen(S) (YY_CAST (YYPTRDIFF_T, strlen (S)))
#  else
/* Return the length of YYSTR.  */
static YYPTRDIFF_T
yystrlen (const char *yystr)
{
  YYPTRDIFF_T yylen;
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
static char *
yystpcpy (char *yydest, const char *yysrc)
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
static YYPTRDIFF_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYPTRDIFF_T yyn = 0;
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
            else
              goto append;

          append:
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

  if (yyres)
    return yystpcpy (yyres, yystr) - yyres;
  else
    return yystrlen (yystr);
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYPTRDIFF_T *yymsg_alloc, char **yymsg,
                yy_state_t *yyssp, int yytoken)
{
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = YY_NULLPTR;
  /* Arguments of yyformat: reported tokens (one for the "unexpected",
     one per "expected"). */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Actual size of YYARG. */
  int yycount = 0;
  /* Cumulated lengths of YYARG.  */
  YYPTRDIFF_T yysize = 0;

  /* There are many possibilities here to consider:
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[+*yyssp];
      YYPTRDIFF_T yysize0 = yytnamerr (YY_NULLPTR, yytname[yytoken]);
      yysize = yysize0;
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                {
                  YYPTRDIFF_T yysize1
                    = yysize + yytnamerr (YY_NULLPTR, yytname[yyx]);
                  if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
                    yysize = yysize1;
                  else
                    return 2;
                }
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
    default: /* Avoid compiler warnings. */
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  {
    /* Don't count the "%s"s in the final size, but reserve room for
       the terminator.  */
    YYPTRDIFF_T yysize1 = yysize + (yystrlen (yyformat) - 2 * yycount) + 1;
    if (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM)
      yysize = yysize1;
    else
      return 2;
  }

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          ++yyp;
          ++yyformat;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
{
  YYUSE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YYUSE (yytype);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}




/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       'yyss': related to states.
       'yyvs': related to semantic values.

       Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss;
    yy_state_t *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYPTRDIFF_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken = 0;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYPTRDIFF_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yyssp = yyss = yyssa;
  yyvsp = yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */
  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    goto yyexhaustedlab;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          goto yyexhaustedlab;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
# undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = yylex ();
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
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
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
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

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
#line 96 "smallCobolParser.y"
                        { printf("\n RECOGNIZED PROGRAM: COBOL Program End\n\n");
					  printf("------------Start of AST------------\n");
					  (yyval.ast) = (yyvsp[0].ast);
					  //printAST($$,0);
					  
					  //manualAST($$);
					  
					  printf("\n------------End of AST------------\n");
									  
}
#line 1512 "smallCobolParser.tab.c"
    break;

  case 3:
#line 110 "smallCobolParser.y"
                               {
				printf("\n MODULE MODULES: Module End\n\n");
				printf("\nDollar 1 = ");
				printf((yyvsp[-1].ast));
				printf("\nDollar 2 = ");
				printf((yyvsp[0].ast));
				(yyvsp[-1].ast)->left = (yyvsp[0].ast);
				(yyval.ast) = (yyvsp[-1].ast);
			}
#line 1526 "smallCobolParser.tab.c"
    break;

  case 4:
#line 119 "smallCobolParser.y"
                         {  
				printf("\n MODULE: Module End\n\n");
				printf("\nDollar 1 = ");
				printf((yyvsp[0].ast));
				(yyval.ast) = (yyvsp[0].ast);
}
#line 1537 "smallCobolParser.tab.c"
    break;

  case 5:
#line 128 "smallCobolParser.y"
                    {
			(yyval.ast) = (yyvsp[0].string);
			printf("\nEOF\n");
		}
#line 1546 "smallCobolParser.tab.c"
    break;

  case 6:
#line 140 "smallCobolParser.y"
                       {printf("\n RECOGNIZED MODULE: Module1 End\n\n");
				printf("\nDollar 1 = ");
				printf((yyvsp[0].ast));
				(yyval.ast) = (yyvsp[0].ast);
				
				}
#line 1557 "smallCobolParser.tab.c"
    break;

  case 7:
#line 146 "smallCobolParser.y"
                         {printf("\n RECOGNIZED MODULE: Module2 End\n\n");
				printf("\nDollar 1 = ");
				printf((yyvsp[0].ast));		
				(yyval.ast) = (yyvsp[0].ast);
				
				}
#line 1568 "smallCobolParser.tab.c"
    break;

  case 8:
#line 152 "smallCobolParser.y"
                         {printf("\n RECOGNIZED MODULE: Module3 End\n\n");
				printf("\nDollar 1 = ");
				printf((yyvsp[0].ast));
				(yyval.ast) = (yyvsp[0].ast);
				
				}
#line 1579 "smallCobolParser.tab.c"
    break;

  case 9:
#line 158 "smallCobolParser.y"
                         {printf("\n RECOGNIZED MODULE: Module4 End\n\n");
				printf("\nDollar 1 = ");
				printf((yyvsp[0].ast));
				(yyval.ast) = (yyvsp[0].ast);
				
				}
#line 1590 "smallCobolParser.tab.c"
    break;

  case 10:
#line 169 "smallCobolParser.y"
                             { printf("\n RECOGNIZED MODULE: End Module 1: Identification Division\n\n"); 
						   printf("\nDollar 1 = ");
						   printf((yyvsp[-1].ast));
						   printf("\nDollar 2 = ");
						   printf((yyvsp[0].ast));
						   //$1->left = $2;
						   //$$ = $1;
						   (yyval.ast)->left = (yyvsp[-1].ast);
						   (yyval.ast)->right = (yyvsp[0].ast);
}
#line 1605 "smallCobolParser.tab.c"
    break;

  case 11:
#line 185 "smallCobolParser.y"
                            { printf("\n RECOGNIZED MODULE: End Module 2: Data Division\n\n");
						printf("\nDollar 1 = ");
						printf((yyvsp[0].ast));
						(yyval.ast) = (yyvsp[0].ast);
			
			
}
#line 1617 "smallCobolParser.tab.c"
    break;

  case 12:
#line 194 "smallCobolParser.y"
                       { printf("\n RECOGNIZED MODULE: End Module 2: Env Division\n\n");
					   printf("\nDollar 1 = ");
					   printf((yyvsp[0].ast));
					   (yyval.ast) = (yyvsp[0].ast);
					   
					   
}
#line 1629 "smallCobolParser.tab.c"
    break;

  case 13:
#line 208 "smallCobolParser.y"
                                                  { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division\n\n");
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[-3].ast));
						 	 printf("\nDollar 2 = ");
						 	 printf((yyvsp[-2].ast)); 
							 printf("\nDollar 3 = ");
						 	 printf((yyvsp[-1].ast));
 }
#line 1642 "smallCobolParser.tab.c"
    break;

  case 14:
#line 216 "smallCobolParser.y"
                                                 { printf("\n RECOGNIZED MODULE: End Module 3: Procedure Division (no statements)\n\n");
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[-2].ast));
						 	 printf("\nDollar 2 = ");
						 	 printf((yyvsp[-1].ast)); 
							 printf("\nDollar 3 = ");
						 	 printf((yyvsp[0].ast));
}
#line 1655 "smallCobolParser.tab.c"
    break;

  case 15:
#line 230 "smallCobolParser.y"
                                           { printf("\n RECOGNIZED RULE: Program ID Declaration\n\n");
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[-3].string));
						 	 printf("\nDollar 3 = ");
						 	 printf((yyvsp[-1].string));
							 (yyval.ast)->left = (yyvsp[-1].string);
							 (yyval.ast)->right = (yyvsp[-3].string);
}
#line 1668 "smallCobolParser.tab.c"
    break;

  case 16:
#line 239 "smallCobolParser.y"
                  { printf("\n RECOGNIZED RULE: Procedure ID Declaration\n\n");
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[-1].string));
							 (yyval.ast) = (yyvsp[-1].string);

}
#line 1679 "smallCobolParser.tab.c"
    break;

  case 17:
#line 251 "smallCobolParser.y"
                                     { 
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[-1].ast));
							 printf("\nDollar 2 = ");
						 	 printf((yyvsp[0].ast));
							 (yyvsp[-1].ast)->left = (yyvsp[0].ast);
							 (yyval.ast) = (yyvsp[-1].ast);
		}
#line 1692 "smallCobolParser.tab.c"
    break;

  case 18:
#line 260 "smallCobolParser.y"
                            {	
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[0].ast));
							 (yyval.ast) = (yyvsp[0].ast);

}
#line 1703 "smallCobolParser.tab.c"
    break;

  case 19:
#line 275 "smallCobolParser.y"
                            {
							 printf("\nDollar 1 = ");
						 	 printf((yyvsp[-1].ast));
							 (yyval.ast)->right = (yyvsp[-1].ast);
}
#line 1713 "smallCobolParser.tab.c"
    break;

  case 20:
#line 287 "smallCobolParser.y"
                        { 
			//$$ = $1;
			printf("\n RECOGNIZED RULE: Display Call\n");
			printf((yyvsp[0].string));
			printf("\nDollar 2 = ");
            printf(" JAVA: system.out.println('%s');\n\n",(yyvsp[0].string));
			/* this doesn't put the string in the java 'code' currently */
		}
#line 1726 "smallCobolParser.tab.c"
    break;

  case 21:
#line 295 "smallCobolParser.y"
                                          { 
			//$$ = $1;
			printf("\n RECOGNIZED RULE: Display Call With Concatenation\n");
            printf(" JAVA: system.out.println('%s' + ID);\n\n",(yyvsp[-2].string));
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].string));
			/* for some reason only the DISPLAY STRING worked without including PERIOD */
			/* this and all below require it for period to be parsed inside the function call */
			/* this means that all function calls only work with periods. */
		}
#line 1743 "smallCobolParser.tab.c"
    break;

  case 22:
#line 308 "smallCobolParser.y"
                            {
			//$$ = $1;
			printf("\n RECOGNIZED RULE: Accept ID\n");
			printf(" JAVA: %s = input.nextLine();\n\n", (yyvsp[0].string));
			printf("\nDollar 2 = ");
		    printf((yyvsp[0].string));
		}
#line 1755 "smallCobolParser.tab.c"
    break;

  case 23:
#line 316 "smallCobolParser.y"
                                                    { 
			//$$ = $2;
			printf("\n RECOGNIZED RULE: If Statement");
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf((yyvsp[-3].ast));
			printf("\nDollar 4 = ");
			printf((yyvsp[-1].ast));
			/* makeTree(,,) */
		}
#line 1770 "smallCobolParser.tab.c"
    break;

  case 24:
#line 327 "smallCobolParser.y"
                                                                {printf("\n RECOGNIZED RULE: While loop");
			printf("JAVA: while($4 $5 %i) $2}",(yyvsp[0].number));
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf((yyvsp[-4].ast));
			printf("\nDollar 5 = ");
			printf((yyvsp[-1].ast));
			printf("\nDollar 6 = ");
			printf((yyvsp[0].number));
		}
#line 1785 "smallCobolParser.tab.c"
    break;

  case 25:
#line 338 "smallCobolParser.y"
                                                 {printf("\n RECOGNIZED RULE: For loop");
			printf("JAVA: for(int i=0; i<%i;i++) {$2}",(yyvsp[-1].number));
			printf("JAVA: if($2) {$4}");
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].ast));
			printf("\nDollar 3 = ");
			printf((yyvsp[-1].number));
		}
#line 1798 "smallCobolParser.tab.c"
    break;

  case 26:
#line 351 "smallCobolParser.y"
                                                  { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");
			printf("JAVA: int $2 = $5");
			printf("\nDollar 2 = ");
			printf((yyvsp[-3].string));
			printf("\nDollar 5 = ");
			printf((yyvsp[0].ast));
		}
#line 1810 "smallCobolParser.tab.c"
    break;

  case 27:
#line 358 "smallCobolParser.y"
                                           { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: int $2 = $4");
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1822 "smallCobolParser.tab.c"
    break;

  case 28:
#line 365 "smallCobolParser.y"
                                                  { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: int $2 = $4");
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1834 "smallCobolParser.tab.c"
    break;

  case 29:
#line 376 "smallCobolParser.y"
                                                        { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 1");
			printf("JAVA: float %s = $5", (yyvsp[-3].string));
			printf("\nDollar 2 = ");
			printf((yyvsp[-3].string));
			printf("\nDollar 5 = ");
			printf((yyvsp[0].ast));
		}
#line 1846 "smallCobolParser.tab.c"
    break;

  case 30:
#line 383 "smallCobolParser.y"
                                                 { printf("\n RECOGNIZED RULE: Any-Digit Float Variable Declaration: Type 2");
			printf("JAVA: float %s = $4", (yyvsp[-2].string));
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1858 "smallCobolParser.tab.c"
    break;

  case 31:
#line 393 "smallCobolParser.y"
                                                           { printf("\n RECOGNIZED RULE: Any-Digit Un-Signed Variable Declaration: Type 1");
			printf("JAVA: needs extra package");
		}
#line 1866 "smallCobolParser.tab.c"
    break;

  case 32:
#line 396 "smallCobolParser.y"
                                                    { printf("\n RECOGNIZED RULE: Any-Digit Un-Signed Variable Declaration: Type 2");
			printf("JAVA: needs extra package");
		}
#line 1874 "smallCobolParser.tab.c"
    break;

  case 33:
#line 402 "smallCobolParser.y"
                                               { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 1");
			printf("JAVA: String %s = $5", (yyvsp[-3].string));
			printf("\nDollar 2 = ");
			printf((yyvsp[-3].string));
			printf("\nDollar 5 = ");
			printf((yyvsp[0].ast));
		}
#line 1886 "smallCobolParser.tab.c"
    break;

  case 34:
#line 409 "smallCobolParser.y"
                                        { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 2");
			printf("JAVA: String %s = $4", (yyvsp[-2].string));
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1898 "smallCobolParser.tab.c"
    break;

  case 35:
#line 416 "smallCobolParser.y"
                                                     { printf("\n RECOGNIZED RULE: Any-Digit Integer Variable Declaration: Type 3");
			printf("JAVA: String %s = $4", (yyvsp[-2].string));
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1910 "smallCobolParser.tab.c"
    break;

  case 36:
#line 427 "smallCobolParser.y"
                                   { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input");
			printf("JAVA: %s = %s + %i", (yyvsp[0].string), (yyvsp[0].string), (yyvsp[-2].number));
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].number));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].string));
		}
#line 1922 "smallCobolParser.tab.c"
    break;

  case 37:
#line 435 "smallCobolParser.y"
                               { printf("\n RECOGNIZED RULE: Add Statement: Single ID Input");
			printf("JAVA: %s = %s + %s", (yyvsp[0].string), (yyvsp[0].string), (yyvsp[-2].string)); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].string));
		}
#line 1934 "smallCobolParser.tab.c"
    break;

  case 38:
#line 443 "smallCobolParser.y"
                                         { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs");
			printf("JAVA: %s = %s + $2", (yyvsp[0].string), (yyvsp[0].string)); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].ast));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].string));
		}
#line 1946 "smallCobolParser.tab.c"
    break;

  case 39:
#line 451 "smallCobolParser.y"
                                     { printf("\n RECOGNIZED RULE: Add Statement: Multiple ID Inputs");
			printf("JAVA: %s = %s + $2", (yyvsp[0].string), (yyvsp[0].string)); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].ast));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].string));
		}
#line 1958 "smallCobolParser.tab.c"
    break;

  case 40:
#line 459 "smallCobolParser.y"
                                         { printf("\n RECOGNIZED RULE: Add Statement: Single Literal Input & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %i", (yyvsp[-2].number)); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].number));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1970 "smallCobolParser.tab.c"
    break;

  case 41:
#line 467 "smallCobolParser.y"
                                               { printf("\n RECOGNIZED RULE: Add Statement: Multiple Literal Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].ast));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1982 "smallCobolParser.tab.c"
    break;

  case 42:
#line 475 "smallCobolParser.y"
                                     { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + %s", (yyvsp[-2].string)); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].string));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 1994 "smallCobolParser.tab.c"
    break;

  case 43:
#line 483 "smallCobolParser.y"
                                           { printf("\n RECOGNIZED RULE: Add Statement: Single ID Inputs & Multiple ID Outputs");
			printf("JAVA: $4 = $4 + $2"); 
			printf("\nDollar 2 = ");
			printf((yyvsp[-2].ast));
			printf("\nDollar 4 = ");
			printf((yyvsp[0].ast));
		}
#line 2006 "smallCobolParser.tab.c"
    break;

  case 44:
#line 495 "smallCobolParser.y"
                               {
			//makeTree(,,)
		}
#line 2014 "smallCobolParser.tab.c"
    break;

  case 45:
#line 498 "smallCobolParser.y"
                                     {

		}
#line 2022 "smallCobolParser.tab.c"
    break;

  case 46:
#line 504 "smallCobolParser.y"
                      {}
#line 2028 "smallCobolParser.tab.c"
    break;

  case 47:
#line 504 "smallCobolParser.y"
                                 {}
#line 2034 "smallCobolParser.tab.c"
    break;

  case 48:
#line 504 "smallCobolParser.y"
                                            {}
#line 2040 "smallCobolParser.tab.c"
    break;

  case 49:
#line 504 "smallCobolParser.y"
                                                              {}
#line 2046 "smallCobolParser.tab.c"
    break;

  case 50:
#line 504 "smallCobolParser.y"
                                                                            {}
#line 2052 "smallCobolParser.tab.c"
    break;

  case 51:
#line 504 "smallCobolParser.y"
                                                                                          {
}
#line 2059 "smallCobolParser.tab.c"
    break;

  case 52:
#line 507 "smallCobolParser.y"
             {printf("DOUBLEDIGIT EMPTY RULE");}
#line 2065 "smallCobolParser.tab.c"
    break;

  case 53:
#line 508 "smallCobolParser.y"
                      { printf("\n RECOGNIZED RULE: Double Digit\n");
}
#line 2072 "smallCobolParser.tab.c"
    break;

  case 55:
#line 511 "smallCobolParser.y"
                     { printf("\n RECOGNIZED RULE: Nines\n");
}
#line 2079 "smallCobolParser.tab.c"
    break;

  case 57:
#line 514 "smallCobolParser.y"
                     { printf("\n RECOGNIZED RULE: X's\n");
}
#line 2086 "smallCobolParser.tab.c"
    break;

  case 58:
#line 517 "smallCobolParser.y"
                                                               { printf("\n RECOGNIZED RULE: Integer Pic Clause\n");
}
#line 2093 "smallCobolParser.tab.c"
    break;

  case 59:
#line 520 "smallCobolParser.y"
                                 { printf("\n RECOGNIZED RULE: Float Clause\n");
}
#line 2100 "smallCobolParser.tab.c"
    break;

  case 60:
#line 523 "smallCobolParser.y"
                              { printf("\n RECOGNIZED RULE: Un-signed Clause\n");
}
#line 2107 "smallCobolParser.tab.c"
    break;

  case 61:
#line 526 "smallCobolParser.y"
                                                                          { printf("\n RECOGNIZED RULE: String Pic Clause\n");
}
#line 2114 "smallCobolParser.tab.c"
    break;

  case 63:
#line 529 "smallCobolParser.y"
                                            {}
#line 2120 "smallCobolParser.tab.c"
    break;

  case 64:
#line 529 "smallCobolParser.y"
                                                        { printf("\n RECOGNIZED RULE: Number Clause\n");
}
#line 2127 "smallCobolParser.tab.c"
    break;

  case 65:
#line 532 "smallCobolParser.y"
                                  {}
#line 2133 "smallCobolParser.tab.c"
    break;

  case 66:
#line 532 "smallCobolParser.y"
                                          { printf("\n RECOGNIZED RULE: ID Clause\n");
}
#line 2140 "smallCobolParser.tab.c"
    break;

  case 67:
#line 540 "smallCobolParser.y"
                                       { 
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
	printf("\n RECOGNIZED DIVISION: Identification Division Declaration\n\n");
}
#line 2150 "smallCobolParser.tab.c"
    break;

  case 68:
#line 551 "smallCobolParser.y"
                                     { 
	printf("\n RECOGNIZED DIVISION: Environment Division Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2160 "smallCobolParser.tab.c"
    break;

  case 69:
#line 563 "smallCobolParser.y"
                             {
	(yyval.ast)->left = (yyvsp[-1].ast);
	(yyval.ast)->right = (yyvsp[0].ast);
	
	
}
#line 2171 "smallCobolParser.tab.c"
    break;

  case 70:
#line 570 "smallCobolParser.y"
                           {
		(yyvsp[-1].ast)->left = (yyvsp[0].ast);
		(yyval.ast) = (yyvsp[-1].ast);
	}
#line 2180 "smallCobolParser.tab.c"
    break;

  case 71:
#line 574 "smallCobolParser.y"
                  {
		(yyval.ast) = (yyvsp[0].ast);
	}
#line 2188 "smallCobolParser.tab.c"
    break;

  case 72:
#line 578 "smallCobolParser.y"
                               {(yyval.ast) = (yyvsp[0].ast);}
#line 2194 "smallCobolParser.tab.c"
    break;

  case 73:
#line 579 "smallCobolParser.y"
                  {(yyval.ast) = (yyvsp[0].ast);}
#line 2200 "smallCobolParser.tab.c"
    break;

  case 74:
#line 580 "smallCobolParser.y"
                     {(yyval.ast) = (yyvsp[0].ast);}
#line 2206 "smallCobolParser.tab.c"
    break;

  case 75:
#line 581 "smallCobolParser.y"
                {(yyval.ast) = (yyvsp[0].ast);}
#line 2212 "smallCobolParser.tab.c"
    break;

  case 76:
#line 583 "smallCobolParser.y"
                                     {
	printf("\n RECOGNIZED DIVISION: Data Division Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);

}
#line 2223 "smallCobolParser.tab.c"
    break;

  case 77:
#line 597 "smallCobolParser.y"
                                     { printf("\n RECOGNIZED SECTION: File Section Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2232 "smallCobolParser.tab.c"
    break;

  case 78:
#line 602 "smallCobolParser.y"
                                       {printf("\n RECOGNIZED SECTION: Linkage Section Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2241 "smallCobolParser.tab.c"
    break;

  case 79:
#line 607 "smallCobolParser.y"
                                             {printf("\n RECOGNIZED SECTION: Local-Storage Section Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2250 "smallCobolParser.tab.c"
    break;

  case 80:
#line 612 "smallCobolParser.y"
                                      { printf("\n RECOGNIZED SECTION: Working-Storage Section Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2259 "smallCobolParser.tab.c"
    break;

  case 81:
#line 621 "smallCobolParser.y"
                                          { printf("\n RECOGNIZED DIVISION: Procedure Division Declaration\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2268 "smallCobolParser.tab.c"
    break;

  case 82:
#line 631 "smallCobolParser.y"
                                { printf("\n RECOGNIZED RULE: Stop Run\n\n");
	(yyval.ast)->left = (yyvsp[-2].string);
	(yyval.ast)->right = (yyvsp[-1].string);
}
#line 2277 "smallCobolParser.tab.c"
    break;


#line 2281 "smallCobolParser.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = YY_CAST (char *, YYSTACK_ALLOC (YY_CAST (YYSIZE_T, yymsg_alloc)));
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
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

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;

  /* Do not reclaim the symbols of the rule whose action triggered
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
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
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

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


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


#if !defined yyoverflow || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif


/*-----------------------------------------------------.
| yyreturn -- parsing is finished, return the result.  |
`-----------------------------------------------------*/
yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  yystos[+*yyssp], yyvsp);
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
  return yyresult;
}
#line 638 "smallCobolParser.y"


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
