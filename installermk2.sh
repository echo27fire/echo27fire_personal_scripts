#!/bin/bash
echo "script needs to be run as root"

#initial update
apt update || apt upgrade

#vars

DATE=$(date +%m%y%d)

#prep

1>install.log 2>1

{
cd
mkdir install.sh.$DATE
}

echo "--------------------------------------------------------------------"
echo "this script is about to install several repos and programs on your system"
echo "confim you fully acknowledge the actions that are about to be preformed"


while true; do
    read -p "Do you wish to install this program?" yn
    case $yn in
        [Yy]* ) echo "starting software install process"

        # wgets
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -o- | sudo apt-key add -
#wget -q https://packagecloud.io/AtomEditor/atom/gpgkey -O- | sudo apt-key add -


#repos
add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" -y
sudo add-apt-repository "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" -y

#installs
apt-get install net-tools -y
apt install libqt5svg5 qml-module-qtquick-controls
dpkg -i /path/to/ocs-url*.deb
apt install ./google-chrome-stable_current_amd64.deb -y
apt install wireguard -y
apt install software-properties-common apt-transport-https wget -y
apt install atom -y
apt install vlc -y
apt install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y
apt install timeshift -y
apt install ubuntu-restricted-extras -y
apt install chrome-gnome-shell gnome-shell-extension-prefs -y
apt install gnome-tweaks -y
echo "---------------------------------------------------"
echo "***************************************************"
echo "---------------------------------------------------"
echo "install complete"
echo "install complete"
echo "install complete"
echo "install complete"
echo "install complete"
echo "install complete"
echo "install complete"
echo "install complete"
#rm customization.sh.save
rm ./*key*
rm ./*chrome*
echo "---------------------------------------------------"
echo "***************************************************"
echo "---------------------------------------------------"
exit

        ;; #this ends the yes section and program start
        [Nn]* ) echo "process stoped, exiting";exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
