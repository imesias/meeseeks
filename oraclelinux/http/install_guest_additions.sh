#!/bin/bash
#
# This snippet installs VirtualBox guest additions inside
# the guest operating system. 
#

MNT=/mnt/vbox
ISO=/home/vagrant/VBoxGuestAdditions.iso

# Create the mount point 
mkdir "${MNT}"

# Mount the guest additions iso
mount -o loop "${ISO}" "${MNT}"

# Run the guest additions installer
sh "${MNT}/VBoxLinuxAdditions.run" --nox11

# Unmount the guest additions iso
umount "${MNT}"

# Remove the mount point
rmdir "${MNT}"

# Remove the iso
rm -f "${ISO}" 
