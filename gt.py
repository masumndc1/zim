#!/usr/bin/env python

import os
import sys

def git_operation(msg):
  print("-"*70)
  os.system('git pull')
  os.system ('git add .')
  print("Commiting with msg: " + "'" + msg + "'" )
  os.system('git commit -m "%s"' % msg) 
  print("Pushing now to upstream ")
  os.system('git push origin master')
  print("-"*70)

git_operation(sys.argv[1])
