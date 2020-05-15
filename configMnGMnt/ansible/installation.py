#!/usr/bin/python3


import os

commands = [ "apt update", 
            "apt install software-properties-common", 
            "apt-add-repository --yes --update ppa:ansible/ansible",
            "apt install -y ansible"
           ]

def ansible_install():
   for command in commands:
       os.system(command)

ansible_install()

print("Ansible installation done")
