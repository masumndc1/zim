#!/bin/sh
# this script will install pkgs in freebsd system
# with a i3 tiling window manager at the end.
# you need to uncomment xorg driver line either for
# vmware or virtualbox or baremetal

echo -e "Update pkg itself"
pkg update -f

echo -e "Installing some required pkgs\n"
pkg install -y vim sterm python3 python37 git ohmyzsh py37-ansible

#echo -e "\nInstalling X and dependencies for vmware\n"
#pkg install -y xorg xorg-drivers xf86-video-vmware

#echo -e "\nInstalling X and dependencies for virtual box\n"
#pkg install -y xorg xorg-drivers virtualbox-ose-additions

#echo -e "\nInstalling X and dependencies for baremetal\n"
#pkg install -y xorg xorg-drivers xf86-video-amdgpu xf86-video-ati xf86-video-intel xf86-video-vesa

echo -e "\nInstalling i3 tiling window manager\n"
pkg install -y i3 i3status i3lock dmenu

echo -e "\nConfiguring for i3\n"
echo -e "dbus_enable=\"YES\"" >> /etc/rc.conf
echo -e "hald_enable=\"YES\"" >> /etc/rc.conf
echo -e "exec /usr/local/bin/i3\n" > /home/masum/.xinitrc

echo -e "\nChanging sh to zsh as default shell\n"
chsh -s /usr/local/bin/zsh

echo -e "\nYou may now reboot your machine\n"
