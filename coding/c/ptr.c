#include <stdlib.h>
#include <stdio.h>

int 
main() 
{
    int iVar = 77; 
    //int *iPtr;
    //iPtr = &iVar;
    int *iPtr = &iVar;

    printf("Value of iPtr (i.e. the address of iVar): %p\n"
            "Address of iPtr: %p\n", iPtr, &iPtr);
    
    return EXIT_SUCCESS;
}

