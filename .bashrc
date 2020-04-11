# ~/.bashrc

# bash features
stty -ixon # Disable pausing in terminal
HISTSIZE= HISTFILESIZE=  # Infinite history
shopt -s autocd # autocd
set -o vi # vi mode
(cat ~/.cache/wal/sequences &) # wal

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adds color to ls, grep, and less output
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# source aliases and env variables
if [ -f ~/.aliases ]; then
	. ~/.aliases
fi

# Sets bash environment
export PATH="$PATH:$HOME/.scripts/bin" # Set script path
export LESSHISTFILE="/dev/null" # Disables .lesshst log
export HISTFILE="$HOME/.bhistory"

if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 5)\] \\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi
