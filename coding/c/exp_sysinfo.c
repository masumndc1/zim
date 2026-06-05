#include <fcntl.h>
#include <stdio.h>
#include <sys/sysinfo.h>
#include <sys/types.h>
#include <unistd.h>

int main(void) {
  struct sysinfo info;

  if (sysinfo(&info) == 0) {
    printf("%ld\n", info.uptime);
    printf("%lu %lu\n", info.totalram, info.freeram);
  }
  printf("pid %d\n", getpid());

  return 0;
}

/* explanation

#include <sys/sysinfo.h>

int sysinfo(struct sysinfo *info);

To pass a variable to the sysinfo function in C,
you must create a struct sysinfo variable in your
code and pass its memory address using the address-of
operator (&). Because the function signature expects
a pointer (struct sysinfo *info),
it will directly fill your variable with the system's
current statistics.

*/
