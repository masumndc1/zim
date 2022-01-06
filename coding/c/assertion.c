/*
 * =====================================================================================
 *
 *       Filename:  assertion.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  01/06/2022 21:34:24
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

int 
main (void)
{
    int status = 1;

      for (int i = 0; i <= 10; ++i) {
            for (int j = 0; j <= i; ++j) {
                    printf("%d ", j);
            }
          printf("\n");
       assert (status == 1);
      }
}

