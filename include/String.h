#ifndef STRING_H
#define STRING_H

typedef struct String {
  char* letters;
  unsigned int size;
  unsigned int max_size;
} type_string;

type_string * stringCreate();

void stringAppend(type_string * string, char letter);

void stringClear(type_string * string);

void stringFree(type_string * string);

int stringHasNoCapacity(type_string * string);

void reallocSize(type_string * string);
#endif