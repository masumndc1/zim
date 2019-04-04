#!/usr/bin/python
#cat.py

import os
import sys

if len(sys.argv) < 2:
    print "usage: cat.py file"
else:
    try:
        f=open(sys.argv[1],'r')
        print f.read()
    finally:
        f.close()
