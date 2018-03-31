#!/bin/bash

VAGRANT_HOME="/Volumes/Storage/goinfre/$USER/vagrant"

if ! [[ -d "$VAGRANT_HOME" ]];
then 
	mkdir /Volumes/Storage/goinfre/$USER/vagrant
fi

grep -Fxq "export VAGRANT_HOME=$VAGRANT_HOME" ~/.zshrc > /dev/null || echo "export VAGRANT_HOME=$VAGRANT_HOME" >> ~/.zshrc

rm -f Vagrantfile
vagrant init debian/stretch64

while ! [[ -f ./Vagrantfile ]];
do
	sleep 1;
done;

sed -i '' -e "s:\# \(config.vm.synced_folder\).*:\1 \".\", \"/git\":" Vagrantfile

vagrant up
vagrant plugin install vagrant-vbguest
vagrant vbguest
vagrant reload
vagrant ssh
