# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 2.1.1"
Vagrant.configure("2") do |config|
	config.ssh.insert_key = false
	config.vm.box_check_update = false
#	config.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true

	config.vm.define "master", primary: true do |master|
		master.vm.box = "kubernetes-master"
		master.vm.hostname = "master"
#		master.vm.network "forwarded_port", guest: 7918, host: 7918
		master.vm.network "forwarded_port", guest: 8080, host: 8080
#		master.vm.network "forwarded_port", guest: 8443, host: 8443
		master.vm.network "private_network", ip: "192.168.122.10"
		master.vm.provider "virtualbox" do |v|
			v.name = "kubernetes-master"
		end
#		master.vm.provision :shell, inline: "kubectl proxy", run: 'always'
		master.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
	end

	(1..1).each do |i|
		config.vm.define "node#{i}" do |node|
			node.vm.box = "kubernetes-node"
			node.vm.hostname = "node#{i}"
			node.vm.network "private_network", ip: "192.168.122.1#{i}"
			node.vm.provider "virtualbox" do |v|
				v.name = "kubernetes-node#{i}"
			end
			node.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
		end
	end

end
