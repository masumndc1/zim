#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
  char ch[20];
  char newch[20];

  while (fgets(ch, sizeof(ch), stdin) != NULL) {
    printf("type something within 19 chars:\n");
    // printf("%lu", sizeof(ch));
    for (int i = 0; i < sizeof(ch); i++) {
      // upper case to lower case
      if ((ch[i] >= 65) && (ch[i] <= 90)) {
        newch[i] = ch[i] + 32;
      }
      // lower case to upper case
      if ((ch[i] >= 97) && (ch[i] <= 122)) {
        newch[i] = ch[i] - 32;
      }
    }

    printf("%s", newch);
    printf("\ntype exit to exit:\n");

    if (strcmp(newch, "EXIT") == 0) {
      break;
    }
    memset(ch, 0, sizeof(ch));
    memset(newch, 0, sizeof(newch));
  }

  return EXIT_SUCCESS;
}
