#include <errno.h>
#include <fcntl.h>
#include <stddef.h>
#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

/*

// to open use following
int open(const char *name, int flags);
int open(const char *name, int flags, mode_t mode);

// to read use following
ssize_t read (int fd, void *buf, size_t len);

 * void *buf: A pointer to the memory buffer where the read data will be stored.
 * To pass a variable to void *buf, you must pass its memory address using the
 * address-of operator (&).Because void * is a generic pointer in C,
 * it automatically accepts a pointer to any data type without requiring an
 * explicit typecast.
 *

// they are identical in c
void *buf;   // Style A: Attached to the variable name
void * buf;  // Style B: Spaced on both sides
void* buf;   // Style C: Attached to the data type
void*buf;    // Style D: No spaces (legal, but hard to read)

*/

int main() {
  const char *fname = "./test_file.txt";
  int err = errno;
  int fd;
  ssize_t nr;
  unsigned long word;

  fd = open(fname, O_RDONLY);
  printf("\nfd value: %d\n", fd);
  if (fd == -1) {
    printf("errno: %d\t", err);
    printf("file not found\n");
  } else {
    printf("%s exist\n", fname);
    nr = read(fd, &word, sizeof(unsigned long));
    printf("byte read: %zd\n", nr);
  }

  close(fd);
  return 0;
}
