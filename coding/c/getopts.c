#include <stdlib.h>
#include <stdio.h>
#include <getopt.h>

const char* programe_name;

void print_usage (FILE* stream, int exit_code)
{
    fprintf (stream, "Usage: %s options [ inputfile ... ]\n", programe_name);
    fprintf (stream,
            " -h --help Display this usage information.\n"
            " -o --output filename Write output to file.\n"
            " -v --verbose Print verbose messages.\n");
    exit (exit_code);
}

int main (int argc, char* argv[]) {
    programe_name = argv[1];
    print_usage(stderr,1);
}
