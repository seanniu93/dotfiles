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

# Everything is in ~/.bashrc
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
