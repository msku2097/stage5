 #!/usr/bin/env bash
su - vagrant -c 'curl -sSL https://rvm.io/mpapis.asc | gpg --import -'
su - vagrant -c 'curl -sSL https://get.rvm.io | bash -s stable --ruby'
su - vagrant -c 'rvm rvmrc warning ignore allGemfiles'

su - vagrant -c 'gem install bundler'
su - vagrant -c 'gem install pry'
su - vagrant -c '(cd /vagrant &&  bundle install)'
su - vagrant -c 'git clone https://github.com/msku2097/stage1-can.git'
su - vagrant -c 'gem install ruby_can'

