#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  // char *opt;
  for (int i = 0; i < argc; i++) {
    printf("%d %s\n", i, argv[i]);
  }

  if (argc < 2) {
    printf("provide any of s/m/h as argument\n");
    return EXIT_FAILURE;
  }

  if (strcmp(argv[1], "-s") == 0) {
    printf("do sum\n");
  } else if (strcmp(argv[1], "-m") == 0) {
    printf("do muliply\n");
  } else if (strcmp(argv[1], "-h") == 0) {
    printf("show help\n");
  } else {
    printf("pass any off -s/-m/-h\n");
    return EXIT_FAILURE;
  }

  printf("total arguments passed: %d\n", argc);
  return EXIT_SUCCESS;
}
