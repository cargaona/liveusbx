VAGRANT_BOX = 'generic/ubuntu2004'
VM_NAME = 'ubuntu-i3wm'
VM_USER = 'char'
HOST_USER = 'char'
# Where to sync to on Guest — 'vagrant' is the default user name
GUEST_PATH = '/home/$VM_USER/$VM_NAME'
Vagrant.configure(2) do |config|
  # Vagrant box from Hashicorp
  config.vm.box = VAGRANT_BOX
  
  # Actual machine name
  config.vm.hostname = VM_NAME
  # Set VM name in Virtualbox
  config.vm.provider "virtualbox" do |v|
    v.name = VM_NAME
    v.memory = 2048
  end
  
  config.vm.synced_folder "tmp/", "/tmp", create: true, disabled: false
  config.vm.provision "shell", inline: <<-SHELL
    useradd -d /home/char/ -m -G sudo char
    apt-get update
    apt-get install -y mkisofs
    apt-get install -y xinit
    apt-get install -y konsole
    apt-get install -y i3	
    apt-get install -y git
    apt-get install -y build-essential
  SHELL
  config.vm.provision "file", source: "~/.ssh/cg-etermax", destination: "~/.ssh/cg-etermax"
  config.vm.provision "file", source: "./linux-live-config", destination: "~/config"
  config.vm.provision "file", source: "~/.config/i3/config", destination: "~/.config/i3/config"
 end 
 
