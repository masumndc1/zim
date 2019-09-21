#!/usr/bin/python
#cat.py

import os
import sys

"""
print "usage: cat.py file"
"""
if len(sys.argv) < 2:
    print __doc__
else:
    try:
        f=open(sys.argv[1],'r')
        print f.read()
    finally:
        f.close()
