#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main(void) {
  const char *fname = "./not_exits_file.txt";
  int fd;

  fd = open(fname, O_RDONLY);

  if (fd < 0) {
    // usage of strerror. use either of following
    printf("%s\n", strerror(errno));
    fprintf(stderr, "%s\n", strerror(errno));
  }

  return 0;
}

// output:
// strerror -> No such file or directory
