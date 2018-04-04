/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Author: Noah Perryman <nep36@pitt.edu>                                  *
 * CS 1622                                                                 *
 * Project 3a:                                                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

import java_cup.runtime.*;

%%

%public
%class nep36_lexer
%unicode
%line
%column
%cup
%cupdebug
%implements sym
%eofclose
%ignorecase

%{

    private void error(String message) {
        System.err.println("Error at line "+(yyline+1)+", column "+(yycolumn+1)+" : "+message);
    }

%}

/* main character classes */
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]

/* comments */
Comment = "//" {InputCharacter}* {LineTerminator}?
BlockComment = "/*"~"*/"

/* identifiers */
Identifier = [A-Za-z_][A-Za-z_0-9]*

/* integer literals */
IntegerLiteral = 0 | [1-9][0-9]*

%%

<YYINITIAL> {

  /* keywords */
    "class"                         {return new Symbol(CLASS, yyline+1, yycolumn+1);}
    "public"                        {return new Symbol(PUBLIC, yyline+1, yycolumn+1);}
    "static"                        {return new Symbol(STATIC, yyline+1, yycolumn+1);}
    "void"                          {return new Symbol(VOID, yyline+1, yycolumn+1);}
    "main"                          {return new Symbol(MAIN, yyline+1, yycolumn+1);}
    "String"                        {return new Symbol(STRING, yyline+1, yycolumn+1);}
    "extends"                       {return new Symbol(EXTENDS, yyline+1, yycolumn+1);}
    "return"                        {return new Symbol(RETURN, yyline+1, yycolumn+1);}
    "if"                            {return new Symbol(IF, yyline+1, yycolumn+1);}
    "else"                          {return new Symbol(ELSE, yyline+1, yycolumn+1);}
    "while"                         {return new Symbol(WHILE, yyline+1, yycolumn+1);}
    "System.out.println"            {return new Symbol(PRINTLN, yyline+1, yycolumn+1);}
    "length"                        {return new Symbol(LENGTH, yyline+1, yycolumn+1);}
    "this"                          {return new Symbol(THIS, yyline+1, yycolumn+1);}
    "new"                           {return new Symbol(NEW, yyline+1, yycolumn+1);}

  /* types */
    "int"                           {return new Symbol(INT, yyline+1, yycolumn+1);}
    "boolean"                       {return new Symbol(BOOL, yyline+1, yycolumn+1);}

  /* boolean literals */
    "true"                           {return new Symbol(TRUE, yyline+1, yycolumn+1);}
    "false"                          {return new Symbol(FALSE, yyline+1, yycolumn+1);}

  /* separators */
    "("                             {return new Symbol(LPAREN, yyline+1, yycolumn+1);}
    ")"                             {return new Symbol(RPAREN, yyline+1, yycolumn+1);}
    "{"                             {return new Symbol(LBRACE, yyline+1, yycolumn+1);}
    "}"                             {return new Symbol(RBRACE, yyline+1, yycolumn+1);}
    "["                             {return new Symbol(LBRACKET, yyline+1, yycolumn+1);}
    "]"                             {return new Symbol(RBRACKET, yyline+1, yycolumn+1);}
    ";"                             {return new Symbol(SEMI, yyline+1, yycolumn+1);}
    ","                             {return new Symbol(COMMA, yyline+1, yycolumn+1);}
    "."                             {return new Symbol(PERIOD, yyline+1, yycolumn+1);}
  
  /* operators */
    "="                             {return new Symbol(EQUALS, yyline+1, yycolumn+1);}
    "&&"                            {return new Symbol(AND, yyline+1, yycolumn+1);}
    "<"                             {return new Symbol(LESS, yyline+1, yycolumn+1);}
    "+"                             {return new Symbol(PLUS, yyline+1, yycolumn+1);}
    "-"                             {return new Symbol(MINUS, yyline+1, yycolumn+1);}
    "*"                             {return new Symbol(MULT, yyline+1, yycolumn+1);}
    "!"                             {return new Symbol(NOT, yyline+1, yycolumn+1);}

  /* Integer Literal */
    {IntegerLiteral}                {return new Symbol(INTLIT, yyline+1, yycolumn+1, Integer.parseInt(yytext()));}

  /* comments */
    {Comment}                       { /* ignore */ }
    {BlockComment}                  { /* ignore */ }

  /* whitespace */
    {WhiteSpace}                    { /* ignore */ }

  /* identifiers */ 
    {Identifier}                    {return new Symbol(ID, yyline+1, yycolumn+1, yytext());}

}
