#include <stdio.h>
#include <stdlib.h>

/*
double (*a_fn_type)(int, int); // a type: pointer-to-function
//in (*a_fn_type) * means “a_fn_type is a pointer”, this () is important here.

// better syntax and much cleaner

typedef double (*fn2int_t)(int, int);
fn2int_t f;

// This creates a new type name called fn2int_t and that type means:
// pointer to a function that takes two ints and returns a double.

*/

int main() {
  int iVar = 77, *iPtr;
  printf("%d\n", iVar);
  // int *iPtr;
  //*iPtr = &iVar;
  iPtr = &iVar;
  *iPtr = 80;

  // printf("Value of iPtr (i.e. the address of iVar): %p\n"
  //        "Address of iPtr: %p\n", iPtr, &iPtr);
  printf("%d\n", iVar);
  ++*iPtr;
  printf("%d\n", *iPtr);
  // printf("%p\n", **iPtr);

  printf("what does double dereferencing means?\n");
  char a = 'z';
  char *b = &a;
  char **c = &b;
  printf("a = %c, b = %p, c = %c\n", a, b, **c);

  printf("-> another ptr example \n");
  int m[2] = {1, 2};
  int *pi;
  int j = 0;
  for (pi = &m[0]; pi < &m[2]; ++pi) {
    // &m[0] is the address of the first element of the array. therefore,
    // pi = &m[0], is now pointing to the first elements of m.
    // *pi means “the value at the address stored in pi”.
    printf("pi = %p, *pi = %d\n", pi, *pi);
    j += *pi;
  }
  printf("value from this example: %d\n", j);

  return EXIT_SUCCESS;
}
