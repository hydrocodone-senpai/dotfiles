# ~/.bashrc

# source ~/.shortcuts

[ -f "$HOME/.shortcuts" ] && source "$HOME/.shortcuts"

# bash features
stty -ixon # Disable pausing in terminal
HISTSIZE= HISTFILESIZE=  # Infinite history
shopt -s autocd # autocd
set -o vi # vi mode
(cat ~/.cache/wal/sequences &) # wal

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Adds color to ls, grep, and less output
alias ls="ls -h --color=auto --group-directories-first"
alias grep="grep --color=auto"
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Command aliases
alias p="sudo pacman"
alias lsl="ls -lah"
alias ka="killall"
alias mkd="mkdir -pv"
alias abcde="cd ~/Music && abcde -o flac -B"

alias ypush="yadm commit -a && yadm push"
alias ypull="yadm clone https://github.com/hydrocodone-senpai/dotfiles -f && yadm status"

# Application aliases
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias n="ncmpcpp -q"
alias neofetch="clear && neofetch"
alias yt="youtube-viewer"
alias yta="youtube-dl -x --audio-format wav"

# Sets bash environment 
export PATH="$PATH:$HOME/.scripts/bin" # Set script path
export LESSHISTFILE="/dev/null" # Disables .lesshst log
export HISTFILE="$HOME/.bhistory"

if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 5)\] \\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi
