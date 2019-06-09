# ~/.zshrc

[ -z “$PS1” ] && return
source ~/.shortcuts

# zsh features
autoload -Uz compinit bracketed-paste-magic url-quote-magic
compinit   			# fuzzy-autocompletion
ttyctl -f  			# disable terminal pause
(cat ~/.cache/wal/sequences &) 	# wal
setopt noautomenu		# disables autocompletion if choice is ambiguous
unsetopt nomatch

# vi-mode
bindkey -v
export KEYTIMEOUT=1		# Sets <ESC> delay to 0.1s

# command-line shortcuts
zle -N bracketed-paste bracketed-paste-magic	# auto-bracket clipboard input
zle -N self-insert url-quote-magic		# auto-quote urls

# adds color to ls, grep, and man output
alias ls="ls -h --color=auto --group-directories-first"
alias grep="grep -i --color=auto"
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# safety aliases
alias rm="rm -I"
alias mv="mv -i"
alias cp="cp -i"

# command aliases
alias p="sudo pacman"
alias g="grep"
alias lsl="ls -la"
alias ls1="ls -1a"
alias ka="killall"
alias mkd="mkdir -pv"
alias sys="systemctl"
alias abcde="cd ~/Music && abcde -o flac -B"
alias dict="sdcv"
alias ypush="yadm commit -a && yadm push"
alias ypull="yadm pull && clear && yadm diff"
alias mnova="/opt/MestReNova/bin/MestReNova"

# application aliases
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias n="ncmpcpp -q"
alias neofetch="clear && neofetch"
alias yt="youtube-viewer"
alias yta="youtube-dl -x --audio-format wav"
alias nmgui="nm-applet --no-agent"

# "read file" alias -- write into full application later
alias rd="xdg-open"
alias rdf="rd \"\$(fzf)\""

# sets zsh environment 
export PATH="$PATH:$HOME/.scripts/bin" 	# sets script path
export EDITOR="vim"			# sets vim as default editor
export HISTFILE="$HOME/.zhistory" 	# sets history file
export SAVEHIST="10000"			# sets size of history file
export LESSHISTFILE="/dev/null"    	# disables .lesshst log
export SDCV_PAGER="less"		# pipes output of stardict to less
export LESS="-R"			# enable ANSI color escape sequences in less
# export HTTP_PROXY=http://localhost:3128	# sets proxy caching server (squid)

if [ "$EUID" -ne 0 ]
	then export PS1="%B%F{blue}%n@%M%F{green} %3~ %F{magenta}%# %b%f"
	else export PS1="%B[%F{magenta}ROOT@$(hostname | awk '{print toupper($0)}')%F{green} %3~%f] %# "
fi
