#include <stddef.h> // Header where size_t is defined
#include <stdio.h>

/* size_t type vars in c

 size_t:
 size_t is an unsigned integer data type in C used to represent the size of any
 object in bytes. It is specifically designed to handle memory sizes and array
 indexing safely.

 opposite of size_t is ssize_t is the signed counterpart to size_t.
 It is used for functions that need to return a size or count on success,
 but a negative value to signal an error.
*/

int main() {
  int numbers[] = {10, 20, 30, 40, 50};

  // sizeof returns size_t; use %zu format specifier to print it
  size_t array_size = sizeof(numbers);

  printf("Array size in bytes: %zu\n", array_size);

  // Using size_t for safe loop indexing
  for (size_t i = 0; i < 5; i++) {
    printf("Index %zu: %d\n", i, numbers[i]);
  }

  return 0;
}

/* output:
Array size in bytes: 20
Index 0: 10
Index 1: 20
Index 2: 30
Index 3: 40
Index 4: 50
*/
