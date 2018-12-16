#
# ~/.bashrc
#

# Disable pausing in terminal
stty -ixon

# Infinite history
HISTSIZE= HISTFILESIZE= 

# autocd
shopt -s autocd

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:$HOME/.scripts"

# Adds color to ls output
alias ls="ls -h --color=auto --group-directories-first"

# Some alias
alias p="sudo pacman"
alias ci="copyq copy image/png - <"
alias abcde="cd ~/Music && abcde -o flac -B"
alias lsl="ls -lah"
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias n="ncmpcpp"
alias mkd="mkdir -pv"
alias neofetch="clear && neofetch"
alias yt="youtube-viewer"

if [ "$EUID" -ne 0 ]
	then export PS1="\[$(tput bold)\]\[$(tput setaf 4)\]\u\[$(tput setaf 4)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 2)\]\W\[$(tput setaf 5)\] \\$ \[$(tput sgr0)\]"
	else export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]ROOT\[$(tput setaf 2)\]@\[$(tput setaf 4)\]$(hostname | awk '{print toupper($0)}') \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
fi

