#!/usr/bin/env bash

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

# History settings
HISTSIZE=64000
HISTFILESIZE=64000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT="[%F %T %z] "
shopt -s histappend # Append to the history file, don't overwrite it

# Share history between sessions
case $PROMPT_COMMAND in
    *history*) ;;
    *) export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" ;;
esac

# Use arrow keys for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Load aliases and functions from another file
if [[ -f "$HOME/.bash_aliases" ]]; then
    . "$HOME/.bash_aliases"
fi

# Source any extra environment variables
if [[ -f "$HOME/.env_vars" ]]; then
    . "$HOME/.env_vars"
fi

# Source platform specific configs
if [ "$IS_OSX" == 1 ]; then
    . "$HOME/.dotfiles/osx/bash_profile"
elif [ "$IS_LINUX" == 1 ]; then
    . "$HOME/.dotfiles/linux/bashrc"
fi
