#!/usr/bin/env bash

pwd=$(pwd)

sudo apt-get update

# Make sure we have stow for symlink management
command -v stow  >/dev/null 2>&1 || sudo apt-get install stow -y

# Development tools
sudo apt-get install neovim python3-neovim python3-dev -y

if [ -d ~/.config/nvim ] ; then
	echo "Found old nvim config at $HOME/.config/nvim/ - deleting it"
	rm -rf ~/.config/nvim
fi

# Install curl
sudo apt-get install curl -y

# Plug for neovim
curl -fLo "neovim/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

stow neovim

# Code management
sudo apt-get install git git-email -y

if [ -f ~/.gitconfig ] ; then
	echo "Found old .gitconfig file in $HOME - moving it to $HOME/.gitconfig.bak"
	mv ~/.gitconfig ~/.gitconfig.bak
fi
if [ -f ~/.tmux.conf ] ; then
	echo "Found old .tmux.conf file in $HOME - moving it to  $HOME/.tmux.conf.bak"
	mv ~/.tmux.conf ~/.tmux.conf.bak
fi

stow git
stow tmux

# Terminal tools
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
sudo apt-get install tmux -y

# Install zsh
sudo apt-get install zsh -y
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $pwd/zsh/.oh-my-zsh

# We're going to use our own custom folder, not the default one with the examples
rm -rf $pwd/zsh/.oh-my-zsh/custom
mkdir $pwd/zsh/.oh-my-zsh/custom/plugins

git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting $pwd/zsh/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions $pwd/zsh/.oh-my-zsh/custom/plugins/zsh-autosuggestions

if [ -f ~/.zshrc ] ; then
	echo "Found old .zshrc file in $HOME - moving it to $HOME/.zshrc.bak"
	mv ~/.zshrc ~/.zshrc.bak
fi

stow zsh

echo "Changing the active shell to zsh"
chsh -s $(command -v zsh)

echo "To finish the installation, log out and log in so the the new shell registers. Also, run :PlugInstall inside vim"
echo "Finished installing."

