# Ubuntu / Pop!_OS

### Download
<b>Pop! Os</b> -> https://pop.system76.com/
<b>Ubuntu</b> -> https://releases.ubuntu.com/20.04.2.0/ubuntu-20.04.2.0-desktop-amd64.iso

#### Docker installation
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io docker-compose
```

#### Python virtualenv installation
```bash
sudo apt install python3-virtualenv python3-pip
```

------
# Archlinux / Manjaro

<b>Arch linux</b> -> https://archlinux.org/download/
<b>Manjaro</b> -> https://manjaro.org/downloads/official/kde/

#### Docker installation
```bash
sudo pacman -S docker docker-compose
```

#### Python virtualenv installation
```bash
sudo pacman -S python-virtualenv python-pip
```

------
### Tool configuration
#### Docker
```
groupadd docker
usermod -aG docker $USER
systemctl enable docker
```
#### Python virtualenvs
```
python -m virtualenv ~/.python_envs/env_name
source ~/.python_envs/env_name/bin/activate
```

------
[^laptop with hybrid graphics]: *add "acpi_rev_override nvidia.modeset=1 nouveau.modeset=0" to boot parameters in bootloader
