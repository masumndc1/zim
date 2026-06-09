#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

int main() {
  // 1. Declare the empty structure container
  struct stat file_info;
  const char *filename = "./test_file.txt";

  // 2. Call stat() on the target file path
  if (stat(filename, &file_info) < 0) {
    perror("Error reading file properties");
    return EXIT_FAILURE;
  }

  // 3. Extract the total file size in bytes
  printf("File Size: %ld bytes\n", (long)file_info.st_size);
  printf("user id of file: %d\n", file_info.st_uid);
  // how following works
  printf("last time accessed: %ld\n", file_info.st_atimespec.tv_sec);

  // 4. Check the file type using built-in system macros on st_mode
  if (S_ISDIR(file_info.st_mode)) {
    printf("Type: It is a directory.\n");
  } else if (S_ISREG(file_info.st_mode)) {
    printf("Type: It is a regular file.\n");
  }

  // 5. Check permissions (S_IRUSR = Read permission for Owner)
  if (file_info.st_mode & S_IRUSR) {
    printf("Permissions: Owner has Read access.\n");
  }

  // chown
  // int ow = chown(filename, 0, 0);
  // if (ow == 0) {
  if (chown(filename, 0, 0) == 0) {
    printf("file owner ship changed\n");
  } else {
    printf("could not change file ownership\n");
  }

  // current working directory
  char cwd[PATH_MAX];

  if (getcwd(cwd, sizeof(cwd)) != NULL) {
    printf("current working dir: %s\n", cwd);
  } else {
    perror("getcwd() error occurs");
    return 1;
  }

  return EXIT_SUCCESS;
}

/* go to: man stat


note here: original getcwd function in man getcwd

char *getcwd(char *buf, size_t size);

but we pass cwd, not &cwd in below

char cwd[PATH_MAX];
if (getcwd(cwd, sizeof(cwd)) != NULL) {
  // code here
}

Because in C, an array name decays automatically into a memory address pointer
to its very first element. therefore, when you declare an array like this

char cwd[4096];

The variable name cwd represents the address where that big block
of memory begins in your computer's RAM.

and we know
char *cwd   // declair
cwd         // initialization, basically they are same.
*/
