#include <stddef.h>

int main(){
  // a constant byte array
  char * constantCharArray = "Or in other words, a string";

  // C99 style array instantiation
  int aListOfNumbers[5] = { 1, 2, 3, 4, 5 };
  int aListOfNumbers2[] = { 1, 2, 3, 4, 5};

  // C99 Variable length array declaration
  int someLength = 5;
  float aListOfFloats[someLength];

  // pointer declaration to NULL
  int * someIntegerPtr = NULL;
  int someInteger = 5;

  // address dereference
  someIntegerPtr = &someInteger;

  return 0;
}
