#include <stdio.h>
#include <string.h>
#include <sys/time.h>

/* usages of:
 * int utimes(const char *, const struct timeval *);
 */

#define typeof_str(x)                                                          \
  _Generic((x), int: "int", float: "float", char: "char", default: "unknown")

int main() {
  int a = 0;
  /* const char *filename = "test_file.txt";
  struct timeval new_times[2];

  gettimeofday(&new_times[0], NULL); // set current time
  gettimeofday(&new_times[1], NULL); // set current time

  new_times[1].tv_sec -= 3600;

  if (utimes(filename, &new_times[0]) == 0) {
    printf("\n%ld %d %s creation time modified\n", new_times[0].tv_sec,
           new_times[0].tv_usec, filename);
  } else {
    printf("\n%s could not modified\n", filename);
  } */

  // check if exactly same
  if (strcmp("int", typeof_str(a)) == 0) {
    printf("int\n");
  }

  // just compare 5 chars
  if (strncmp("int", typeof_str(a), 5) == 0) {
    printf("int\n");
  }

  return 0;
}
