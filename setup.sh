#!/bin/sh
set -euf -o pipefail

# 1. Download dotfiles
git clone git@github.com:scott0129/dotfiles.git ~/dotfiles

# Create symlinks for each dotfile
find ~/dotfiles -maxdepth 1 -mindepth 1 -not -path "*.git" -exec basename '{}' \; | xargs -I {} ln -s ~/dotfiles/{} ~/{}

# a.
TODO: If mac
# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Install Neovim and plugins
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim		# This might also install python.

# 3. Install Tmux Plugin Manager
# This is kinda buggy for some reason. sometimes you have to run it twice, maybe after you run tmux for the first time.
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Make nvim refer to same .vimrc
mkdir -p ~/.config/nvim && echo -e "set runtimepath^=~/.vim runtimepath+=~/.vim/after \nlet &packpath=&runtimepath \nsource ~/.vimrc" >> ~/.config/nvim/init.vim

# Install ctags	plugin
sudo apt-get install exuberant-ctags

# 4. Install zsh
sudo apt-get install zsh
chsh -s $(which zsh)

# 5. Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5.1 Install Oh-My-Zsh autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 6.1 Install Nerd font (TBD) from https://www.nerdfonts.com/font-downloads

# 6.2 Install Starship prompt
curl -sS https://starship.rs/install.sh | sh

# 7. Point IntellJ vimrc to .vimrc
ln -s ~/.vimrc ~/.ideavimrc

mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
