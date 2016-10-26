########################################
# Aliases
########################################

alias lla="ls -lAF"
alias ll="ls -lF"
alias la="ls -AF"

alias rsync_sync="rsync -rtuvh --delete --stats --progress"

alias emacs="echo 'Nice try' && sleep 1 && vim"


########################################
# Custom Bash commands
########################################

# Open man page in Preview
function pman {
	man -t $* | open -f -a Preview;
}

# Reset DNS cache
function reset_dns {
	sudo killall -HUP mDNSResponder
}

# Custom Commands to change MAC address.
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

# 'Thanks'
function thanks {
	echo "Your're welcome."
	say "Your're welcome"
}

# Reset title
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

# Homebrew
function brew {
	if [[ $1 == "megaupdate" ]]; then
		echo "brew update && brew upgrade && brew cleanup"
		brew update && brew upgrade && brew cleanup
	else
		command brew $@
	fi
}
