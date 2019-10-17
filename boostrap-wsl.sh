#!/bin/sh
set -e

# Print No Color
RED='\033[0;31m'
NC='\033[0m' # No Color

# Home Directory
_base_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Update Ubuntu
sudo apt-get update

# Install ZSH
sudo apt-get install zsh

# Git
sudo apt-get install git


## ZSH Setup

# Oh-My_Zsh Installation
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "\n-----${RED} Install zsh-completions ${NC}-----"
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
echo "\n-----${RED} Install zsh-syntax-highlighting Plugin ${NC}-----"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "\n-----${RED} Install zsh dir-colours plugin ${NC}-----"
git clone --recursive -j8 git://github.com/joel-porquet/zsh-dircolors-solarized ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-dircolors-solarized
echo "\n-----${RED} Install 256color ZSH Plugin ${NC}-----"
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color
echo "\n-----${RED} Install solarized-man ${NC}-----"
git clone https://github.com/zlsun/solarized-man.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/solarized-man
echo "\n-----${RED} Install Autosuggestions ${NC}-----"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}plugins/zsh-autosuggestions

### TODO: Symlink dotfiles
ln -nf $HOME/dotfiles/bashrc $HOME/.bashrc
ln -nf $HOME/dotfiles/zshrc $HOME/.zshrc
ln -nf $HOME/dotfiles/oh-my-env.sh $HOME/.oh-my-env.sh


# Node
sudo apt install nodejs
node install sass
node install typescript
node install webpack
node install weback-cli


## Alacritty
# TODO:

## Vim Setup
sudo apt install neovim
curl -sL https://raw.githubusercontent.com/Kemmojo/KemojoVim/master/boot-KemojoVim.sh | sh
