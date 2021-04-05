VAGRANT_BOX = 'peru/ubuntu-20.04-server-amd64'

VM_NAME = 'ubuntu-i3wm'
VM_USER = 'char'
VM_HOME = "/home/$VM_USER"

Vagrant.configure(2) do |config|
  config.vm.box = VAGRANT_BOX
  config.vm.hostname = VM_NAME

  config.vm.provider "virtualbox" do |v|
    v.name = VM_NAME
    v.memory = 2048
  end
  
  ## Configuration file for live usb cration.
  config.vm.provision "file", source: "./linux-live-config", destination: "~/config"

  ## Mostly dot files with customizations and keys.
  config.vm.provision "file", source: "~/.ssh/cg-etermax", destination: "~/files/.ssh/cg-etermax"
  config.vm.provision "file", source: "~/.ssh/cg-ml", destination: "~/files/.ssh/cg-ml"
  config.vm.provision "file", source: "~/.config/i3/config", destination: "~/files/.config/i3/config"
  config.vm.provision "file", source: "~/.zshrc", destination: "~/files/.zshrc"
  config.vm.provision "file", source: "~/.config/nvim/init.vim", destination: "~/files/.config/nvim/init.vim"

  ## All the Ansible files are shared to the guest machine. 
  config.vm.synced_folder "./ansible", "/home/vagrant/ansible/", disabled: false
  
  ## For some reason ansible_local perfoms a "cd /vagrant" before applying the playbooks and the folder does not exist. 
  config.vm.provision "shell", inline: <<-SHELL\
    mkdir -p /vagrant
  SHELL

  config.vm.provision "ansible_local" do |ansible|
    ansible.playbook = "/home/vagrant/ansible/playbook.yml"
    ansible.become = true
    ansible.install_mode = "pip"
    ansible.galaxy_role_file = "/home/vagrant/ansible/requirements.yml"
    ansible.galaxy_roles_path = "/etc/ansible/roles"
    # ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles_path=%{roles_path} --force"
    ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --force"
  end

  ## Expose /tmp folder to the host in order to have visibility to the live usb files to burn into the usb device.
  config.vm.synced_folder "tmp/", "/tmp", create: true, disabled: false

 end 
 
