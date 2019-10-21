#!/bin/sh
set -e

# Global Vars
WINDOWSUSER="$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')"
WINDOWS_HOME="/mnt/c/Users/$WINDOWSUSER"
HOME_ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"

# Print No Color
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Promp function
prompt() {
  echo "\n\n# ------ ${GREEN}${1}${NC} ----------------------------------------------------"
}


# Update Ubuntu
cd $HOME
sudo apt-get update


# Install ZSH 
if ! [ -x "$(command -v zsh)" ]; then
  prompt "Install ZSH"
  sudo apt-get install zsh
fi

# InstallGit
if ! [ -x "$(command -v git)" ]; then
  prompt "Install Git"
  sudo apt-get install git
fi
  
# Oh-My_Zsh Installation
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  prompt "Install oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi


# ZSH Setup
if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]; then
  prompt "Install zsh-completions"
  git clone https://github.com/zsh-users/zsh-completions $HOME_ZSH_PLUGINS_DIR/zsh-completions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
  prompt "Install zsh-syntax-highlighting Plugin"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME_ZSH_PLUGINS_DIR/zsh-syntax-highlighting
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-dircolors-solarized" ]; then
  prompt "Install zsh dir-colours plugin"
  git clone --recursive -j8 git://github.com/joel-porquet/zsh-dircolors-solarized $HOME_ZSH_PLUGINS_DIR/zsh-dircolors-solarized
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-256color" ]; then
  prompt "Install 256color ZSH Plugin"
  git clone https://github.com/chrissicool/zsh-256color $HOME_ZSH_PLUGINS_DIR/zsh-256color
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/solarized-man" ]; then
  prompt "Install solarized-man"
  git clone https://github.com/zlsun/solarized-man.git $HOME_ZSH_PLUGINS_DIR/solarized-man
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
  prompt "Install Autosuggestions"
  git clone https://github.com/zsh-users/zsh-autosuggestions $HOME_ZSH_PLUGINS_DIR/zsh-autosuggestions
fi


# Symlink dotfiles
prompt "Create Directories & Symlink Dotfiles"
## Home Directories
echo "Create: ${GREEN}$HOME/Downloads${NC}" && mkdir -p $HOME/Downloads
echo "Create: ${GREEN}$HOME/Documents${NC}" && mkdir -p $HOME/Documents

## Development Directories
echo "Create: ${GREEN}$WINDOWS_HOME/Code${NC}" && mkdir -p "$WINDOWS_HOME/Code"
echo "Create: ${GREEN}$WINDOWS_HOME/Code/Webdev${NC}" && mkdir -p "$WINDOWS_HOME/Code/Webdev"
echo "Create: ${GREEN}$WINDOWS_HOME/Code/Webdev/www" && mkdir -p "$WINDOWS_HOME/Code/Webdev/www"
echo "Create: ${GREEN}$WINDOWS_HOME/Code/Windev${NC}" && mkdir -p "$WINDOWS_HOME/Code/Windev"
echo "Create: ${GREEN}$WINDOWS_HOME/Code/Mobildev${NC}" && mkdir -p "$WINDOWS_HOME/Code/Mobildev"
echo "Create: ${GREEN}$WINDOWS_HOME/Code/CLIdev${NC}" && mkdir -p "$WINDOWS_HOME/Code/CLIdev"
echo "Create: ${GREEN}$WINDOWS_HOME/Code/Gamedev${NC}" && mkdir -p "$WINDOWS_HOME/Code/Gamedev"

## Node Directories
echo "Create: ${GREEN}/usr/local/lib/node_modules${NC}" && sudo mkdir -p /usr/local/lib/node_modules

## Symlinks
echo "Symlink: bashrc" && ln -nf $HOME/dotfiles/zsh/bashrc $HOME/.bashrc
echo "Symlink: zshrc" && ln -nf $HOME/dotfiles/zsh/zshrc $HOME/.zshrc
echo "Symlink: oh-my-env" && ln -nf $HOME/dotfiles/zsh/oh-my-env.sh $HOME/.oh-my-env.sh
echo "Symlink: gitconfig" && ln -nf $HOME/dotfiles/git/gitconfig $HOME/.gitconfig
echo "\n"
cd $HOME


# Node
prompt "Install NodeJS / NPM / Basic Web development Packages"
[ ! -x "$(command -v node)" ] && sudo apt install nodejs
[ ! -x "$(command -v npm)" ] && sudo apt install npm
sudo npm install -g sass
sudo npm install -g typescript
sudo npm install -g webpack
sudo npm install -g webpack-cli
sudo npm install -g @vue/cli


# Install Neovim + Setup KemmojoVim
prompt "Install Neovim & KemmojoVim-Setup"
[ ! -x "$(command -v neovim)" ] && sudo apt install neovim
echo "\n"
curl -sL https://raw.githubusercontent.com/Kemmojo/KemojoVim/master/boot-KemojoVim.sh | sh


# Change Shell to ZSH
prompt "Change Default Shell"
chsh -s /bin/zsh $USER


# Install bat aka colored cat, aka cat with wings
if ! [ -x "$(command -v bat)" ]; then
  prompt "Install Bat (Cat with Wings)"
  cd $HOME/Downloads
  wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
  sudo dpkg -i bat_0.12.1_amd64.deb
  rm bat_0.12.1_amd64.deb
  cd $HOME
fi


# Install fzf
if ! [ -x "$(command -v fzf)" ]; then
  prompt "Install fzf"
  cd $HOME/Downloads
  wget https://github.com/junegunn/fzf-bin/releases/download/0.18.0/fzf-0.18.0-linux_amd64.tgz && tar -xzf fzf-0.18.0-linux_amd64.tgz
  sudo mv fzf /usr/local/bin
  rm fzf-0.18.0-linux_amd64.tgz
  cd $HOME
fi


# Install LAMP Setup
## Install Base
prompt "Install Webserver ( Lamp )"
sudo apt-get update && sudo apt-get upgrade
[ ! -x "$(command -v tasksel)" ] && sudo apt-get install tasksel
sudo tasksel install lamp-server
sudo rm -R /var/www/html
sudo ln -s "$WINDOWS_HOME/Code/Webdev/www" /var/www/html
sudo apt-get install php-zip

## Install XDebug
prompt "Install PHP-XDebug"
sudo apt-get install php-xdebug
sudo bash -c "echo '[XDebug]' >> /etc/php/*/apache2/php.ini"
sudo bash -c "echo 'xdebug.remote_enable = 1' >> /etc/php/*/apache2/php.ini"
sudo bash -c "echo 'xdebug.remote_autostart = 1' >> /etc/php/*/apache2/php.ini"

## Install Fance Index
if [ -d "/var/www/html/fancy-index" ]; then
  prompt "Install Fancy-Index"
  cd /var/www/html && git clone https://github.com/Vestride/fancy-index.git
  sudo mv /var/www/html/fancy-index/.htaccess /var/www/html
  sudo bash -c "echo '<Directory /var/www/html/>' >> /etc/apache2/apache2.conf"
  sudo bash -c "echo '    AllowOverride All' >> /etc/apache2/apache2.conf"
  sudo bash -c "echo '    Options Indexes MultiViews FollowSymLinks' >> /etc/apache2/apache2.conf"
  sudo bash -c "echo '    Require all granted' >> /etc/apache2/apache2.conf"
  sudo bash -c "echo '</Directory>' >> /etc/apache2/apache2.conf"
fi

## Composer
if ! [ -x "$(command -v composer)" ]; then
  prompt "Install Composer"
  cd $HOME/Downloads
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  sudo mv composer.phar /usr/local/bin/composer
  cd $HOME
fi

## Laravel
if ! [ -x "$(command -v laravel)" ]; then
  prompt "Install Laravel"
  composer global require laravel/installer
fi


# Finish
prompt "Installtion done"
echo "Dude... Thanks for waiting. \n\n"
echo "Have Fun. :)\n"
echo "\n\n"
echo "Here some things you might want to check out:"
echo "- Adobe Photoshop: https://www.adobe.com/de/products/photoshop.html"
echo "- Adobe XD: https://www.adobe.com/products/xd.html#"
echo "- Affinity Photo: https://affinity.serif.com/en-gb/photo/"
echo "- Flowkey: https://www.flowkey.com/en"
echo "- XING: https://faq.xing.com/de/windows/xing-app-f%C3%BCr-windows-10-herunterladen"
echo "- FL Studio: https://www.image-line.com/flstudio"
echo "- ICUE: https://www.corsair.com/de/de/icue"
echo "- Alesis V61 Editor: https://www.alesis.com/products/legacy/v61"


