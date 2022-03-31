#!/usr/bin/env python3

"""
Python must be installed before hand.
Run OS command to install python first.
for Freebsd run (pkg install python36) first
for Ubuntu16  run: sudo apt install python
for Centos7   run: sudo rpm install python
for Freebsd12 run: sudo pkg install python
"""

import platform
import subprocess

def check_os():
    supported_os=['freebsd','dragonfly','openbsd','debian',
                  'ubuntu','centos','rockylinux'
                ]

    if platform.node() not in supported_os:
        print("we dont support this OS")
        exit()
    else:
        print("we support this OS")

def os_pkg():
    # first determine ansible package, pre_command and distro.
    if 'freebsd' in platform.system():
       return 'freebsd', 'pkg'
    elif 'dragonfly' in platform.system():
       return 'dragonfly', 'pkg'
    elif 'openbsd' in platform.system():
       return 'openbsd', 'pkg_add'
    elif 'ubuntu' in platform.node():
       return 'ubuntu', 'apt'
    elif 'debian' in platform.node():
       return 'debian', 'apt'
    elif 'centos' in platform.node():
       return 'centos', 'yum'
    else:
       return 'rockylinux', 'yum'


def commands(distro, os_package_mgr, ansible_package):

    if distro == 'ubuntu':
         command = [ "%s update -y" % os_package_mgr,
            "%s install -y software-properties-common" % os_package_mgr,
            "apt-add-repository --yes --update ppa:ansible/ansible",
            "%s install -y %s" % (os_package_mgr, ansible_package)
           ]
         return command

    if distro == 'debian':
         command = [ "apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367",
          "%s update -y" % os_package_mgr,
          "%s install -y %s" % (os_package_mgr, ansible_package)
           ]
         return command

    elif distro == 'centos' or distro == 'rockylinux':
         command = [ "%s install -y epel-release" % os_package_mgr,
                   "%s -y update" % os_package_mgr,
                   "%s install -y %s" % (os_package_mgr, ansible_package)
           ]
         return command

    elif distro == 'freebsd' or distro == 'dragonfly':
         command = ["%s update -f -q" % os_package_mgr,
                 "%s install -y %s" % (os_package_mgr, ansible_package)
                ]
         return command

    else:
         command = [ "%s -y %s" % (os_package_mgr, ansible_package)
                ]
         return command


def main():
    ansible_package = 'ansible' if 'Linux' in platform.system() else 'py37-ansible'
    distro, os_package_mgr=os_pkg()
    comm=commands(distro, os_package_mgr, ansible_package)
    for com in comm:
       subprocess.run(com,shell=True)
    print("Ansible installation failed")


if __name__ == '__main__':
    check_os()
    main()

