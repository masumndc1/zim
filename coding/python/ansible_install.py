#!/usr/bin/env python

"""
Python must be installed before hand. 
Run OS command to install python first.
for Freebsd run (pkg install python36) first
for Ubuntu16  run: sudo apt install python
for Centos7   run: sudo rpm install python
for Freebsd12 run: sudo pkg install python
"""

import os
import platform

ansible_package = "ansible"

    # first determine ansible package, pre_command and distro.
    if ('FreeBSD','DragonFly') in platform.system():
        ansible_package = "py37-ansible"
        os_package_manager = "pkg"

    elif 'OpenBSD' in platform.system():
        os_package_manager = "pkg_add"

    elif 'Linux' in platform.system():
        if 'Ubuntu' in platform.dist():
           os_package_manager = "apt"

        elif ('centos','rockylinux') in platform.dist():
           os_package_manager = "yum"

    else:
        raise("We only support Unix Family")

command = command(distro, os_package_manager, ansible_package)

def command(distro=None, os_package_manager, ansible_package):
    
    if distro == 'Ubuntu' or distro == 'debian':
       command = [ "%s update" % os_package_manager,
            "%s install -y software-properties-common" % os_package_manager,
            "apt-add-repository --yes --update ppa:ansible/ansible",
            "'%s install -y %s', % (os_package_manager, ansible_package) 
           ]
    
    if distro == 'CentOS' or distro == 'Rockylinux':
       command = [ "%s install -y epel-release" % os_package_manager,
                          "%s -y update" % os_package_manager,
                          "yum install -y %s" % ansible_package
                 ]

    return command


    # determine pre ansible commands

# Ubuntu 
    if 'Linux' in platform.system():
      if 'Ubuntu' in platform.dist():
          distro = 'Ubuntu'


    for command in ubuntu_commands:
          os.system(command)

# CentOS
      elif 'centos' in platform.dist():
          distro = "CentOS"
          commands = [ "yum install -y epel-release",
                          "yum -y update",
                          "yum install -y ansible" 
                        ]


# FreeBSD
    elif 'FreeBSD' in platform.system():
        distro = 'FreeBSD'
        
      freebsd_commands = ["pkg update -f -q",
                         "pkg install -y py37-ansible"
                        ]
      
      
# DragonFly
    elif 'DragonFly' in platform.system():
        distro = 'DragonFly'
        command = [ "pkg install -y py37-ansible"
                         ]
      
      for command in dragonfly_commands:
         os.system(command)

# OpenBSD
    elif 'OpenBSD' in platform.system():
      openbsd_commands = [ "pkg_add ansible"
                       ]
      
      for command in openbsd_commands:
         os.system(command)


if "__name__" == "__main__":
    def run_command(command):
        for commands in command:
          os.system(commands)

print("Ansible installation done")

