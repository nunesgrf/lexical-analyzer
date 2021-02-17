#ifndef TOKENS_H
#define TOKENS_H

#define GENERATE_ENUM(ENUM) ENUM,
#define GENERATE_STRING(STRING) #STRING,
#define FOREACH_TOKEN(TOKEN)\
            TOKEN(TOKEN_LEFT_PARENTHESIS)\
            TOKEN(TOKEN_RIGHT_PARENTHESIS)\
            TOKEN(TOKEN_LEFT_BRACE)\
            TOKEN(TOKEN_RIGHT_BRACE)\
            TOKEN(TOKEN_EQUAL)\
            TOKEN(TOKEN_PLUS)\
            TOKEN(TOKEN_ASTERISK)\
            TOKEN(TOKEN_MINUS)\
            TOKEN(TOKEN_SLASH)\
            TOKEN(TOKEN_LEFT_ANGLE)\
            TOKEN(TOKEN_RIGHT_ANGLE)\
            TOKEN(TOKEN_EXCLAMATION)\
            TOKEN(TOKEN_EQUAL_EQUAL)\
            TOKEN(TOKEN_PLUS_EQUAL)\
            TOKEN(TOKEN_ASTERISK_EQUAL)\
            TOKEN(TOKEN_MINUS_EQUAL)\
            TOKEN(TOKEN_SLASH_EQUAL)\
            TOKEN(TOKEN_LEFT_ANGLE_EQUAL)\
            TOKEN(TOKEN_RIGHT_ANGLE_EQUAL)\
            TOKEN(TOKEN_EXCLAMATION_EQUAL)\
            TOKEN(TOKEN_AND_AND)\
            TOKEN(TOKEN_BAR_BAR)\
            TOKEN(TOKEN_COMMA)\
            TOKEN(TOKEN_SEMICOLON)\
            TOKEN(TOKEN_IN)\
            TOKEN(TOKEN_FLOAT)\
            TOKEN(TOKEN_INT)\
            TOKEN(TOKEN_ELEM)\
            TOKEN(TOKEN_SET)\
            TOKEN(TOKEN_IF)\
            TOKEN(TOKEN_ELSE)\
            TOKEN(TOKEN_FOR)\
            TOKEN(TOKEN_RETURN)\
            TOKEN(TOKEN_READ)\
            TOKEN(TOKEN_WRITE)\
            TOKEN(TOKEN_WRITELN)\
            TOKEN(TOKEN_ADD)\
            TOKEN(TOKEN_REMOVE)\
            TOKEN(TOKEN_EXISTS)\
            TOKEN(TOKEN_EMPTY)\
            TOKEN(TOKEN_INTEGER)\
            TOKEN(TOKEN_REAL)\
            TOKEN(TOKEN_WHITESPACE)\
            TOKEN(TOKEN_IDENTIFIER)\
            TOKEN(TOKEN_ERROR)
                  
#include <stdio.h>

typedef enum Token {
    FOREACH_TOKEN(GENERATE_ENUM)
} Token;

static const char *TokenString[] = {
    FOREACH_TOKEN(GENERATE_STRING)
};

void print(Token token);

#endif