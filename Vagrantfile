# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.1.1"
Vagrant.configure("2") do |config|
	config.ssh.insert_key = false
	config.vm.box="ubuntu/xenial64"
	config.vm.box_check_update = false
	config.vm.provision :shell, path: "provisioner.sh"
	config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

	config.vm.define "master", primary: true do |master|
		master.vm.hostname = "master"
#		master.vm.network "forwarded_port", guest: 8080, host: 8080
		master.vm.network "private_network", ip: "192.168.122.10"
		master.vm.provider "virtualbox" do |v|
			v.name = "master"
		end
		master.vm.provision :shell, path: "master.sh"
	end

	config.vm.define "node" do |node|
		node.vm.hostname = "node"
		node.vm.network "private_network", ip: "192.168.122.11"
		node.vm.provider "virtualbox" do |v|
			v.name = "node"
		end
		node.vm.provision :shell, path: "nodes.sh"
	end

end
