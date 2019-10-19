 #!/bin/zsh

# ----- PATH ----------------------------------------------------------------
    # PHP-Composer
    export PATH=$HOME/.config/composer/vendor/bin:$PATH
    

# ----- Exports ----------------------------------------------------------------
    export WINUSERNAME="$(/mnt/c/Windows/System32/cmd.exe /c 'echo %USERNAME%' | sed -e 's/\r//g')"
    export WINHOME="/mnt/c/Users/$WINUSERNAME"
    export CODEENV="/mnt/c/Users/$WINUSERNAME/Code"


# ----- Source ----------------------------------------------------------------



# ----- Startup ----------------------------------------------------------------
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
    
    # ----------- Node / NPM ----------------------------------
    alias npm="sudo npm"


# ----- Functions --------------------------------------------------------------

    # ------FileSearch ---------------------------------------------------------
        function f() { find . -iname "*$1*" ${@:2} }
        function f-dir { find . -type d -iname "*$1*" ${@:2} }
        function r() { grep "$1" ${@:2} -R . --color=always}

    # ------Webserver ----------------------------------------------------------
        function webserver-start() { sudo service mysql start && sudo service apache2 start }
        function webserver-stop() { sudo service mysql stop && sudo service apache2 stop }
        function webserver-restart() { sudo service mysql restart && sudo service apache2 restart }

    # ------Enviroment Help ----------------------------------------------------
        # TODO: Write it
        function envhelp() {
            echo "envhelp comming..."
        }


# ----- Notes ------------------------------------------------------------------
