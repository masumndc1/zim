#include <stdio.h>

#define PERIOD 10
#define PRINCIPAL 5000

int main() {

int year;
float amount, inrate, value;

amount = PRINCIPAL;
inrate = 0.11;
year   = 0;

while(year <= PERIOD) {
  printf("%2d %10.5f\n",year,amount);
  value = amount + inrate * amount;
  year  = year + 1;
  amount = value;
}

return 0;
}
