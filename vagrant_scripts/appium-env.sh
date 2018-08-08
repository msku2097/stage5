 #!/usr/bin/env bash
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs
sudo apt-get install -y npm
npm install -g appium
#su - vagrant -c 'curl -sSL https://rvm.io/mpapis.asc | gpg --import -'

