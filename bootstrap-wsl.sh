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
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized" ]; then
  echo "\n-----${RED} Install zsh dir-colours plugin ${NC}-----"
  git clone --recursive -j8 git://github.com/joel-porquet/zsh-dircolors-solarized ~/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-256color" ]; then
  echo "\n-----${RED} Install 256color ZSH Plugin ${NC}-----"
  git clone https://github.com/chrissicool/zsh-256color ~/.oh-my-zsh/custom/plugins/zsh-256color
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/solarized-man" ]; then
  echo "\n-----${RED} Install solarized-man ${NC}-----"
  git clone https://github.com/zlsun/solarized-man.git ~/.oh-my-zsh/custom/plugins/solarized-man
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  echo "\n-----${RED} Install Autosuggestions ${NC}-----"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
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


# Node
echo "\n-----${RED} Install NodeJS / NPM / Basic Web development Packages ${NC}-----"
sudo apt install nodejs
sudo apt install npm
sudo mkdir -p /usr/local/lib/node_modules
sudo npm install -g sass
sudo npm install -g typescript
sudo npm install -g webpack
sudo npm install -g webpack-cli


# Vim Setup
echo ""
echo "\n-----${RED} Install Neovim & KemmojoVim-Setup ${NC}-----"
sudo apt install neovim
echo "\n"
curl -sL https://raw.githubusercontent.com/Kemmojo/KemojoVim/master/boot-KemojoVim.sh | sh


# Change Shell to ZSH
chsh -s /bin/zsh $USER


# Install bat aka colored cat, aka cat with wings
echo ""
echo "\n-----${RED} Install Bat (Cat with Wings) ${NC}-----"
mkdir -p $HOME/Downloads && cd $HOME/Downloads/
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd64.deb
rm dpkg -i bat_0.12.1_amd64.deb
cd $HOME


# Install LAMP Setup
# TODO: Finish LAMP + Composer + Laravel installation
mkdir -p "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code"
mkdir -p "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code/Webdev"
mkdir -p "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code/Webdev/www"
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install tasksel
sudo tasksel install lamp-server
# Resources
# - https://blog.devsense.com/2018/04/wsl
# - https://www.itwriting.com/blog/10213-setting-up-php-for-development-on-windows-services-for-linux-in-windows-10.html
sudo apt-get install php-xdebug
# Install Fance Index


# TODO: Create IF questions of every action done in this script
