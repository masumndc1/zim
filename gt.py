#!/usr/bin/env python

import os
import sys

class GitOperation:

  def __init__(self):
    if len(sys.argv) == 2: 
      self.msg = sys.argv[1]
      GitOperation.GitPullPush(self.msg)

    elif len(sys.argv) < 2: 
      print('\033[91m' + "You want to pull updates from upstreams. Pulling update" + '\033[0m')
      os.system('git pull')

  @classmethod
  def GitPullPush(cls, msg):
    GitOperation.GitPrint()
    os.system('git pull')
    os.system ('git add .')
    print('\033[91m' + "Commiting with msg: " + "'" + msg + "'" + '\033[0m')
    os.system('git commit -m "%s"' % msg) 
    print('\033[91m' + "Pushing now to upstream " + '\033[0m')
    os.system('git push origin master')
    GitOperation.GitPrint()

  @classmethod
  def GitPrint(cls):
    cls.num = 12
    #for i in range(cls.num):
    #  print("-" * i, end = '')
    #print("-" * cls.num, end = '')
    print("-" * cls.num)
    print("\n")

GitOperation()
