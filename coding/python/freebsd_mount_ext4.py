#!/usr/bin/env python
# This is a python script which will mount a usb located
# at some point to mount point

"""
sudo python ./mount_ext4.py /dev/ada0p2 /mnt/ext4
"""

import os
import sys

def mountpoint(device=None, mount_point= None):

    if not len(sys.argv) > 1:
        print(__doc__)

    else:
        print("Mounting ext4 partition")
        device = sys.argv[1]
        mount_point = sys.argv[2]
        cmd = "sudo mount -t ext2fs -o rw {} {}".format(device,mount_point)
        os.system(cmd)

if __name__ == "__main__":
    mountpoint()
