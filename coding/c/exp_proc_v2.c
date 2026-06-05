#include <errno.h> // Required for errno
#include <stdio.h>
#include <string.h>   // Required for strerror()
#include <sys/wait.h> // Required for wait()
#include <unistd.h>   // Required for fork() and execl()

/* ai generated */

int main() {
  int status;
  printf("[Parent] Starting main engine process...\n");

  // 1. Fork the process to create a background worker (child)
  pid_t pid = fork();

  if (pid < 0) {
    // Forking failed
    fprintf(stderr, "Fork failed: %s\n", strerror(errno));
    return 1;
  }

  if (pid == 0) {
    // CHILD PROCESS ZONE
    printf("[Child] Fork successful. Upgrading process memory to 'ls'.\n");

    // Wipe out child memory and execute the system command
    execl("/bin/ls", "ls", "-l", "/home", (char *)NULL);

    // This line only runs if execl fails (e.g., path not found)
    fprintf(stderr, "[Child] Execution failed: %s\n", strerror(errno));
    return 1;
  }

  // PARENT PROCESS ZONE
  printf("[Parent] Worker running in background. Waiting for it to finish.\n");

  // 2. Wait until the child completes its work to avoid zombie processes
  // wait(&status);
  waitpid(pid, &status, 0);

  printf("[Parent] Background worker has finished executing.\n");
  return 0;
}
