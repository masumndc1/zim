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
