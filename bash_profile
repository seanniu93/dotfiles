########################################
# Bash Settings
########################################

# Expand $variables when using tab complete
shopt -s direxpand

bind "set completion-ignore-case on"   # Make bash case insensitive.
export CLICOLOR=1                      # Global terminal colors
export LSCOLORS=GxFxCxDxBxegedabagaced # Tell 'ls' to be colorful
export GREP_OPTIONS='--color=auto'     # Tell grep to highlight matchs

PROMPT_DIRTRIM=3

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
	PS1="${GREEN}\u${CYAN}@${LBLUE}\h${WHITE}:${CYAN}\w${CLEAR}$ "

	# username@computer:directory$ with newline
	#PS1="${GREEN}\u${CYAN}@${LBLUE}\h${WHITE}:${CLEAR}\w\n$ "

	# no color
	#PS1="\u@\h:\W$ "
}
prompt

## History settings
HISTSIZE=64000
HISTFILESIZE=64000
HISTCONTROL=ignoreboth  # Ignore duplicates and commands starting with space
HISTTIMEFORMAT="[%F %T %z] "  # Enable timestamps in bash_history
# Stop history being clobbered if there are multiple shells open
shopt -s histappend

# Share history between bash sessions
case $PROMPT_COMMAND in
  *history*) ;;
  *) export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND" ;;
esac

# Use arrow keys for history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


########################################
# Program settings
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

## [brew] Initialize rbenv to enable shims and autocompletion
if type rbenv > /dev/null 2>&1; then
	eval "$(rbenv init -)";
fi

## [brew] Initialize pyenv
if type pyenv > /dev/null 2>&1; then
	eval "$(pyenv init -)";
fi

## [iterm2] Enable iTerm 2 shell integration
test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

## [brew] fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## [brew] fasd
if type fasd > /dev/null 2>&1; then
	eval "$(fasd --init auto)"
fi

########################################
# Custom Bash commands
########################################

# Load aliases and functions from another file
if [ -f $HOME/.bash_aliases ]; then
	source $HOME/.bash_aliases
fi


########################################
# Environment Variables
########################################

# Load aliases and functions from another file
if [ -f $HOME/.env_vars ]; then
	source $HOME/.env_vars
fi


########################################
# Print at new session
########################################
#archey -c
