# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "presie64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible.yml"
  end
end