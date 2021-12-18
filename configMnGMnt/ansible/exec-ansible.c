#define _POSIX_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/types.h>
#include <string.h>
#include <sys/utsname.h>

int main(void)
{
   char *command; 

   /* determine which linux distro it is 
    * based on that select command */
   FILE * fl = fopen("/etc/os-release", "r");
   
   if (!fl) 
       perror("We only support unix/linux OS");

   if ((!fscanf(fl, "SUSE")) 
             || (!fscanf(fl, "openSUSE"))) {
         command = "zypper update -y\n"
                   "zypper install -y ansible";
   }
   
   else if ((!fscanf(fl, "Debian")) 
             || (!fscanf(fl, "Ubuntu"))) {
         command = "apt update -y\n"
                   "apt install -y ansible";
   }

   else if ((!fscanf(fl, "FreeBSD")) 
	     || (!fscanf(fl, "DragonFly"))) {
         command = "pkg update -y\n"
                   "pkg install -y ansible";
   }

   else if ((!fscanf(fl, "CentOS")) 
             || (!fscanf(fl, "RockyLinux"))
	     || (!fscanf(fl, "Fedora"))) {
         command = "yum update -y\n"
                   "yum install -y ansible";
   }

   else {
          printf("we dont support this Unix/Linux OS");
   }

   /* install ansible using execl and error check it */
   if ( execl("/bin/sh","sh","-c", command, (char*)NULL) == -1 ) {
      perror("Can't execute program");
      return 1;
   }

   return 0;
}
