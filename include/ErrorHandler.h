#ifndef ERRORHANDLER_H
#define ERRORHANDLER_H

#include "String.h"

typedef struct error {
    unsigned int line;
    unsigned int column;
    type_string * token;
    struct error * next;
} type_error;

typedef struct errorList {
    unsigned int length;
    type_error * head;
    type_error * tail;
} type_error_list;

type_error_list * createErrorList();

type_error * createErrorIfNull(type_error * error, type_string * token, int line, int column);

void errorListAppendIfNotNull(type_error_list * list, type_error * error);

void printIfThereAreErrors(type_error_list * list);

void printError(type_error * error);

void freeErrorList(type_error_list * list);

void freeError(type_error * error);

#endif