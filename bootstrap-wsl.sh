#!/bin/sh
set -e

# Print No Color
RED='\033[0;31m'
NC='\033[0m' # No Color

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # Update Ubuntu
  sudo apt-get update

  # Install ZSH
  sudo apt-get install zsh

  # Git
  sudo apt-get install git
  
  # Oh-My_Zsh Installation
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


# ZSH Setup
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
  echo "\n-----${RED} Install zsh-completions ${NC}-----"
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  echo "\n-----${RED} Install zsh-syntax-highlighting Plugin ${NC}-----"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized" ]; then
  echo "\n-----${RED} Install zsh dir-colours plugin ${NC}-----"
  git clone --recursive -j8 git://github.com/joel-porquet/zsh-dircolors-solarized ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-dircolors-solarized
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-256color" ]; then
  echo "\n-----${RED} Install 256color ZSH Plugin ${NC}-----"
  git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-256color
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/solarized-man" ]; then
  echo "\n-----${RED} Install solarized-man ${NC}-----"
  git clone https://github.com/zlsun/solarized-man.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/solarized-man
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo "\n-----${RED} Install Autosuggestions ${NC}-----"
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi


# Symlink dotfiles
echo ""
echo "\n-----${RED} Symlink Files ${NC}-----"
echo "Symlink: bashrc" && ln -nf $HOME/dotfiles/zsh/bashrc $HOME/.bashrc
echo "Symlink: zshrc" && ln -nf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
echo "Symlink: oh-my-env" && ln -nf $HOME/dotfiles/zsh/oh-my-env.sh $HOME/.oh-my-env.sh
echo ""
echo ""

cd $HOME

sudo chown -R $USER /usr/local

# Node
echo "\n-----${RED} Install NodeJS / NPM / Basic Web development Packages ${NC}-----"
sudo apt install nodejs
sudo apt install npm
mkdir -p /usr/local/lib/node_modules
npm install -g sass
npm install -g typescript
npm install -g webpack
npm install -g webpack-cli


# Vim Setup
echo ""
echo "\n-----${RED} Install Neovim & KemmojoVim-Setup ${NC}-----"
sudo apt install neovim
echo "\n"
curl -sL https://raw.githubusercontent.com/Kemmojo/KemojoVim/master/boot-KemojoVim.sh | sh
