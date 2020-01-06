# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false  
  end
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "ubuntu/xenial64"
  config.vm.box_url = "https://app.vagrantup.com/ubuntu/boxes/xenial64"
  
  # share a directory on the host OS with Vagrant machine: C:\dev\hyperledger
  config.vm.synced_folder "../..", "/home/vagrant/dev"  
  
  config.disksize.size = '30GB'

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080
    
  #postgres
  config.vm.network "forwarded_port", guest: 5444, host: 5444
  
  # We choose to forward standard HTTP port
  config.vm.network :forwarded_port, guest: 8080, host: 8080	
  
  #Some ports for the Operations Service
  config.vm.network :forwarded_port, guest: 8443, host: 8443
  config.vm.network :forwarded_port, guest: 9443, host: 9443
  config.vm.network :forwarded_port, guest: 9444, host: 9444
  config.vm.network :forwarded_port, guest: 9445, host: 9445
  config.vm.network :forwarded_port, guest: 9446, host: 9446
  config.vm.network :forwarded_port, guest: 9447, host: 9447  
  
  # Some ports for couchDB containers
  config.vm.network :forwarded_port, guest: 5984, host: 5984
  config.vm.network :forwarded_port, guest: 6984, host: 6984
  config.vm.network :forwarded_port, guest: 7984, host: 7984
  config.vm.network :forwarded_port, guest: 8984, host: 8984  

  # For hyperledger Composer web servers(REST server and Angular application)
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  config.vm.network :forwarded_port, guest: 4200, host: 4200

  #For Hyperledger Fabric docker containers
  config.vm.network :forwarded_port, guest: 7050, host: 7050 # fabric orderer service
  config.vm.network :forwarded_port, guest: 7051, host: 7051 # fabric peer vp0 service
  config.vm.network :forwarded_port, guest: 7053, host: 7053 # fabric peer event service
  config.vm.network :forwarded_port, guest: 7054, host: 7054 # fabric-ca service
  config.vm.network :forwarded_port, guest: 5984, host: 15984 # CouchDB service
  config.vm.network :forwarded_port, guest: 8051, host: 8051  
  config.vm.network :forwarded_port, guest: 7059, host: 7059  
  config.vm.network :forwarded_port, guest: 8058, host: 8058  
  ### Below are probably missing.....
  config.vm.network :forwarded_port, guest: 7056, host: 7056
  config.vm.network :forwarded_port, guest: 7058, host: 7058
  config.vm.network :forwarded_port, guest: 8051, host: 8051
  config.vm.network :forwarded_port, guest: 8053, host: 8053
  config.vm.network :forwarded_port, guest: 8054, host: 8054
  config.vm.network :forwarded_port, guest: 8056, host: 8056
  config.vm.network :forwarded_port, guest: 8051, host: 8051  
  #config.vm.network :forwarded_port, guest: 8058, host: 8058
  

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "15000"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
	export HOME="/home/vagrant"
	cd $HOME
	
	###################################################" GIT
	apt-get install git --yes
	
	#################################################### Docker
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	groupadd docker
	usermod -aG docker vagrant
	systemctl enable docker	
    
	##################################################### Docker compose	(>=1.14.0)
	curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	
	####################################################### GO(>=1.11.x) ################################################################
	curl -O https://storage.googleapis.com/golang/go1.11.2.linux-amd64.tar.gz
	tar -C /usr/local -xzf go1.11.2.linux-amd64.tar.gz
    
	# Ajouter les binaires de GO au PATH
    echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
    echo 'export PATH=${PATH}:/usr/local/go/bin:$GOPATH/bin' >> $HOME/.bashrc
	
	####################################################### Python 2.7 #######################################
    apt-get install python --yes
	
	# ################################### Projets d'exemples, binaires et images docker de Fabric
	# export HOME="/home/vagrant"	
	# export FABRIC_HOME="$HOME/app/hyperledger/fabric-home"
	# mkdir -p $FABRIC_HOME && cd $FABRIC_HOME
    # curl -sSL http://bit.ly/2ysbOFE | sudo bash
	# echo 'export FABRIC_HOME=$HOME/app/hyperledger/fabric-home' >> $HOME/.bashrc	
	# echo 'export PATH=${PATH}:${FABRIC_HOME}/fabric-samples/bin' >> $HOME/.bashrc
	
	# jq is a lightweight and flexible command-line JSON processor.
	apt-get install jq --yes		
	# tree command to print the directories structures, très utile pour voir le contenu des données de cryptographie générées pour le MSP
	apt-get install tree --yes
	
	############################### clean installation files ################################################
	rm -rf $HOME/get-docker.sh  $HOME/go1.11.2.linux-amd64.tar.gz
	
  SHELL
  
# Install Fabric CA and NVM without privileged mode
config.vm.provision "shell", privileged: false, inline: <<-SHELL
	################################### Projets d'exemples, binaires et images docker de Fabric
	export HOME="/home/vagrant"	
	export FABRIC_HOME="$HOME/app/hyperledger/fabric-home"
	mkdir -p $FABRIC_HOME && cd $FABRIC_HOME
    curl -sSL http://bit.ly/2ysbOFE | sudo bash -s 1.3.0 1.3.0
	echo 'export FABRIC_HOME=$HOME/app/hyperledger/fabric-home' >> $HOME/.bashrc	
	echo 'export PATH=${PATH}:${FABRIC_HOME}/fabric-samples/bin' >> $HOME/.bashrc
	export HOME="/home/vagrant"
	cd $HOME	
    ###################### NVM and Node.js(=8.x)  #################################
	export NVM_DIR=$HOME/.nvm
	export PROFILE=$HOME/.bashrc
	mkdir $NVM_DIR
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
     [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
     [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install 8.9.1
	nvm use 8.9.1
	#g++: utilisé dans les applications Node.js
    sudo apt-get install g++ --yes	
	###################### Fabric CA ###########################################
	#libtool and libtdhl-dev packages
	sudo apt install --yes libtool libltdl-dev
	# The following installs both the fabric-ca-server and fabric-ca-client binaries in $GOPATH/bin.
    go get -d github.com/hyperledger/fabric-ca/...
	cd $GOPATH/src/github.com/hyperledger/fabric-ca
	git checkout release-1.3
    go install github.com/hyperledger/fabric-ca/cmd/...	
    ############################################  Java 8
    sudo add-apt-repository ppa:openjdk-r/ppa
    sudo apt-get update
    sudo apt-get install openjdk-8-jdk -y
	############################ Account for enterprisedb #################################
    #Generating a hashed password:
    password="postgres"
    pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
    sudo useradd -m -p $pass -s /bin/bash enterprisedb
    sudo usermod -aG sudo,adm enterprisedb
    sudo apt-get install selinux-utils -y	
	############################################### normalize the permissions of the files ####################################
	sudo chown -R vagrant:vagrant $HOME
	
 SHELL
 
end


