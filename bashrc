#!/usr/bin/env bash

# Determine OS and distribution
export IS_OSX=0
export IS_LINUX=0
export DISTRO=
if [ "$(uname -s)" == "Darwin" ]; then
    IS_OSX=1
elif [ "$(uname -s)" == "Linux" ]; then
    IS_LINUX=1
    distro_text=$(cat /etc/*-release 2>/dev/null)
    if echo "$distro_text" | grep --quiet 'Raspbian'; then
         DISTRO='Raspbian'
    fi
fi

# Append and prepend to $PATH
# See: https://superuser.com/a/753948
pathappend() {
    for ARG in "$@"; do
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="${PATH:+"$PATH:"}$ARG"
        fi
    done
}

pathprepend() {
    for ((i=$#; i>0; i--)); do
        ARG=${!i}
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="$ARG${PATH:+":$PATH"}"
        fi
    done
}


#################
# Bash Settings #
#################

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Expand $variables when using tab complete
shopt -s direxpand

# History settings
HISTSIZE=64000
HISTFILESIZE=64000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="[%F %T %z] "
shopt -s histappend # Append to the history file, don't overwrite it
HISTIGNORE="ls:ll:lla:pwd:hist:history*:fg:clear:reset:tm:tm *:\
git st:git graph:git fancy:git diff:git precommit"

# Share history between sessions
case $PROMPT_COMMAND in
    *history*) ;;
    *) export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" ;;
esac

# Use arrow keys for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Set default editors
export EDITOR=vim
export VISUAL=vim

# Source platform specific configs
if [ "$IS_OSX" == 1 ]; then
    . "$HOME/.dotfiles/osx/bash_profile"
elif [ "$IS_LINUX" == 1 ]; then
    . "$HOME/.dotfiles/linux/bashrc"
fi

# Source aliases and functions
if [[ -f "$HOME/.bash_aliases" ]]; then
    . "$HOME/.bash_aliases"
fi

# Source extra environment variables
if [[ -f "$HOME/.env_vars" ]]; then
    . "$HOME/.env_vars"
fi
