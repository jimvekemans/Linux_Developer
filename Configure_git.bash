#!/bin/bash

echo "What is the email-address you use for git?"
read email

echo | ssh-keygen -t rsa -b 4096 -C "$email" -P ''

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub > ~/Documents/rsa_pub_key.txt

echo "Would you like to configure git system-wide? (y/n)" && read config_git
if [ $config_git == "y" ]; then
    (echo "Please tell me your full name."; read fullname; git config --global user.email "$email"; git config --global user.name "$fullname")
fi

echo "You can now use the rsa_pub_key.txt-file in your Documents folder to add an ssh-key."
echo "For github, you can do this here: https://github.com/settings/ssh/new "

