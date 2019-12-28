# ~/.zshrc

# if not running interactively, don't do anything
[ -z “$PS1” ] && return

# disable terminal pause
ttyctl -f

# vi-mode
bindkey -v
export KEYTIMEOUT=1
bindkey '' backward-delete-char
bindkey '' backward-delete-char
bindkey '' backward-kill-word
bindkey '' backward-kill-line

# fuzzy tab completion
autoload -Uz compinit
compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# auto-bracket clipboard input, auto-quote URLs
autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# enable directory stacks
setopt autopushd pushdminus pushdignoredups pushdsilent pushdtohome

# enable spelling correction
setopt correct correctall

# ignore repeated lines in history
setopt histignoredups histignorespace

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
alias mnova="/opt/MestReNova/bin/MestReNova"
alias dirs="dirs -v"

# application aliases
alias v="vim"
alias sv="sudo vim"
alias r="ranger"
alias n="ncmpcpp -q"
alias neofetch="clear && neofetch"
alias yta="youtube-dl -x --audio-format wav"
alias nmgui="nm-applet --no-agent"
alias news="newsboat"

# "read file" alias -- write into full script later
alias rd="bbg xdg-open"
alias rdf="rd \"\$(fzf)\""

# finally, print formatted prompt
(cat ~/.cache/wal/sequences &)
if [ "$EUID" -ne 0 ]
	then export PS1="%B%F{blue}%n@%M%F{green} %3~ %F{magenta}%# %b%f"
	else export PS1="%B[%F{magenta}ROOT@$(hostname | awk '{print toupper($0)}')%F{green} %3~%f] %# "
fi
