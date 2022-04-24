#define _POSIX_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <string.h>


int main (int argc, char *argv[]) {

   char *command; 

   if (argc <= 1) {
      printf("%s suse|opensuse|ubuntu|debian|rockylinux|centos|fedora|freebsd|dragonfly\n", argv[0]);
      return 1;
   }


   if (!strcmp("debian", argv[1])
             || !strcmp("ubuntu", argv[1])) {
         command = "apt update -y\n"
                   "apt install -y ansible";
   }

   else if (!strcmp("freebsd", argv[1]) 
             || !strcmp("dragonfly", argv[1])) {
         command = "pkg update -y\n"
                   "pkg install -y py38-ansible";
   }

   else if (!strcmp("centos", argv[1]) 
             || !strcmp("rockylinux", argv[1])
	     || !strcmp("fedora", argv[1])) {
         command = "yum update -y\n"
                   "yum install -y ansible";
   }

   else if (!strcmp("suse", argv[1]) 
             || !strcmp("opensuse", argv[1])) {
         command = "zypper update -y\n"
                   "zypper install -y ansible";
   }

   else {
          printf("we dont support this Unix/Linux OS");
   }
   
   /* install ansible using execl */

   if (execl("/bin/sh","sh","-c", command, (char*)NULL) == -1 ) {
      perror("Can't execute program");
      return 1;
   }

   return 0;
}
