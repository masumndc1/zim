#!/usr/bin/env python
# this is a simple python script to automate
# git pull, commit and push

import os
import sys
from blessings import Terminal

class GitOperation:
  global term
  term = Terminal()


  def __init__(self):
    if len(sys.argv) == 2: 
      self.msg = sys.argv[1]
      GitOperation.GitPullPush(self.msg)

    elif len(sys.argv) < 2: 
      print(term.red + "You want to pull updates from upstreams. Pulling update" + term.normal)
      os.system('git pull')


  @classmethod
  def GitPullPush(cls, msg):
    GitOperation.GitPrint('*')
    os.system('git pull')
    os.system ('git add .')
    print(term.blue + "Commiting with msg: " + "'" + msg + "'" + term.cyan)
    os.system('git commit -m "%s"' % msg) 
    print(term.green + "Pushing now to upstream " + term.cyan)
    os.system('git push origin master')
    GitOperation.GitPrint('-')


  @classmethod
  def GitPrint(cls, sym):
    cls.num = term.width
    print(term.red + sym * cls.num + term.normal)


GitOperation()
