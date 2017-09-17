#!/bin/bash

##########
# Common #
##########

# Show list of all installed packages (Debian)
# Credit: StackOverflow
alias list_installed='dpkg --get-selections | grep -v deinstall'

# Move a file and leave a soft link in its place
# Credit: http://lifehacker.com/5270634/move-files-without-breaking-stuff
function lmv() {
    [ -e $1 -a -e $2 ] && mv $1 $2 && ln -s $2/$(basename $1) $(dirname $1);
}

# Force tmux to use 256 colors
alias tmux='tmux -2'

alias tma='tmux a -t'
alias tmn='tmux new -s'

# Start ssh-agent and add default key
alias remember_ssh='eval "$(ssh-agent -s)" && ssh-add $HOME/.ssh/id_rsa'

alias count_files='find . -type f | wc -l'

# Disable emacs
alias emacs='echo "nice try" && sleep 2 && vim'


#####################
# Raspberry Pi ONLY #
#####################

if [ "$DISTRO" == 'Raspbian' ]; then
    alias pitemp='/opt/vc/bin/vcgencmd measure_temp'
fi
