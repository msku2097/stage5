#!/usr/bin/env bash

echo "==== Install nvm"
su - vagrant -c 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash' > /dev/null 2>&1
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile
echo "==== Install node"
nvm install node > /dev/null 2>&1
echo "==== Build essential and g++"
sudo apt-get install -y build-essential > /dev/null 2>&1
sudo apt-get install -y g++ > /dev/null 2>&1
echo "==== Install appium"
sudo chown -R vagrant /home/vagrant/.nvm/
su - vagrant -c 'npm install -g appium' > /dev/null 2>&1