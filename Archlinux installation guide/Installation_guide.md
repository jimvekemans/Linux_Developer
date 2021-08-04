# Archlinux installation steps
## Partitioning
1. Create a EFI boot partition
```bash
> fdisk /dev/{device} #usually /dev/sda (SATA SSD) or /dev/nvme0n1 (NVMe SSD)
…: g   # create GPT
…: n   # create new partition
…: 1   # create partition 1
…:     # press enter to accept default start sector
…: +1G # set boot partition to 1G size, you can pick any value >300M
…: t   # change type of partition
…: 1   # select partition 1
…: 1   # set type to 'EFI System'
…: w   # write changes to disk
> mkfs.fat -F32 /dev/{bootpartition} # sda1 / nvme0n1p1
```

2. Create a root partition
```bash
> fdisk /dev/{device}
…: n   # create new partition
…: 2   # create partition 2
…:     # press enter to accept default start sector
…: -36G # press enter if using swapfile, otherwise set to -{GB of system RAM + 4}GB
…: t   # change type of partition
…: 2   # select partition 2
…: 23  # set type to 'Linux root (x86-64)'
…: w   # write changes to disk
> mkfs.ext4 /dev/{rootpartition} # sda2 / nvme0n1p2
```

3. (optional) Create a dedicated swap partition
```bash
> fdisk /dev/{device}
…: n   # create new partition
…: 3   # create partition 3
…:     # press enter to accept default start sector
…:     # press enter to accept default end sector
…: t   # change type of partition
…: 3   # select partition 3
…: 19  # set type to 'Linux root (x86-64)'
…: w   # write changes to disk
> mkswap /dev/{swappartition} # sda3 / nvme0n1p3
```

## Connect to internet
```bash
> ip a # if using ethernet, you should have an assigned ipv4
> #TODO add wifi commands
```

## Install base
```bash
> mount /dev/{rootpartition} /mnt # sda2 / nvme0n1p2
> pacman -Syyy # Synchronise package manager
> pacstrap -i /mnt base # Install base packages
> genfstab -U -p /mnt >> /mnt/etc/fstab # Save partition UUIDs
> reflector --country Belgium --country Germany --country Netherlands --age 12 --latest 5 --protocol https --sort rate --save /mnt/etc/pacman.d/mirrorlist # Find and save fastest mirrors
> arch-chroot /mnt # Chroot into the new installation base
> pacman -S grub base-devel linux linux-headers linux-firmware efibootmgr dosfstools openssh os-prober mtools ntfs-3g nano tmux git wget networkmanager dialog xorg-server amd-ucode # replace amd-ucode with intel-ucode if using intel obviously
> pacman -S libgl nvidia nvidia-libgl opencl-nvidia nvidia-settings mesa # this command can be skipped if not using Nvidia GPU
> echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen # generate locales
> echo "Archstation" > /etc/hostname # Choose the hostname as you like
> ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime && hwclock --systohc --utc # Set timezone and sync clock
```

## Grub installation
```bash
> mkdir -p /boot/grub/locale /boot/EFI && mount /dev/{bootpartition} /boot/EFI # Mount bootpartition for grub installation
> grub-install --target=x86_64-efi --bootloader-id=archlinux --recheck && cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo && grub-mkconfig -o /boot/grub/grub.cfg # Grub installation
```

## Swap configuration
#### Using swap partition
```bash
> mkswap /dev/{swappartition} # Copy UUID from output
> echo "UUID={UUID} none swap defaults 0 0" >> /etc/fstab
```
#### Using swapfile
```bash
> fallocate -l 36G /swapfile && chmod 600 /swapfile # Change allocation size to {GB of system RAM + 4}G
> mkswap /swapfile
> echo "/swapfile none swap sw 0 0" >> /etc/fstab
```

## Desktop environment
#### KDE
```bash
> pacman -S sddm plasma konsole dolphin firefox filelight kcalc vlc gwenview ark ffmpegthumbs kdegraphics-thumbnailers qt5-imageformats kimageformats taglib libappimage raw-thumbnailer --needed
> systemctl enable sddm
```

#### Gnome
```bash
> pacman -S gdm gnome-shell gnome-terminal nautilus firefox baobab gnome-calculator vlc eog zip libappimage ffmpegthumbs gnome-control-center --needed
> systemctl enable gdm
```

## Final steps
```bash
> echo "Archstation" > /etc/hostname # Choose name as you wish
> useradd -m -g users -G wheel {username} # create user
> passwd # set root password
> passwd {username} # set user password
> sed -i 's/# %wheel\ ALL=(ALL)\ ALL/%wheel\ ALL=(ALL)\ ALL/' /etc/sudoers # Allow user to do sudo commands
> systemctl enable NetworkManager.service sshd # enable networking on startup
```

## AUR access

```bash
> chown {username} /opt
> git clone https://aur.archlinux.org/paru.git /opt/paru && cd /opt/paru && makepkg -si
> paru -Syyy
```

