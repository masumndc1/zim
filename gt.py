#!/usr/bin/env python3
# this is a simple python script to automate
# git pull, commit and push
# to github.

import os
import sys

class GitOperation():
  '''
  gt.py "commit msg" branch_name
  '''

  def __init__(self):
    if len(sys.argv) == 2:
      self.msg = sys.argv[1]
      GitOperation.GitPullPush(self.msg)

    elif len(sys.argv) < 2:
      print( "%20s" % "You want to pull updates from upstreams. Pulling update")
      print( "%20s" % "If you dont want to pull, then usage is:")
      print( "%20s" % "python3 gt.py \"commit msg\"")
      os.system('git pull --rebase')

  @classmethod
  def GitPullPush(cls, msg):
    print("20%s" % "Pulling before pushing")
    os.system('git pull --rebase')
    os.system ('git add .')
    print( "%20s" % "Commiting with msg: " + "'" + msg + "'")
    os.system('git commit -m "%s"' % msg)
    print( "Pushing now to upstream ")
    os.system('git push origin master')


if '__name__' == '__main__':
   if len(sys.argv) < 2:
       print(__doc__)
   GitOperation()
