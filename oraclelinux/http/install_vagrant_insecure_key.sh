#!/bin/bash
# 
# This snippet fetches the insecure ssh keypair to be included
# in the base box. Vagrant will automatically generate and insert 
# a new keypair and replace the default insecure key inside 
# the machine if it is detected.
#
# Setup some required variables
TARGET="/home/vagrant/.ssh"
URL="https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub"

# Create the target directory, on a fresh installation it wont exist
mkdir -p "${TARGET}"

# Retrieve the insecure public key from the internets
curl --insecure --location "${URL}" > "${TARGET}/authorized_keys"

# Ensure the permission are correct or ssh will not work
chown -R vagrant "${TARGET}"
chmod -R go-rwsx "${TARGET}"
