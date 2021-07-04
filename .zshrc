# ~/.zshrc

# if not running interactively, don't do anything
[ -z “$PS1” ] && return

# source aliases
source $HOME/.aliases

# "read file" alias -- write into full script later
alias rd="bbg xdg-open"
alias rdf="rd \"\$(fzf)\""

# disable terminal pause
ttyctl -f
# stop suspending vim on stdout
stty -tostop

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

# ignore repeated lines in history
setopt histignoredups histignorespace

# format ls, grep, and man output
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# finally, print formatted prompt
cat ~/.cache/wal/sequences
if [ "$EUID" -ne 0 ]
	then export PS1="%B%F{blue}%n@%M%F{green} %3~ %F{magenta}%# %b%f"
	else export PS1="%B[%F{magenta}ROOT@$(hostname | awk '{print toupper($0)}')%F{green} %3~%f] %# "
fi

