#include <stdio.h>
#include <math.h>

#define PI 3.1416
#define MAX 180

int main() {
  int angle = 0;
  float value;

  printf("Angle\t Cos(angle)\n");

  while(angle <= MAX) {
    value = cos((PI/MAX)*angle);
    printf("%3d\t %10.6f\n", angle, value);
    angle = angle + 10;
  }

return 0;
}
