#ifndef INPUTLOADER_H
#define INPUTLOADER_H

#include <stdio.h>

void defineInputStream(FILE * inputStream, int argumentCount, char** arguments);

void runLexicalAnalyzer(FILE * inputStream);

#endif