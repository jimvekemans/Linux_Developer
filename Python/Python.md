# Python

<u>**Ubuntu uses python3 instead of python, change commands to fit your machine**</u>


## Installation
- Ubuntu / Debian
```bash
sudo apt install python3-virtualenv python3-pip
```
- Arch
```bash
sudo pacman -S python-virtualenv python-pip
```
## Create a new environment

> you can specify the path for the virtualenv wherever you please, I just prefer a hidden folder named python_envs

```bash
python -m virtualenv ~/.python_envs/my_env
```
## Load environment
```bash
source ~/.python_envs/my_env/bin/activate
```
## export requirements
```bash
pip freeze > requirements.txt
```
## Install requirements
```bash
pip install -r requirements.txt
```