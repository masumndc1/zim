#!/usr/bin/python3

import os
from optparse import OptionParser

parser = OptionParser()
parser.add_option("-c", "--count", dest="con", type="int", default=10)
parser.add_option("-a", "--address", dest="addr", default='localhost')
(options, args) = parser.parse_args()

print("options: %s, args: %s" % (options, args))

def cmd():
  cmds = "ping -c {} -a {}".format(options.con, options.addr)
  os.system(cmds)

cmd()

#print("python3")
