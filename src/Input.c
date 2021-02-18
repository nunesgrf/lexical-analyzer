#include "Input.h"

FILE * getInputStream(int argumentCount, char** arguments) {
    if (argumentCount > 1) {
        return fopen(arguments[1], "r");
    }
    return stdin;
}
