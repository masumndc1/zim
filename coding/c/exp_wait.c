#include <stdio.h>
#include <sys/wait.h> // Required for wait()
#include <unistd.h>

int main() {
  pid_t pid = fork(); // Clone the process

  if (pid == 0) {
    // --- Inside Child Process ---
    printf("Child: I am starting a slow task...\n");
    sleep(3); // Simulate 3 seconds of work
    printf("Child: Task complete. Exiting!\n");
    return 42; // Exit with a status code of 42
  } else {
    // --- Inside Parent Process ---
    int status;
    printf("Parent: Waiting for my child to finish...\n");

    // This pauses the parent until the child hits "return" or "exit()"
    pid_t dead_child_pid = wait(&status);

    printf("Parent: Child (PID %d) is dead. Now I can continue!\n",
           dead_child_pid);
  }

  // waitpid

  return 0;
}
