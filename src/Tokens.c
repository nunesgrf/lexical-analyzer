#include "Tokens.h"

static const char *TokenString[] = {
    FOREACH_TOKEN(GENERATE_STRING)
};

void print(Token token, char * match) {
    if (token == TOKEN_ERROR) {
        printf("Match: %s\n", match);
        return;
    }
    printf("<%s>\n", TokenString[token]);
}