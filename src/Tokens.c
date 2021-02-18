#include "Tokens.h"

void print(Token token, char * match) {
    if (token == TOKEN_ERROR) {
        printf("Match: %s\n", match);
        return;
    }
    printf("<%s>\n", TokenString[token]);
}