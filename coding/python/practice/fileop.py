#!/usr/bin/python

import sys

try:
    f=open("masum.txt",'w')
    f.write(sys.argv[1]+"\n")
finally:
    f.close()


