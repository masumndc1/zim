#!/usr/bin/env python
# this will take a C file as input
# compile it and will run it.

import os
import sys

if len(sys.argv) == 2:
  # stripping out extention from file
  # left will be only file name without extension
  filename = sys.argv[1].rstrip(".c")
  
  if not os.path.exists("filename"):
    os.system('gcc "%s" -o "%s"' %(sys.argv[1],filename))

  os.system('./"%s"' %filename)
