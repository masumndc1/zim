#include <stdio.h>

int main() {

  int days;
  printf("Enter days ");
  scanf("%d", &days);

  printf("Months %d ", days/30);
  printf("Days %d\n", days%30);

return 0;
}
