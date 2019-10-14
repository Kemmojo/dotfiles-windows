 #!/bin/zsh

# ----- Owner ------------------------------------------------------------------
    export USER_NAME="WhoAreYou"

# ----- Exports ----------------------------------------------------------------


# ----- Aliases ----------------------------------------------------------------

    # ----------- Instantcall Config Files --------------------------------
    # Use mvimimetext for editing config files
    alias zshconfig="mvim ~/.zshrc"
    alias envconfig="mvim ~/.oh-my-env.sh"
    # ----------- Reload zsh Shell -----------------------------------------
    alias zshreload="source ~/.zshrc"

    # ----------- Override BSD grep with GNU equivalent -------
    which ggrep &> /dev/null && alias grep="ggrep --color=auto";

    # ----------- NeoVim over Vim -------
    alias vi="nvim"
    alias v="nvim"
    alias oldvim="\vim"


# ----- Functions -------------------------------------------------------------



# ----- Notes -------------------------------------------------------------------

