#include <stdlib.h>
#include <stdio.h>

int 
main() 
{
    int iVar = 77, *iPtr; 
    printf("%d\n", iVar);
    //int *iPtr;
    //*iPtr = &iVar;
    iPtr = &iVar;
    *iPtr = 80;
    

    // printf("Value of iPtr (i.e. the address of iVar): %p\n"
    //        "Address of iPtr: %p\n", iPtr, &iPtr);
    printf("%d\n", iVar);
    ++*iPtr;
    printf("%d\n", *iPtr);
    //printf("%p\n", **iPtr);

    printf("what does double dereferencing means?\n");
    char a = 'z';
    char *b = &a;
    char **c = &b;
    printf("a = %c, b = %p, c = %c\n",a,b, **c);

    
    return EXIT_SUCCESS;
}

