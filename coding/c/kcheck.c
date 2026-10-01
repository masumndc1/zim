#!/usr/bin/tcc -run
#include <stdio.h>

int main() {
    // Run kubectl via popen and read output like a script
    FILE *fp = popen("/usr/bin/df -h", "r");
    if (!fp) return 1;

    printf("Running C as a script!\n");
    pclose(fp);
    return 0;
}
