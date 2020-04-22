#!/usr/bin/env python

import os
import sys
from blessings import Terminal

class GitOperation:

  def __init__(self):
    if len(sys.argv) == 2: 
      self.msg = sys.argv[1]
      GitOperation.GitPullPush(self.msg)

    elif len(sys.argv) < 2: 
      term = Terminal()
      print(term.red + "You want to pull updates from upstreams. Pulling update" + term.normal)
      os.system('git pull')

  @classmethod
  def GitPullPush(cls, msg):
    term = Terminal()
    GitOperation.GitPrint()
    os.system('git pull')
    os.system ('git add .')
    print(term.blue + "Commiting with msg: " + "'" + msg + "'" + term.normal)
    os.system('git commit -m "%s"' % msg) 
    print(term.green + "Pushing now to upstream " + term.normal)
    os.system('git push origin master')
    GitOperation.GitPrint()

  @classmethod
  def GitPrint(cls):
    term = Terminal()
    cls.num = term.width
    #height = term.height
    #cls.num = width
    #  for i in range(cls.num):
    #  print("-" * i, end = '')
    #  print("-" * cls.num, end = '')
    print(term.cyan + "-" * cls.num)

GitOperation()
