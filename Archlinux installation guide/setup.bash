#!/usr/bin/env bash

# -- INSTALL PACKAGES -- #
pacman -Sy base-devel linux linux-headers linux-firmware grub efibootmgr dosfstools openssh os-prober mtools ntfs-3g nano tmux git --needed

# -- SETTING UP LOCALES -- #
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
hwclock --systohc --utc
echo "Workstation" > /etc/hostname

# -- SETTING UP GRUB -- #
mkdir /boot/EFI
mount /dev/nvme0n1p1 /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=archlinux --recheck
mkdir -p /boot/grub/locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg

# -- CREATE SWAPFILE -- #
fallocate -l 8G /swapfile && chmod 600 /swapfile && mkswap /swapfile && echo "/swapfile none swap sw 0 0" >> /etc/fstab

# -- INSTALL GRAPHICS DRIVERS -- #
pacman -Sy xorg-server libgl nvidia nvidia-libgl opencl-nvidia nvidia-settings mesa mesa-demos --needed

# -- ENABLE SSH WITH STATIC IP -- #
mv eno1.network /etc/systemd/network/eno1.network
systemctl enable systemd-networkd.service
systemctl enable sshd

# -- ADD A USER -- #
useradd -m -g users -G wheel jim
sed -i 's/# %wheel\ ALL=(ALL)\ ALL/%wheel\ ALL=(ALL)\ ALL/' /etc/sudoers

# -- SET UP KDE PLASMA -- #
pacman -Sy sddm plasma konsole dolphin firefox filelight kcalc vlc gwenview ark ffmpegthumbs kdegraphics-thumbnailers qt5-imageformats kimageformats taglib libappimage raw-thumbnailer
systemctl enable sddm

# -- SET UP GNOME -- #
# pacman -Sy gdm gnome gnome-terminal firefox nautilus gnome-tweaks gnome-control-center gnome-backgrounds adwaita-icon-theme
# systemctl enable gdm

echo "--- YOU SHOULD SET A PASSWORD FOR ROOT AND YOURSELF BEFORE REBOOTING! ---"