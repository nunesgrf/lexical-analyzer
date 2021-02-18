#ifndef STRING_H
#define STRING_H

typedef struct String {
  char* letters;
  unsigned int size;
  unsigned int max_size;
} type_string;

type_string * string_create();

void string_append(type_string * string, char letter);

void string_clear(type_string * string);

void string_free(type_string * string);

int stringHasNoCapacity(type_string * string);

void reallocSize(type_string * string);
#endif