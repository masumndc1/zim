#include <stdlib.h>
#include <stdio.h>
#include <assert.h>


int do_status (void) {
  return 1;
}

int 
main (void)
{
  int status = 1;

  for (int i = 0; i <= 10; ++i) {
      for (int j = 0; j <= i; ++j) {
        printf("%d ", j);
      }
     printf("\n");
     assert (do_status());
  }
}

