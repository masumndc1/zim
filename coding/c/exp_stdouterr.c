#include <stdio.h>

int main(int argc, char *argv[]) {
  fprintf(stdout, "a regular stdout messages\n");
  fprintf(stderr, "an error messages\n");

  return 0;
  // return EXIT_SUCCESS;
}
