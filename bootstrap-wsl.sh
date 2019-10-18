#!/bin/sh
set -e

# TODO: Create IF questions of every action done in this script

# Print No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Promp function
prompt() {
  echo "\n\n-----${GREEN} ${1} ${NC}-----"
}

cd $HOME

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # Update Ubuntu
  #sudo apt-get update

  # Install 
  prompt "Install ZSH"
  sudo apt-get install zsh

  # Git
  prompt "Install Git"
  sudo apt-get install git
  
  # Oh-My_Zsh Installation
  prompt "Install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


# ZSH Setup
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
  prompt "Install zsh-completions"
  git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  prompt "Install zsh-syntax-highlighting Plugin"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized" ]; then
  prompt "Install zsh dir-colours plugin"
  git clone --recursive -j8 git://github.com/joel-porquet/zsh-dircolors-solarized ~/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-256color" ]; then
  prompt "Install 256color ZSH Plugin"
  git clone https://github.com/chrissicool/zsh-256color ~/.oh-my-zsh/custom/plugins/zsh-256color
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/solarized-man" ]; then
  prompt "Install solarized-man"
  git clone https://github.com/zlsun/solarized-man.git ~/.oh-my-zsh/custom/plugins/solarized-man
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  prompt "Install Autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi


# Symlink dotfiles
prompt "Symlink Dotfiles"
echo "Symlink: bashrc" && ln -nf $HOME/dotfiles/zsh/bashrc $HOME/.bashrc
echo "Symlink: zshrc" && ln -nf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
echo "Symlink: oh-my-env" && ln -nf $HOME/dotfiles/zsh/oh-my-env.sh $HOME/.oh-my-env.sh
echo "Symlink: gitconfig" && ln -nf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
echo ""
echo ""
cd $HOME


# Node
prompt "Install NodeJS / NPM / Basic Web development Packages"
sudo apt install nodejs
sudo apt install npm
sudo mkdir -p /usr/local/lib/node_modules
sudo npm install -g sass
sudo npm install -g typescript
sudo npm install -g webpack
sudo npm install -g webpack-cli


# Install Neovim + Setup KemmojoVim
prompt "Install Neovim & KemmojoVim-Setup"
sudo apt install neovim
echo "\n"
curl -sL https://raw.githubusercontent.com/Kemmojo/KemojoVim/master/boot-KemojoVim.sh | sh


# Change Shell to ZSH
prompt "Change Default Shell"
chsh -s /bin/zsh $USER


# Install bat aka colored cat, aka cat with wings
prompt "Install Bat (Cat with Wings)"
mkdir -p $HOME/Downloads && cd $HOME/Downloads/
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
sudo dpkg -i bat_0.12.1_amd64.deb
rm bat_0.12.1_amd64.deb
cd $HOME


# Install fzf
prompt "Install fzf"
cd $HOME/Downloads
wget https://github.com/junegunn/fzf-bin/releases/download/0.18.0/fzf-0.18.0-linux_amd64.tgz && tar -xzf fzf-0.18.0-linux_amd64.tgz
sudo mv fzf /usr/local/bin
rm fzf-0.18.0-linux_amd64.tgz


# Install LAMP Setup
# TODO: Finish LAMP + Composer + Laravel installation + fancy-index
## Install Base
prompt "Install Lamp-Server"
mkdir -p "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code"
mkdir -p "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code/Webdev"
mkdir -p "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code/Webdev/www"
# sudo apt-get update && sudo apt-get upgrade
sudo apt-get install tasksel
sudo tasksel install lamp-server
sudo rm /var/www/html
sudo ln -s "/mnt/c/Users/$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')/Code/Webdev/www" /var/www/html
sudo apt-get install php-zip

## Install XDebug
prompt "Install PHP-XDebug"
sudo apt-get install php-xdebug
sudo bash -c "echo '[XDebug]' >> /etc/php/7.2/apache2/php.ini"
sudo bash -c "echo 'xdebug.remote_enable = 1' >> /etc/php/7.2/apache2/php.ini"
sudo bash -c "echo 'xdebug.remote_autostart = 1' >> /etc/php/7.2/apache2/php.ini"

## Install Fance Index
prompt "Install Fancy-Index"
cd /var/www/html && git clone https://github.com/Vestride/fancy-index.git
sudo mv /var/www/html/fancy-index/.htaccess /var/www/html
sudo bash -c "echo '<Directory /var/www/html/>' >> /etc/apache2/apache2.conf"
sudo bash -c "echo '    AllowOverride All' >> /etc/apache2/apache2.conf"
sudo bash -c "echo '    Options Indexes MultiViews FollowSymLinks' >> /etc/apache2/apache2.conf"
sudo bash -c "echo '    Require all granted' >> /etc/apache2/apache2.conf"
sudo bash -c "echo '</Directory>' >> /etc/apache2/apache2.conf"

## Composer
prompt "Install Composer"
cd $HOME/Downloads
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

## Laravel
prompt "Install Laravel"
composer global require laravel/installer


# Finish
prompt "Installtion done"
echo "Dude... \n\n\n"
echo "Have Fun. :)"
