#!/bin/bash

mkdir /Volumes/Storage/goinfre/$USER/vagrant
echo 'export VAGRANT_HOME=/Volumes/Storage/goinfre/$USER/vagrant' >> ~/.zshrc
rm Vagrantfile
vagrant init debian/stretch64
while ! [ -f ./Vagrantfile ];
do
	sleep 1;
done;
sed -i '' -e "s:\# \(config.vm.synced_folder\).*:\1 \".\", \"/git\":" Vagrantfile

vagrant up
vagrant plugin install vagrant-vbguest
vagrant vbguest
vagrant reload
vagrant ssh
