#!/usr/bin/env python
# This is a python script which will mount a usb located
# at some point to mount point

import os

def mountpoint(device='/dev/da0s1', mount_point='/mnt/usbmount'):
    cmd = "mount.exfat-fuse {} {}".format(device, mount_point)
    os.system(cmd)

mountpoint()
