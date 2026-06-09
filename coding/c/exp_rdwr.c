#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  const char *filename = "./test_file.txt";
  ssize_t nr;
  // unsigned long word;
  char word;

  int fd = open(filename, O_RDWR);

  if (fd == -1) {
    printf("error in file opening");
  }

  // read some data out of a file
  while ((nr = read(fd, &word, sizeof(word))) > 0) {
    if (nr == -1) {
      printf("could not read");
    } else {
      write(STDOUT_FILENO, &word, 1);
    }
  }

  /* example of lseek
   go to the very end of file
   example of reversing the text

   off_t lseek(int fildes, off_t offset, int whence);
   an offset is simply a distance from a starting point.
  */
  off_t file_size = lseek(fd, 0, SEEK_END);
  for (off_t i = file_size - 1; i >= 0; i--) {
    // Jump to byte index 'i' relatively from start of file
    lseek(fd, i, SEEK_SET);

    // Read that single byte and print it
    read(fd, &word, 1);
    write(STDOUT_FILENO, &word, 1);
  }
  printf("\n\n this file is %lld byte long\n\n", file_size);

  close(fd);
  return EXIT_SUCCESS;
}

/* explanation
write( STDOUT_FILENO ,     &byte     ,    1   );
        │                   │             │
   [Destination]       [Warehouse]   [Item Count]
        │                   │             │
  "Send to Screen" ,  "At Address X" , "Move 1 Item"

for lseek:
   off_t lseek(int fildes, off_t offset, int whence);
   an offset is simply a distance from a starting point.

   Start at 0, skip 4 bytes ahead.
   lseek(fd, 4, SEEK_SET)
*/
