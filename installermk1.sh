#!/bin/bash
#switch to root
#sudo su
#./customization.sh
echo "script needs to be run as root"
apt-get update
apt-get upgrade -y
#install net tools
apt-get install net-tools -y
#install ocs-url
apt install libqt5svg5 qml-module-qtquick-controls
sudo dpkg -i /path/to/ocs-url*.deb
#install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y
#install wireguard
sudo apt install wireguard -y
#install atom
apt update
apt install software-properties-common apt-transport-https wget -y
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -o- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
apt-get update
apt-get install atom -y
sudo apt update
sudo apt install software-properties-common apt-transport-https wget -y
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main"
sudo apt install atom -y
#install vlc
apt install vlc -y
apt install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y
#install time shift
apt install timeshift -y
#install tweaks
apt install ubuntu-restricted-extras -y
apt install chrome-gnome-shell gnome-shell-extension-prefs -y
apt install gnome-tweaks -y
echo "install complete"
rm customization.sh.save
rm ./*key*
rm ./*chrome*
