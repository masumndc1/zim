#ifdef __APPLE__
#include <errno.h>
#else
#include <error.h>
#endif
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  // example of malloc and free
  // Memory content might look like:
  // [419823, -2, 0, 99234, 12] (Garbage data!)
  int *arr = malloc(5 * sizeof(int));

  // we can also use calloc instead of malloc
  // Arguments: (Number of items, Size of 1 item)
  // int *arr = calloc(5, sizeof(int));
  // Memory content is guaranteed to be: [0, 0, 0, 0, 0]

  if (arr == NULL) {
    perror("arr: out of memory");
    return 1;
  }
  arr[0] = 100;
  printf("1st element: %d\n", arr[0]);

  // this is not safe to assign beyond the
  // 5th element to avoid buffer over flow.
  // extend by array arr by realloc
  int *temp = realloc(arr, 6 * sizeof(int));
  if (temp == NULL) {
    perror("temp: out of memory");
    return 1;
  }

  // update memory address
  arr = temp;

  // now safe to asign 6th element
  arr[5] = 105;
  printf("5th element: %d\n", arr[5]);

  // free the memory
  free(arr);

  // Good practice: clear the pointer
  // so you don't use it by mistake later
  arr = NULL;
}

/*
will learn here 4 function:
malloc, free, calloc and realloc
// Ask the OS for the exact amount of bytes matching the unknown file size
char *buffer = (char *)malloc(file_size);
*/
