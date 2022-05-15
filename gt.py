#!/usr/bin/env python3
# this is a simple python script to automate
# git pull, commit and push to github.

import sys
import subprocess


class GitOperation():
  '''
  gt.py "commit_msg" branch_name
  '''

  def __init__(self, msg, branch):

     self.msg = sys.argv[1]
     self.branch = sys.argv[2]
     self._add_new_files()

  def _add_new_files(self):
     print("-"*70)
     subprocess.call("git add .",shell=True)
     self._commit()

  def _commit(self):
     print("+"*70)
     subprocess.call('git commit -m "%s"' % self.msg, shell=True)
     self._push()

  def _push(self):
     print("+"*70)
     subprocess.call('git push origin "%s"' % self.branch, shell=True)


if __name__ == "__main__":
   if len(sys.argv) == 3:
       GitOperation(sys.argv[1], sys.argv[2])
   else:
       print(GitOperation.__doc__)
