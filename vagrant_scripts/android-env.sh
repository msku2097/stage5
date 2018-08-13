#!/usr/bin/env bash

pushd ~vagrant > /dev/null 2>&1


#grep android ~vagrant/.bashrc > /dev/null 2>&1
#if [ $? -ne 0 ]; then
#  echo 'export ANDROID_HOME=~vagrant/android-sdk-linux' >> ~vagrant/.bashrc
#  echo 'export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools' >> ~vagrant/.bashrc
#fi

#export ANDROID_HOME=~vagrant/android-sdk-linux
#export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

which java > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Installing jdk..."
  sudo apt-get update -qq > /dev/null 2>&1
  sudo apt-get install -y -qq --force-yes openjdk-7-jdk > /dev/null 2>&1
fi


echo "Installing Java 8 oracle..."
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install -y java-common oracle-java8-installer

echo "Installing Android Studio..."
sudo add-apt-repository ppa:maarten-fonville/android-studio
sudo apt update
sudo apt install -y android-studio

