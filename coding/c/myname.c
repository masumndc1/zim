#include <stdio.h>

int main() {
  char ans;
  printf("Wanna know my name?\n");
  printf("if so then press Y/y or N/n?\n");

  ans = getchar();

  if (ans == 'Y' || ans == 'y')
    printf("Bumble bee\n");
  else
    printf("Boo\n");

return 0;
}
