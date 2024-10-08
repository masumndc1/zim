#!/usr/bin/python

import sys

try:
    f=open("masum.txt",'w')
    f.write(sys.argv[1]+"\n")
finally:
    f.close()


    """
    we can also read the file by following

    for line in open('some_file.txt'):
        print line
    """
