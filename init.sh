#!/usr/bin/env sh

cp /vagrant/provision/centos68/*.sh .
chmod u+x *.sh
echo Launch with 'vagrant ssh'.
echo Then install   Asterisk: 'sudo ./install-asterisk.sh'.
echo Then configure Asterisk: 'sudo ./configure-asterisk.sh'.
echo Then start     Asterisk: 'sudo asterisk -cvvv'.
