#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <sys/utsname.h>

/* int uname(struct utsname *buf); */
/* int utimes(const char *, const struct timeval *); */

int main(void) {
  struct utsname system_details;
  struct clockinfo system_clocks;
  const char *tm;
  const struct timeval *tmval;

  if (uname(&system_details) == 0) {
    printf("%s\n", system_details.sysname);
    printf("%s\n", system_details.nodename);
    printf("%s\n", system_details.release);
    printf("%s\n", system_details.version);
    printf("%s\n", system_details.machine);
  } else {
    printf("could not find the supported os\n");
  }

  if (utimes(&tm, &tmval) == 0) {
    printf("%c", tm);
  }

  /*
    if (clockinfo(&system_clocks)) {
      printf("%d\n", clockinfo.hz);
    } else {
      printf("could not find\n");
    }
  */

  return 0;
}
