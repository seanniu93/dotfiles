##########
# Common #
##########

# ls
alias ll='ls -lF'
alias la='ls -AF'
alias lla="ls -lAF"

# Force tmux to use 256 colors
alias tmux='tmux -2'

alias tml='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'


#####################
# Platform Specific #
#####################

# Source platform specific configs
if [ "$IS_OSX" == 1 ]; then
    . "$HOME/.dotfiles/osx/bash_aliases"
elif [ "$IS_LINUX" == 1 ]; then
    . "$HOME/.dotfiles/linux/bash_aliases"
fi
