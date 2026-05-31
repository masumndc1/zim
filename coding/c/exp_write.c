#include <errno.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>

/* ssize_t write (int fd, const void *buf, size_t count); */

int main() {
  // const char *fname = "./test_file.txt";
  const char *fname = "./masum.txt";
  ssize_t nr;
  int fd, ret, error;

  fd = open(fname, O_RDWR);
  // printf("%d", fd);
  if (fd && fd > 0) {
    ret = fsync(fd);
    printf("%d", ret);
  } else {
    error = errno;
    printf("%d error occured", error);
  }
  close(fd);

  return EXIT_SUCCESS;
}
