#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>

int main(void)
{
   printf("Installing ansible...\n");
   char *command = "yum update\n"
	           "yum install -y ansible";

   /* install ansible using execl and error check it */
   if ( execl("/bin/sh","sh","-c", command, 
      (char*)NULL) == -1 )
   {
      perror("Can't execute program");
      return 1;
   }
   return 0;
}
