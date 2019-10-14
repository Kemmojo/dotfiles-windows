#!/bin/sh
set -e

# Print No Color
RED='\033[0;31m'
NC='\033[0m' # No Color

# Home Directory
_base_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


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



## Alacritty Setup
## Vim Setup






