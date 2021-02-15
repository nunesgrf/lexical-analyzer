#ifndef TOKENS_H
#define TOKENS_H

#define GENERATE_ENUM(ENUM) ENUM,
#define GENERATE_STRING(STRING) #STRING,
#define FOREACH_TOKEN(TOKEN)\
            TOKEN(TEST_1)\
            TOKEN(TEST_2)\
            TOKEN(TEST_3)\

#include <stdio.h>

typedef enum Token {
    FOREACH_TOKEN(GENERATE_ENUM)
} Token;

static const char *TokenString[] = {
    FOREACH_TOKEN(GENERATE_STRING)
};

void print(Token token) {
    printf("<%s>", TokenString[token]);
}

#endif