#!/usr/bin/python

import os
import sys

if len(sys.argv) < 3: 
    print "usage: move.py from_file to_file"

else:
    try:
        f=open(sys.argv[1],'r')
        o=open(sys.argv[2],'w')
        for line in f.read():
            o.write(line)
            o.newlines
    finally:
        f.close()
        o.close()
        os.remove(sys.argv[1])
