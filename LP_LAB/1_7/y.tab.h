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

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ne = 258,
    ee = 259,
    ob = 260,
    cb = 261,
    le = 262,
    ge = 263,
    NOT = 264,
    OR = 265,
    AND = 266,
    op = 267,
    VARIABLE = 268,
    INTEG = 269,
    WHILE = 270,
    FOR = 271,
    IF = 272,
    THEN = 273,
    ELSE = 274,
    BOOL = 275,
    INT = 276,
    FLOAT = 277,
    SWITCH = 278,
    CASE = 279,
    BREAK = 280
  };
#endif
/* Tokens.  */
#define ne 258
#define ee 259
#define ob 260
#define cb 261
#define le 262
#define ge 263
#define NOT 264
#define OR 265
#define AND 266
#define op 267
#define VARIABLE 268
#define INTEG 269
#define WHILE 270
#define FOR 271
#define IF 272
#define THEN 273
#define ELSE 274
#define BOOL 275
#define INT 276
#define FLOAT 277
#define SWITCH 278
#define CASE 279
#define BREAK 280

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 140 "1.y"
    
    DATA d;

#line 111 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
