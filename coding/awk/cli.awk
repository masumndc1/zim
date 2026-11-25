#!/usr/bin/awk -f

BEGIN {
    cmd = "date '+%Y-%m-%d %H:%M:%S'"
    if ((cmd | getline now) > 0) {
        print now
    }
    close(cmd)

    # Execute a shell command and get exit code:
    rc = system("test -d /tmp")
    print "rc:", rc
}
