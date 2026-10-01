#!/usr/bin/env -S tcc -run
#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int main() {
    // Run df to check local filesystems, skipping the header line
    FILE *fp = popen("df -h --output=target,pcent,used,avail 2>/dev/null | tail -n +2", "r");
    if (!fp) {
        perror("Failed to execute df");
        return 1;
    }

    printf("\033[1m%-25s %-10s %-10s %-10s\033[0m\n", "MOUNT POINT", "USE%", "USED", "AVAIL");
    printf("----------------------------------------------------\n");

    char line[256];
    int warning_count = 0;

    while (fgets(line, sizeof(line), fp) != NULL) {
        // Strip trailing newline
        line[strcspn(line, "\n")] = 0;

        char mount[128], pcent_str[16], used[16], avail[16];

        // Parse the columns
        if (sscanf(line, "%127s %15s %15s %15s", mount, pcent_str, used, avail) == 4) {
            // Convert percentage string (e.g. "85%") to an integer
            int pcent = atoi(pcent_str);

            // Conditional threshold logic: flag anything at or above 80%
            if (pcent >= 80) {
                warning_count++;
                printf("\033[31m%-25s %-10s %-10s %-10s [ALERT]\033[0m\n", mount, pcent_str, used, avail);
            } else {
                printf("%-25s %-10s %-10s %-10s\n", mount, pcent_str, used, avail);
            }
        }
    }

    pclose(fp);

    printf("----------------------------------------------------\n");
    if (warning_count > 0) {
        printf("\033[31m[!] Warning: %d volume(s) exceeding 80%% capacity.\033[0m\n", warning_count);
        return 2; // Non-zero exit code ideal for cron jobs or automation pipelines
    } else {
        printf("\033[32m[+] All local filesystems are healthy.\033[0m\n");
        return 0;
    }
}
