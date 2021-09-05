/*
 * =====================================================================================
 *
 *       Filename:  write_test.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  08/31/2021 14:18:36
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
#include <unistd.h>

int main()
{
    int a = write(1, "here you go\n", 20);
    printf("%d", a);
}
