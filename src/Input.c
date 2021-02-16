#include "Input.h"

void defineInputStream(FILE * inputStream, int argumentCount, char** arguments) {
    inputStream = stdin;
    if (argumentCount > 1) {
        inputStream = fopen(arguments[1], "r");
    }
}

void runLexicalAnalyzer(FILE * inputStream) {

}