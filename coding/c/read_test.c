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
    char buffer[128];
    int a = read(0, buffer, 128);

    if (a == -1) 
        write(2, "error occured\n", 30);

    printf("%d", a);

    for (int i=0; i< 128; i++)
        printf("%c", buffer[i]);


    return 0;

}
