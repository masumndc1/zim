#!/usr/bin/env python
# This is a python script which will mount a usb located
# at some point to mount point

import os

def mountpoint(device='/dev/da0s1', mount_point='/mnt/usbmount'):
    print("Mounting a USB Drive")
    cmd = "mount.exfat-fuse {} {}".format(device, mount_point)
    os.system(cmd)

if __name__ == "__main__":
    mountpoint()
