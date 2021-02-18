#include "ErrorHandler.h"

#include <stdlib.h>
#include <stdio.h>

type_error_list * createErrorList() {
    type_error_list* list = (type_error_list*) malloc(sizeof(type_error_list));
    list->length = 0;
    list->head = NULL;
    list->tail = NULL;
    return list;
}

type_error * createErrorIfNull(type_error * error, type_string * token, int line, int column) {
    if (error != NULL) {
        return error;
    }

    type_error * newError = (type_error*) malloc(sizeof(type_error));
    newError->token = token;
    newError->line = line;
    newError->column = column;
    newError->next = NULL;   

    return newError;
}

void errorListAppendIfNotNull(type_error_list * list, type_error * error) {
    if (list == NULL || error == NULL) {
        return;
    }

    if (list->length > 0) {
        list->length++;
        list->tail->next = error;
        list->tail = error;
    }
    else {
        list->length = 1;
        list->head = error;
        list->tail = error;
    }
}

void printIfThereAreErrors(type_error_list * list) {
    if (list == NULL) {
        return;
    }
    
    type_error * currentError = list->head;
    while (currentError != NULL) {
        printError(currentError);
        currentError = currentError->next;
    }
}

void printError(type_error * error) {
    printf(". Error on line %d, column %d\n", error->line, error->column);
    printf(".   Token: %s\n", error->token->letters);
}

void freeErrorList(type_error_list * list) {
    type_error * next;
    type_error * current = list->head;
  
    while (current != NULL) {
        next = current->next;
        freeError(current);
        current = next;
    }
    free(list);
}

void freeError(type_error * error) {
    stringFree(error->token);
    free(error);
}