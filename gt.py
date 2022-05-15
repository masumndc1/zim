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
     retcode=subprocess.call("git add .",shell=True)
     self._commit() if not retcode else sys.exit("could not add files")

  def _commit(self):
     retcode=subprocess.call('git commit -m "%s"' % self.msg, shell=True)
     print("-"*70)
     self._push() if not retcode else sys.exit("could not commit")

  def _push(self):
     retcode=subprocess.call('git push origin "%s"' % self.branch, shell=True)
     print("-"*70)
     print(f"Pushed to {self.branch} branch") if not retcode else sys.exit("could not push")


if __name__ == "__main__":
   if len(sys.argv) == 3:
       GitOperation(sys.argv[1], sys.argv[2])
   else:
       print(GitOperation.__doc__)
