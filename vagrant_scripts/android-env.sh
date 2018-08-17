#!/usr/bin/env bash

pushd ~vagrant > /dev/null 2>&1


#grep android ~vagrant/.bashrc > /dev/null 2>&1
#if [ $? -ne 0 ]; then
#  echo 'export ANDROID_HOME=~vagrant/android-sdk-linux' >> ~vagrant/.bashrc
#  echo 'export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools' >> ~vagrant/.bashrc
#fi

#export ANDROID_HOME=~vagrant/android-sdk-linux
#export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

#which java > /dev/null 2>&1
#if [ $? -ne 0 ]; then
#  echo "Installing jdk..."
#  sudo apt-get update -qq > /dev/null 2>&1
#  sudo apt-get install -y -qq --force-yes openjdk-7-jdk > /dev/null 2>&1
#fi


#echo "Installing Java 8 oracle..."
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get install -y java-common oracle-java8-installer

#echo "Installing Android Studio..."
#sudo add-apt-repository ppa:maarten-fonville/android-studio
#sudo apt update
#sudo apt install -y android-studio

echo "==== Android ENV"
echo 'export ANDROID_HOME=/opt/android/sdk' >> ~vagrant/.bashrc
echo 'export ANDROID_AVD_HOME=/home/vagrant/.android/avd' >> ~vagrant/.bashrc
echo 'export ANDROID_SDK_ROOT=/opt/android/sdk' >> ~vagrant/.bashrc
mkdir -p /home/vagrant/.android/avd && touch /home/vagrant/.android/repositories.cfg
sudo chown -vR vagrant:vagrant /home/vagrant/.android > /dev/null 2>&1

echo "==== Installing Android SDK manager"
mkdir -p /opt/android/sdk
cd /opt/android/sdk
wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip > /dev/null 2>&1
unzip sdk-tools-linux-4333796.zip > /dev/null 2>&1
sudo chown -vR vagrant:vagrant /opt/android > /dev/null 2>&1

echo "==== Installing Android Studio"
sudo add-apt-repository ppa:maarten-fonville/android-studio > /dev/null 2>&1
sudo add-apt-repository ppa:webupd8team/java > /dev/null 2>&1
sudo apt-get update -y > /dev/null 2>&1
sudo apt-get install android-studio -y > /dev/null 2>&1

echo "==== Install Java8"
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer > /dev/null 2>&1

echo "=== Setup emulator"
#https://stackoverflow.com/questions/43275238/how-to-set-system-images-path-when-creating-an-android-avd
#https://stackoverflow.com/questions/38096225/automatically-accept-all-sdk-licences
#https://github.com/NativeScript/NativeScript/issues/5690
#https://stackoverflow.com/questions/39645178/panic-broken-avd-system-path-check-your-android-sdk-root-value
cd $ANDROID_HOME/tools/bin
yes | ./sdkmanager "system-images;android-24;google_apis;arm64-v8a" > /dev/null 2>&1
yes | ./sdkmanager --licenses > /dev/null 2>&1
echo no | ./avdmanager create avd -n test -k "system-images;android-24;google_apis;arm64-v8a" -f -p /home/vagrant/.android/avd > /dev/null 2>&1
./sdkmanager emulator > /dev/null 2>&1
./sdkmanager platform-tools > /dev/null 2>&1
./sdkmanager "platforms;android-24" > /dev/null 2>&1
./sdkmanager --update > /dev/null 2>&1
cd $ANDROID_HOME/tools
./emulator -avd test -no-skin -no-audio -no-window & > /dev/null 2>&1

