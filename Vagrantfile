# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "presie64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.network "forwarded_port", guest: 22, host: 2223

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provision/vagrant.yml"
    ansible.inventory_path = "provision/inventory"
  end
end
