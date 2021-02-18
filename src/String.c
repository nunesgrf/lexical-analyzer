#include "String.h"

#include <stdlib.h>
#include <string.h>


int stringHasNoCapacity(type_string * string) {
    return string->max_size - string->size <= 1;
}

void reallocSize(type_string * string) {
    unsigned int newMaxSize = 2 * string->max_size;
    string->letters = (char*)realloc(string->letters, sizeof(char) * newMaxSize);
    string->max_size = newMaxSize;
}

type_string * string_create() {
    type_string * result = (type_string*) calloc(1, sizeof(type_string));
    result->size = 0;
    result->max_size = 1;
    result->letters = (char*) calloc(1, sizeof(char));
    return result;
}

void string_append(type_string * string, char letter) {
    if (stringHasNoCapacity(string)) {
        reallocSize(string);
    }
    string->letters[string->size] = letter;
    string->size++;
}

void string_clear(type_string * string) {
    free(string->letters);
    string->max_size = 1;
    string->size = 0;
    string->letters = (char*) calloc(1, sizeof(char));
}

void string_free(type_string * string) {
    free(string->letters);
    free(string);
}