#!/usr/bin/env bash

# -- SETTING UP MIRRORS -- #
cp ./mirrorlist /etc/pacman.d/mirrorlist
pacman -Syyy

# -- CREATING FILESYSTEMS -- #
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/nvme0n1p2
mkfs.ext4 /dev/sda1

# -- MOUNTING FILESYSTEMS -- #
mount /dev/nvme0n1p1 /mnt
mkdir /mnt/home
mount /dev/sda1 /mnt/home

# -- INSTALL SYSTEM -- #
pacstrap -i /mnt base
genfstab -U -p /mnt >> /mnt/etc/fstab

# -- COPY FILES TO NEW SYSTEM -- #
cp ./setup.sh /mnt
chmod +x /mnt/setup.sh
cp ./hostsfile /mnt/etc/hosts
cp ./eno1.network /mnt/eno1.network
arch-chroot /mnt