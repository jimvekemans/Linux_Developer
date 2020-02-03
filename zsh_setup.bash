#!/bin/bash

# sudo pacman -S awesome-terminal-fonts powerline-common powerline-fonts zsh tmux
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack
echo "source-file ~/.tmux-themepack/powerline/double/blue.tmuxtheme"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc