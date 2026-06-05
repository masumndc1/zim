#include <pwd.h>
#include <stdio.h>
#include <sys/types.h>

int main(int argc, char *argv[]) {
  struct passwd *pw = getpwnam(argv[1]);

  if (pw == NULL) {
    perror("user not found");
    return 1;
  } else {
    printf("%s\n", pw->pw_name);
    printf("%s\n", pw->pw_passwd);
    printf("%s\n", pw->pw_gecos);
    printf("%s\n", pw->pw_dir);
    printf("%s\n", pw->pw_shell);
  }

  return 0;
}
