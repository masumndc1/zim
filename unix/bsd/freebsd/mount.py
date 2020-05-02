#!/usr/bin/env python
# This is a python script which will mount a usb located
# at some point to mount point

import os
import subprocess

def __doc__():
    """usages: sudo ./mount.py"""

def mountpoint(device='/dev/da0s1', mount_point='/mnt/usbmount'):
    
    if os.path.exists(device):
        print("Mounting a USB Drive")
        cmd = "mount.exfat-fuse {} {}".format(device, mount_point)
        res = os.system(cmd)
        
        if res:
           #__doc__()
           print("You need to be root")

    else:
        print("USB drive is not inserted: Please insert USB")

if __name__ == "__main__":
    mountpoint()
