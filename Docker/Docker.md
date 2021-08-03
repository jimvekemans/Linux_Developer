# Docker
## Ubuntu / Debian installation
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose
```
## Arch installation
```bash
sudo pacman -Syyy
sudo pacman -S docker docker-compose
```
## Post-installation
```bash
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker
```
## Portainer setup
Portainer is an intuitive way to manage your docker environment
```bash
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
------
### helpful commands
- open GPU-accelerated jupyter docker container with current folder mounted 
  ```docker run --init --rm --gpus all -v $(pwd):/tf/code --publish 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter```
- clean all docker containers and images 
  ```docker container stop $(docker ps -q); docker container prune -f; docker image rm $(docker image ls -q) -f; docker image prune -f```