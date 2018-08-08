#!/usr/bin/env bash

echo "Installing System Tools..."
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install -y curl > /dev/null 2>&1
sudo apt-get install -y unzip > /dev/null 2>&1
sudo apt-get install -y libc6-i386 lib32stdc++6 lib32gcc1 lib32ncurses5 > /dev/null 2>&1
sudo apt-get update > /dev/null 2>&1
sudo apt-get install -y java > /dev/null 2>&1
sudo apt-get install -y android-tools-adb > /dev/null 2>&1
# sudo apt-get install apt-file && apt-file update > /dev/null 2>&1
sudo apt-get install -y python-software-properties > /dev/null 2>&1
sudo apt-get install -y build-essential > /dev/null 2>&1
#sudo apt-get install -y dkms > /dev/null 2>&1


# http://askubuntu.com/questions/147400/problems-with-eclipse-and-android-sdk
#sudo apt-get install -y ia32-libs >/dev/null 2>&1

# Or, the following desktop...
#echo "Installing Ubuntu Gnome Desktop..."
#sudo apt-get install -y ubuntu-desktop > /dev/null 2>&1

# Or, the following desktop...
#echo "Installing Ubuntu xfce lightweight desktop..."
#sudo apt-get install -y xubuntu-desktop > /dev/null 2>&1

#or....
echo "Installing Ubuntu xfce..."
sudo apt-get install -y xfce4 xfce4-goodies > /dev/null 2>&1

# Install virtualbox additions
echo "Installing VBox additions..."
sudo apt-get install virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config


