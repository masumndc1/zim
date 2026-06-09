#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void cleanup_logs(void) {
  printf("[CLEANUP] Closing files and clearing memory buffers...\n");
}

void disconnect_db(void) {
  printf("[CLEANUP] Safely severing database cluster connection...\n");
}

int main(int argc, char *argv[]) {
  // pid and parent pid
  pid_t pd = getpid();
  pid_t ppd = getppid();

  printf("pid value %d\n", pd);
  printf("parent pid value %d\n", ppd);

  // execl
  int ret;
  printf("\nThis line will print!");
  // Replace the current process with the Linux "ls" command
  // /bin/lss does not exists
  ret = execl("/bin/lss", "ls", "-l", NULL);
  // This code is dead! It will NEVER execute unless execl fails.
  if (ret == -1) {
    printf("\nerror occurs in last execl call.\n");
  }

  // execv
  pid_t pid = fork();

  if (pid == -1)
    perror("fork");

  /* the child */
  if (!pid) {
    int rett;
    char *args[] = {"ls", NULL};
    rett = execv("/bin/ls", args);
    if (rett == -1) {
      perror("execv");
      exit(EXIT_FAILURE);
    }
  }

  // atexit

  printf("Main loop: Processing data chunks...\n");
  atexit(cleanup_logs);
  atexit(disconnect_db);

  return EXIT_SUCCESS;
}
