#!/bin/sh

# 1. Download dotfiles
git clone https://github.com/scott0129/dotfiles.git ~/dotfiles

find ~/dotfiles/ -maxdepth 1 -type f -exec cp {} ~/ \;	# Copy all files from git repo into home dir


# 2. Install Neovim and plugins
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim		# This might also install python.

# Make nvim refer to same .vimrc
mkdir -p ~/.config/nvim && echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after \nlet &packpath=&runtimepath \nsource ~/.vimrc" >> ~/.config/nvim/init.vim

# Install ctags	plugin
sudo apt-get install exuberant-ctags


# 3. Install zsh
sudo apt-get install zsh
chsh -s $(which zsh)

# 4. Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv .zshrc.pre-oh-my-zsh .zshrc

# 5. Install Pure prompt
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

