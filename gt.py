#!/usr/bin/env python3
# this is a simple python script to automate
# git pull, commit and push to github.

import shutil
import sys
import subprocess


class GitOperation():
    '''
    gt.py "commit_msg" branch_name
    '''

    def __init__(self, msg, branch):
        self.msg = msg
        self.branch = branch
        self._add_new_files()

    def _term_size(self):
        c, _ = shutil.get_terminal_size()
        return c

    def _add_new_files(self):
        print("-" * self._term_size())
        retcode = subprocess.call("git add .", shell=True)
        self._commit() if not retcode else sys.exit("could not add files")

    def _commit(self):
        retcode = subprocess.call(
            'git commit -m "%s"' % self.msg, shell=True)
        self._push() if not retcode else sys.exit("could not commit")

    def _push(self):
        retcode = subprocess.call(
            'git push origin "%s"' % self.branch, shell=True)
        print(f"Pushed to {self.branch} branch") if not retcode else sys.exit(
            "could not push")
        print("-" * self._term_size())


if __name__ == "__main__":
    if len(sys.argv) == 3:
        msg = sys.argv[1]
        branch = sys.argv[2]
        GitOperation(msg, branch)
    else:
        print(GitOperation.__doc__)
