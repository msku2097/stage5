Vagrant.configure(2) do |config|
  config.vm.box = "puphpet/ubuntu1404-x64"

  config.ssh.forward_agent = true

  config.vm.provider "virtualbox" do |vb|
  #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
      vb.gui = true
      vb.cpus = 1
  end

  config.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

  config.vm.provision :shell, :path => "vagrant_scripts/bootstrap.sh"
  config.vm.provision :shell, :path => "vagrant_scripts/install-rvm.sh"
  config.vm.provision :shell, :path => "vagrant_scripts/desktop-env.sh"
  config.vm.provision :shell, :path => "vagrant_scripts/padrino.sh"
  config.vm.provision :shell, :path => "vagrant_scripts/android-env.sh", env: {"ANDROID_HOME" => "/opt/android/sdk", "ANDROID_AVD_HOME" => "/home/vagrant/.android/avd/", "ANDROID_SDK_ROOT" => "/opt/android/sdk"}
  config.vm.provision :shell, :path => "vagrant_scripts/appium-env.sh"
end
