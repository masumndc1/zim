#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

int main(void) {
  pid_t pid;
  int status;

  printf("print process id: %d\n", getpid());

  /* now fork */
  if ((pid = fork()) == -1) {
    perror("could not fork\n");
    return 1;
  } else if (pid == 0) {
    if (execl("/usr/bin/man", "man", "ls", (char *)NULL) == -1) {
      perror("cant exec");
      return 1;
    }
  } else if (pid > 0) {
    printf("child process %d\n", pid);
  } else {
    fprintf(stderr, "something went wrong forking\n");
    return 1;
  }

  return 0;
}
