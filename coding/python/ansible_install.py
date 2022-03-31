#!/usr/bin/env python

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

def os_pkg():
    # first determine ansible package, pre_command and distro.
    if 'FreeBSD' in platform.system():
       return 'FreeBSD', 'pkg'
    elif 'DragonFly' in platform.system():
       return 'FreeBSD', 'pkg'
    elif 'OpenBSD' in platform.system():
       return 'OpenBSD', 'pkg_add'
    elif 'Ubuntu' in platform.system():
       return 'Ubuntu', 'apt'
    elif 'Debian' in platform.system():
       return 'Debian', 'apt'
    elif 'CentOS' in platform.system():
       return 'CentOS', 'yum'
    else:
       return 'Rockylinux', 'yum'


def commands(distro, os_package_mgr, ansible_package):

    if distro == 'Ubuntu' or distro == 'debian':
         command = [ "%s update -y" % os_package_mgr,
            "%s install -y software-properties-common" % os_package_mgr,
            "apt-add-repository --yes --update ppa:ansible/ansible",
            "%s install -y %s" % (os_package_mgr, ansible_package)
           ]
         return command

    elif distro == 'CentOS' or distro == 'Rockylinux':
         command = [ "%s install -y epel-release" % os_package_mgr,
                   "%s -y update" % os_package_mgr,
                   "%s install -y %s" % (os_package_mgr, ansible_package)
           ]
         return command

    elif distro == 'FreeBSD' or distro == 'DragonFly':
         command = ["%s update -f -q" % os_package_mgr,
                 "%s install -y %s" % (os_package_mgr, ansible_package)
                ]
         return command

    else:
         command = [ "%s -y %s" % (os_package_mgr, ansible_package)
                ]
         return command


def main():
    ansible_package = 'ansible' if 'linux' in platform.system() else 'py37-ansible'
    distro, os_package_mgr=os_pkg()
    comm=commands(distro, os_package_mgr, ansible_package)
    retcode=subprocess.call(comm)
    if not retcode:
       print("Ansible installation done")
    else:
       print("Ansible installation failed")


if "__name__" == "__main__":
    main()

