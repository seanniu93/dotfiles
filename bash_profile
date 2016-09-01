########################################
# Bash Settings
########################################

bind "set completion-ignore-case on"	# Make bash case insensitive.
export CLICOLOR=1			# Global terminal colors
export LSCOLORS=GxFxCxDxBxegedabagaced	# Tell 'ls' to be colorful
export GREP_OPTIONS='--color=auto'	# Tell grep to highlight matchs

## Prompt colors and text
function prompt {
	# Custom colors
	local WHITE="\[\033[1;37m\]"
	local GREEN="\[\033[0;32m\]"
	local CYAN="\[\033[0;36m\]"
	local LBLUE="\[\033[1;34m\]"
	local CLEAR="\[\033[0m\]"
	local RED="\[033[0;31m\]"

	# username@computer:directory$
	PS1="${GREEN}\u${CYAN}@${LBLUE}\h${WHITE}:${CLEAR}\W$ "

	# username@computer:directory$ with newline
	#PS1="${GREEN}\u${CYAN}@${LBLUE}\h${WHITE}:${CLEAR}\w\n$ "

	# no color
	#PS1="\u@\h:\W$ "
}
prompt

########################################
# Requres Homebrew or other app
########################################

## [brew] Enable bash-completion2
if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
	. $(brew --prefix)/share/bash-completion/bash_completion
fi

## [brew] autojump
[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

## [brew] Generic Colorizer
#source "`brew --prefix grc`/etc/grc.bashrc"

## [pip] the fuck (Disabled for being slow)
# eval $(thefuck --alias)

## [rbenv] Initialize rbenv to enable shims and autocompletion
if type rbenv > /dev/null; then
	eval "$(rbenv init -)";
fi

## [iterm2] Enable iTerm 2 shell integration
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash


########################################
# Custom Bash commands
########################################

## Open man page in Preview
function pman {
	man -t $* | open -f -a Preview;
}

## Reset DNS cache
function reset_dns {
	sudo killall -HUP mDNSResponder
}

## Custom Commands to change MAC address.
function macreset {
	sudo ifconfig en0 ether $SAVEDMAC
}

function macalt {
	# cut using space as delimiter, choose 2nd position
	export SAVEDMAC=`ifconfig en0 ether | ack ether | cut -d' ' -f2`
	echo "Saved mac address: $SAVEDMAC"
	local NEWMAC=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`
	sudo ifconfig en0 ether $NEWMAC
	echo "New mac: `ifconfig en0 ether | ack ether | cut -d' ' -f2`"
}

function getmac {
	echo "Mac address is: `ifconfig en0 ether | ack ether | cut -d' ' -f2`"
}

function rebuild_open_with_menu {
	/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
}

## 'Thanks'
function thanks {
	echo "Your're welcome."
	say "Your're welcome"
}

## Reset title
function reset-title {
	printf '\e]0;\a'
}

# Postgres
function postgres.server {
	if [[ $1 == "start" ]]; then
		echo "pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
		pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
	elif [[ $1 == "stop" ]]; then
		echo "pg_ctl -D /usr/local/var/postgres stop -s -m fast"
		pg_ctl -D /usr/local/var/postgres stop -s -m fast
	else
		echo "Missing 'start' or 'stop'"
	fi
}


########################################
# Aliases
########################################

alias ll="ls -lF"
alias lla="ls -laF"
alias la="ls -A"

alias rsync_sync="rsync -rtuvh --delete --stats --progress"


########################################
# Environment Variables
########################################

# Folders
export db="$HOME/Dropbox"

# Files
export bp="$HOME/.bash_profile"
export vrc="$HOME/.vimrc"

# Others
export EDITOR=vim
export VISUAL=vim


########################################
# PATH Settings
########################################

## Java 7
#JAVA7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home
#export JAVA_HOME=${JAVA7_HOME}
#export PATH=$JAVA_HOME/bin:$PATH

## Java 8
JAVA8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_20.jdk/Contents/Home
export JAVA_HOME=${JAVA8_HOME}
export PATH=$JAVA_HOME/bin:$PATH


########################################
# Print at new session
########################################
#archey -c
