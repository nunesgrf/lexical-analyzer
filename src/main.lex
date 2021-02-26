%{

#include "Input.h"
#include "Tokens.h"
#include "String.h"
#include "ErrorHandler.h"

#include <stdio.h>

unsigned int line = 1;
unsigned int column = 0;

%}
%option noinput nounput

LEFT_BRACE "{"
RIGHT_BRACE "}"
LEFT_PARENTHESIS "("
RIGHT_PARENTHESIS ")"

EQUAL "="
PLUS "+"
ASTERISK "*"
MINUS "-"
SLASH "/"
LEFT_ANGLE "<"
RIGHT_ANGLE ">"
EXCLAMATION "!"

EQUAL_EQUAL "=="
PLUS_EQUAL "+="
ASTERISK_EQUAL "*="
MINUS_EQUAL "-="
SLASH_EQUAL "/="
LEFT_ANGLE_EQUAL "<="
RIGHT_ANGLE_EQUAL ">="
EXCLAMATION_EQUAL "!="

AND_AND "&&"
BAR_BAR "||"

COMMA ","
SEMICOLON ";"

IN "in"
FLOAT "float"
INT "int"
ELEM "elem"
SET "set"
IF "if"
ELSE "else"
FOR "for"
RETURN "return"
READ "read"
WRITE "write"
WRITELN "writeln"
ADD "add"
REMOVE "remove"
EXISTS "exists"
EMPTY "EMPTY"

UNDERSCORE      "_"
NEWLINE         \n
WHITESPACE      [\t ]+
DIGIT           [0-9]
STRING          \"[^"\\]*(\\.[^"\\]*)*\"
LETTER          [a-zA-Z]
CHAR            \'.\'
INTEGER         {DIGIT}+
REAL            {DIGIT}+"."{DIGIT}+
IDENTIFIER      {LETTER}({DIGIT}|{LETTER}|{UNDERSCORE})*

%x COMMENT
%x LINE_COMMENT
%%

"/*"                { column += yyleng; BEGIN(COMMENT); }
<COMMENT>"*/"       { column += yyleng; BEGIN(INITIAL); }
<COMMENT>{NEWLINE}  { column = 0; line++; }
<COMMENT>.          { column += yyleng; }
"//"                { column += yyleng; BEGIN(LINE_COMMENT); }
<LINE_COMMENT>{NEWLINE}  { column = 1; line++; BEGIN(INITIAL); }
<LINE_COMMENT>.          { column += yyleng; }

{LEFT_PARENTHESIS}  { return TOKEN_LEFT_PARENTHESIS; }
{RIGHT_PARENTHESIS} { return TOKEN_RIGHT_PARENTHESIS; }
{LEFT_BRACE}        { return TOKEN_LEFT_BRACE; }
{RIGHT_BRACE}       { return TOKEN_RIGHT_BRACE; }

{EQUAL}             { return TOKEN_EQUAL; }
{PLUS}              { return TOKEN_PLUS; }
{ASTERISK}          { return TOKEN_ASTERISK; }
{MINUS}             { return TOKEN_MINUS; }
{SLASH}             { return TOKEN_SLASH; }
{LEFT_ANGLE}        { return TOKEN_LEFT_ANGLE; }
{RIGHT_ANGLE}       { return TOKEN_RIGHT_ANGLE; }
{EXCLAMATION}       { return TOKEN_EXCLAMATION; }

{EQUAL_EQUAL}       { return TOKEN_EQUAL_EQUAL; }
{PLUS_EQUAL}        { return TOKEN_PLUS_EQUAL; }
{ASTERISK_EQUAL}    { return TOKEN_ASTERISK_EQUAL; }
{MINUS_EQUAL}       { return TOKEN_MINUS_EQUAL; }
{SLASH_EQUAL}       { return TOKEN_SLASH_EQUAL; }
{LEFT_ANGLE_EQUAL}  { return TOKEN_LEFT_ANGLE_EQUAL; }
{RIGHT_ANGLE_EQUAL} { return TOKEN_RIGHT_ANGLE_EQUAL; }
{EXCLAMATION_EQUAL} { return TOKEN_EXCLAMATION_EQUAL; }

{BAR_BAR}           { return TOKEN_BAR_BAR; }
{AND_AND}           { return TOKEN_AND_AND; }
{COMMA}             { return TOKEN_COMMA; }
{SEMICOLON}         { return TOKEN_SEMICOLON; }

{IN}                { return TOKEN_IN; }
{INT}               { return TOKEN_INT; }
{FLOAT}             { return TOKEN_FLOAT; }
{IF}                { return TOKEN_IF; }
{ELSE}              { return TOKEN_ELSE; }
{FOR}               { return TOKEN_FOR; }
{RETURN}            { return TOKEN_RETURN; }

{READ}              { return TOKEN_READ; }
{WRITE}             { return TOKEN_WRITE; }
{WRITELN}           { return TOKEN_WRITELN; }

{ADD}               { return TOKEN_ADD; }
{REMOVE}            { return TOKEN_REMOVE; }
{EXISTS}            { return TOKEN_EXISTS; }
{EMPTY}             { return TOKEN_EMPTY; }

{INTEGER}           { return TOKEN_INTEGER; }
{REAL}              { return TOKEN_REAL; }
{IDENTIFIER}        { return TOKEN_IDENTIFIER; }
{WHITESPACE}        { return TOKEN_WHITESPACE; }
{NEWLINE}           { column = 0; line++; return TOKEN_WHITESPACE; }
.                   { return TOKEN_ERROR; }

%%

int main(int argc, char* argv[]) {
    yyin = getInputStream(argc, argv);

    type_error * error = NULL;
    type_error_list * errorList = createErrorList();
    
    Token token;
    while((token = yylex())) {
        if (token == TOKEN_ERROR) {
            error = createErrorIfNull(error, stringCreate(), line, column);
            stringAppend(error->token, *yytext);
        }
        else {
            errorListAppendIfNotNull(errorList, error);
            error = NULL;
            print(token, yytext);
        }
        column += yyleng;
    }
    errorListAppendIfNotNull(errorList, error);
    printIfThereAreErrors(errorList);
    freeErrorList(errorList);
}