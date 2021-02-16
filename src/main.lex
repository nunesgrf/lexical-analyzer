%{

#include "Input.h"
#include "Tokens.h"
#include <stdio.h>

unsigned int line = 1;
unsigned int column = 0;

%}

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

IN_RESERVED_WORD "in"
FLOAT_RESERVED_WORD "float"
INT_RESERVED_WORD "int"
ELEM_RESERVED_WORD "elem"
SET_RESERVED_WORD "set"
IF_RESERVED_WORD "if"
ELSE_RESERVED_WORD "else"
FOR_RESERVED_WORD "for"
RETURN_RESERVED_WORD "return"
READ_RESERVED_WORD "read"
WRITE_RESERVED_WORD "write"
WRITELN_RESERVED_WORD "writeln"
ADD_RESERVED_WORD "add"
REMOVE_RESERVED_WORD "remove"
EXISTS_RESERVED_WORD "exists"
EMPTY_RESERVED_WORD "EMPTY"

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

%%

int main(int argc, char* argv[]) {
    FILE * inputStream;
    defineInputStream(inputStream, argc, argv);
    runLexicalAnalyzer(inputStream);
}