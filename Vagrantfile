# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # https://vagrantcloud.com/ubuntu
  config.vm.box = "ubuntu/xenial64"

  config.vm.network "private_network", type: "dhcp"

  # Forward ports
  config.vm.network "forwarded_port", guest: 8000, host: 8081 # web server
  config.vm.network "forwarded_port", guest: 8080, host: 8082 # web server

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  config.ssh.insert_key = true
  # If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true

  # Share additional folders to the guest VM.
  # config.vm.synced_folder "platform", "/home/vagrant/scripts"

  # Bash provision script
  config.vm.provision "shell", path: "setup.sh"

  config.vm.provision "ansible" do |ansible|
        ansible.playbook = "vagrant.yml"
        ansible.verbose = "true"
        ansible.ask_sudo_pass = false
        ansible.host_key_checking = false
        ansible.tags = "orb,common"
    end

end