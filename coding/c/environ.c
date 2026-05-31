#include <stdio.h>
/* The ENVIRON variable contains the environment. */
extern char **environ;

int main() {
  char **var;
  for (var = environ; *var != NULL; ++var)
    printf("%s\n", *var);
  return 0;
}

/* following should also works
#include <stdio.h>

// You must declare this explicitly in your C file to use it
extern char **environ;

int main() {
    // Loop until we reach the NULL pointer at the end of the array
    for (size_t i = 0; environ[i] != NULL; i++) {
        printf("%s\n", environ[i]);
    }
    return 0;
}
*/
