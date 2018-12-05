# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.define "node4", primary:false do |node4|
		config.vm.box = "ipetruniv/node7"
		config.vm.box_version = "1.0"
                #node4.vm.box = "node"
		node4.vm.communicator = "winrm"
		#node4.vm.vm.guest = :windows
		node4.vm.hostname = 'node4'
		node4.vm.network "forwarded_port", guest: 3389, host: 43389
		node4.vm.provider "virtualbox" do |vb|
			vb.customize ['modifyvm', :id, '--nictype1', '82540EM']
			vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
			vb.name = "node4"
			vb.gui = false
			vb.memory = "2048"
		end
    	end
 
  end
