#!/usr/bin/env python


import os 
import sys
import subprocess

#if os.path.isdir(sys.argv[1]):
#    print(sys.argv[1], "is a directory")
#    print sys.argv[1], "is a directory"

#else:
#    print("this is not a directory")

if __name__ == "__main__":
    subprocess.call(["ls","-la"])

