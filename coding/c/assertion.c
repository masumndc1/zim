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


int 
main (void)
{
  int status == 1;

  for (i = 0; i < 100; ++i) {
    printf("%d\n", i);
    assert (status == 0);
  }
}
