#!/usr/bin/env bash

###########
# Aliases #
###########

# ls
alias ll='ls -lF'
alias la='ls -AF'
alias lla="ls -lAF"

# Force tmux to use 256 colors
alias tmux='tmux -2'

alias tml='tmux ls'
alias tma='tmux a -t'
alias tmn='tmux new -s'

# Combined function for tmux list, attach, and new
tm() {
    if [[ "$#" == 0 ]]; then
        tmux ls
    elif [[ "$#" == 1 ]]; then
        tmux a -t "$1" || tmux new -s "$1"
    else
        echo "tm only takes 0 or 1 arguments"
    fi
}

alias rsync_replace='rsync -rtuvh --delete --stats --progress'

# Start ssh-agent and add default key
alias ssh_add='eval "$(ssh-agent -s)" && ssh-add $HOME/.ssh/id_rsa'


#############
# Functions #
#############

count_files() {
    find "${1:-.}" -type f | wc -l
}

# Move a file and leave a soft link in its place
# See: http://lifehacker.com/5270634/move-files-without-breaking-stuff
lnmv() {
    [ -e $1 -a -e $2 ] && mv $1 $2 && ln -s $2/$(basename $1) $(dirname $1)
}

treec() { tree -Ca "$@" | less -R; }


#####################
# Platform Specific #
#####################

# Source platform specific configs
if [ "$IS_OSX" == 1 ]; then
    . "$HOME/.dotfiles/osx/bash_aliases"
elif [ "$IS_LINUX" == 1 ]; then
    . "$HOME/.dotfiles/linux/bash_aliases"
fi
