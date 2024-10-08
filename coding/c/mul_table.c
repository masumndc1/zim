#include <stdio.h>

int main() {
  int a = 5;
  int b = 1;
  int c;

  printf("%d multiplication table\n", a);

  while(b <= 10) {
   c = a*b;
   printf("%d x %d = %d\n",a, b, c);
   b++;
  }

return 0;
}
