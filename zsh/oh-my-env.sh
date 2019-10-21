 #!/bin/zsh

# ----- PATH ----------------------------------------------------------------
    # PHP-Composer
    export PATH=$HOME/.config/composer/vendor/bin:$PATH
    

# ----- Exports ----------------------------------------------------------------
    export WINDOWSUSERNAME="$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')"
    export WINHOME="/mnt/c/Users/${WINDOWSUSERNAME}"
    export CODEENV="/mnt/c/Users/${WINDOWSUSERNAME}/Code"


# ----- Sources ----------------------------------------------------------------



# ----- Startups ----------------------------------------------------------------
    # Start Webservices if offline
    [ "$(service apache2 status)" = " * apache2 is not running" ] && {sudo service mysql restart; sudo service apache2 restart}


# ----- Aliases ----------------------------------------------------------------

    # ----------- Instantcall Config Files -------------------------------------
    # Use nvim for editing config files and directories
    alias zshconfig="code ~/.zshrc"
    alias envconfig="code ~/.oh-my-env.sh"
    alias vimconfig="code ~/.KemojoVim"
    alias dotconfig="code ~/dotfiles"

    # ----------- Reload zsh Shell ---------------------------------------------
    alias zshreload="source ~/.zshrc"

    # ----------- Override BSD grep with GNU equivalent ------------------------
    which ggrep &> /dev/null && alias grep="ggrep --color=auto";

    # ----------- NeoVim over Vim ----------------------------------------------
    alias vi="nvim"
    alias v="nvim"
    alias oldvim="\vim"

    # ----------- Cat -> Bat (Cat with Wings) ----------------------------------
    alias cat="bat"
    
    # ----------- Node / NPM ---------------------------------------------------
    alias npm="sudo npm"


# ----- Functions --------------------------------------------------------------

    # ------FileSearch ---------------------------------------------------------
        function f() { find . -iname "*$1*" ${@:2} }
        function f-dir() { find . -type d -iname "*$1*" ${@:2} }
        function r() { grep "$1" ${@:2} -R . --color=always}

    # ------Webserver ----------------------------------------------------------
        function webserver-start() { sudo service mysql start && sudo service apache2 start }
        function webserver-stop() { sudo service mysql stop && sudo service apache2 stop }
        function webserver-restart() { sudo service mysql restart && sudo service apache2 restart }

    # ------Enviroment Help ----------------------------------------------------
        function envhelp() {
            # Print No Color
            RED='\033[0;31m'
            GREEN='\033[0;32m'
            BLUE='\033[0;34m'
            NC='\033[0m' # No Color

            echo "\nenvhelp(1)"
            echo ""
            echo "${GREEN}oh-my-env.sh${NC}"
            echo ""
            echo "${RED}EXPORTS${NC}"
            echo "\t${RED}\$WINDOWSUSERNAME${NC}\t Windows username \t\t\t${WINDOWSUSERNAME}"
            echo "\t${RED}\$WINHOME${NC}\t\t Path to windows user directory \t${WINHOME}"
            echo "\t${RED}\$CODEENV${NC}\t\t Path to Code direcoty \t\t\t${CODEENV}"
            echo ""
            echo "${RED}SOURCES${NC}"
            echo ""
            echo "${RED}STARTUPS${NC}"
            echo "\t${RED}apache2${NC} and ${RED}mysql${NC}"
            echo ""
            echo "${RED}ALIASES${NC}"
            echo "\t${RED}zshconfig${NC}\t\t Opens VSCode with your ${GREEN}.zshrc${NC}"
            echo "\t${RED}envconfig${NC}\t\t Opens VSCode with your ${GREEN}.oh-my-env.sh${NC}"
            echo "\t${RED}vimconfig${NC}\t\t Opens VSCode with your ${GREEN}.KemojoVim directory${NC}"
            echo "\t${RED}dotconfig${NC}\t\t Opens VSCode with your ${GREEN}dotfiles directory${NC}"
            echo ""
            echo "\t${RED}zshreload${NC}\t\t Reloads your zsh configuration"
            echo ""
            echo "\t${RED}grep${NC}\t\t\t Adds colors to ${GREEN}grep${NC}"
            echo ""
            echo "\t${RED}vi${NC}\t\t\t Opens ${GREEN}Neovim${NC} in your Terminal"
            echo "\t${RED}v${NC}\t\t\t Opens ${GREEN}Neovim${NC} in your Terminal"
            echo "\t${RED}vi${NC}\t\t\t Opens ${GREEN}Vim${NC} in your Terminal"
            echo ""
            echo "\t${RED}cat${NC}\t\t\t Instead of ${GREEN}cat${NC} ${GREEN}bat${NC} is called"
            echo ""
            echo "\t${RED}npm${NC}\t\t\t ${GREEN}NPM${NC} will be called as ${GREEN}root${NC}"
            echo ""
            echo "${RED}FUNCTIONS${NC}"
            echo "\t${RED}f()${NC}\t\t\t ${RED}find${NC} [${BLUE}args...${NC}]"
            echo "\t${RED}f-dir()${NC}\t\t\t ${RED}find${NC} [ ${RED}-type d${NC} ] [${BLUE}args...${NC}]"
            echo "\t${RED}r()${NC}\t\t\t ${RED}grep${NC} [${BLUE}args...${NC}] [ ${RED}-R${NC} ]"
            echo ""
            echo "\t${RED}webserver-start()${NC}\t Start ${RED}apache2${NC} and ${RED}mysql${NC} services"
            echo "\t${RED}webserver-restart()${NC}\t Restart ${RED}apache2${NC} and ${RED}mysql${NC} services"
            echo "\t${RED}webserver-stop()${NC}\t Stop ${RED}apache2${NC} and ${RED}mysql${NC} services"
        }


# ----- Notes ------------------------------------------------------------------
