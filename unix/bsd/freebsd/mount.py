#!/usr/bin/env python
# This is a python script which will mount a usb located
# at some point to mount point

"""
USB drive is not inserted: 
Please insert USB. 
Then run following.

sudo python ./mount.py
"""

import os
import subprocess
from blessings import Terminal

# custom variable
mnt_cmd = '/usr/local/sbin/mount.exfat-fuse'

def mountpoint(device='/dev/da0s1', mount_point='/mnt/usbmount'):

    if os.path.exists(device):
        print("Mounting a USB Drive")
        cmd = "sudo {} {} {}".format(mnt_cmd, device, mount_point)
        os.system(cmd)

    else:
        t = Terminal()
        print(t.blue + __doc__ + t.normal)

if __name__ == "__main__":
    mountpoint()
