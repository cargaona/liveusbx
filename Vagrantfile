VAGRANT_BOX = 'generic/ubuntu2004'
VM_NAME = 'ubuntu-i3wm'
VM_USER = 'char'
MAC_USER = 'cargaona'
HOST_PATH = '/Users/$MAC_USER/$VM_NAME'
# Where to sync to on Guest — 'vagrant' is the default user name
GUEST_PATH = '/home/$VM_USER/$VM_NAME'
# # VM Port — uncomment this to use NAT instead of DHCP
# VM_PORT = 8080
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
  #DHCP — comment this out if planning on using NAT instead
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y xinit
    apt-get install -y i3	
    apt-get install -y git
    apt-get install -y build-essential
  SHELL
end
