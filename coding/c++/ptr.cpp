 #include <cstdio>
 #include <stdlib.h>
 #include <string.h>


 int main(void) {
     int x = 0;
     int *p1, *p2;
     p1 = &x;
     p2 = p1;
     printf("p1 %p\n", p1); 
     printf("p2 %p\n", p2); 
     p1 = p1 + 1;
     printf("p1 %p\n", p1); 
     if (p1 < p2) printf("p1 is greater\n");
     else printf("p2 is greater\n");
     
     const char *p = "hello world";
     printf("%s", p);
     printf("\n");
     for (x = strlen(p) - 1; x > -1; x --) printf("%c", p[x]);
    /*
     * This is the example of malloc() and free()
     *
     */  
     printf("\n");
     char *q = (char *) malloc(50 * sizeof(char));
     
     if (!q) printf("size of allocation is empty");
     printf("size of allocated memory is %p\n", &q);
     printf("now going to free\n");
     //free(*q);
     //printf("size of allocated memory is %p\n", &q);

     printf("\n");
     /* print the address of x, not x's value! */
     return 0; 
}
