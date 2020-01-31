#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main () {
  char *command;

// now run the command
  command="ls -la";
  system(command);

  return 0;
} 

