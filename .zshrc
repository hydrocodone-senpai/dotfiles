# ~/.zshrc

[ -z “$PS1” ] && return				# if not running interactively, don't do anything
ttyctl -f  					# disable terminal pause

# autoload startup files
autoload -Uz compinit bracketed-paste-magic url-quote-magic

# configure zsh line editor and auto-completion
compinit   					# fuzzy-autocompletion for nested files
setopt noautomenu				# disables autocompletion if choice is ambiguous
unsetopt nomatch				#
zle -N bracketed-paste bracketed-paste-magic	# auto-bracket clipboard input
zle -N self-insert url-quote-magic		# auto-quote urls

# vi-mode
bindkey -v
export KEYTIMEOUT=1				# Sets <ESC> delay to 0.1s
bindkey '' backward-delete-char		# enable backspace after returning from command mode
bindkey '' backward-delete-char		#
bindkey '' backward-kill-word			# enable  and  bindings to work similarly
bindkey '' backward-kill-line			#

# format ls, grep, and man output
alias ls="ls -1 -h -p --color=auto --group-directories-first"
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
alias ka="killall"
alias mkd="mkdir -pv"
alias sys="systemctl"
alias abcde="cd ~/Music && abcde -o flac -B"
alias dict="sdcv"
alias ypush="yadm commit -a && yadm push"
alias ypull="yadm pull && clear && yadm diff"
alias mnova="/opt/MestReNova/bin/MestReNova"
alias highlight="highlight -O truecolor -s solarized-dark"

# application aliases
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias n="ncmpcpp -q"
alias neofetch="clear && neofetch"
alias yt="youtube-viewer"
alias yta="youtube-dl -x --audio-format wav"
alias nmgui="nm-applet --no-agent"
alias news="newsboat"
alias feh="feh --force-aliasing -A -Z -R 1"

# "read file" alias -- write into full script later
alias rd="bbg xdg-open"
alias rdf="rd \"\$(fzf)\""

# set zsh environment
export PATH="$PATH:$HOME/.scripts"
export TERM="st"
export EDITOR="vim"
export BROWSER="vimb"
export HISTFILE="$HOME/.zhistory"
export SAVEHIST="10000"
export SDCV_PAGER="less"
export LESS="-R"
export LESSHISTFILE="/dev/null"
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
# export HTTP_PROXY=http://localhost:3128

# finally, print formatted prompt
(cat ~/.cache/wal/sequences &)
if [ "$EUID" -ne 0 ]
	then export PS1="%B%F{blue}%n@%M%F{green} %3~ %F{magenta}%# %b%f"
	else export PS1="%B[%F{magenta}ROOT@$(hostname | awk '{print toupper($0)}')%F{green} %3~%f] %# "
fi
