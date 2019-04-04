#!/usr/bin/python

import os
import sys

if len(sys.argv) < 2: 
    print "usage: del.py file"

else:
    os.remove(sys.argv[1])
    print sys.argv[1]+"file deleted"
     

