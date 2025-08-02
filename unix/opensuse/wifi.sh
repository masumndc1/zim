#!/bin/bash

nmcli connection delete ESSID1
nmcli device wifi connect ESSID1 password <password>

#nmcli connection delete ESSID1
#nmcli device wifi connect ESSID2 password <password>
