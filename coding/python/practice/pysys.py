#!/usr/bin/env python

import subprocess

uname = "uname"
uname_arg = "-a"

print("gathering system information with %s command:\n" % uname)
subprocess.call([uname, uname_arg])

diskspace = "df"
diskspace_arg = "-h"
print("\ngathering system information with {} command:\n".format(diskspace))
subprocess.call([diskspace, diskspace_arg])


