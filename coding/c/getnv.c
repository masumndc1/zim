#include <stdio.h>
#include <stdlib.h>

int main() {
  char *server_name = getenv("SERVER_NAME");
  if (server_name == NULL)
    server_name = "lxd1.masum.com";

  printf("server name is %s\n", server_name);
  return 0;
}
