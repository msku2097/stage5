echo "cloning webapp repo"
su - vagrant -c 'git clone https://github.com/msku2097/padrino-webapp.git'
su - vagrant -c 'sudo chown -R vagrant:vagrant padrino-webapp/'
echo "installing Padrino and Rake"

su - vagrant -c 'gem install padrino'
su - vagrant -c 'gem install rake'

echo "installing Firefox"
su - vagrant -c 'sudo apt-get install -y firefox'

#only for vagrant vm
echo "launching Padrino Webapp"
su - vagrant -c 'cd /padrino-webapp && nohup /bin/bash ./start.sh 0 <&- &> /dev/null &'

