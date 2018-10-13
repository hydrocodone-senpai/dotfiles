#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$PATH:$HOME/.scripts"

alias ls="ls -h --color=auto"

# Shorten home dir, cygwin drives, paths that are too long
if [ -d /cygdrive ] && uname -a |grep -qi cygwin; then CYGWIN_OS=1; fi
function PSWD() {
  local p="$*" space A B cols="${COLUMNS:-`tput cols 2>/dev/null || echo 80`}"
  p="${p/$HOME/\~}"         # shrink home down to a tilde
  if [ -n "$CYGWIN_OS" ] && [ "${p#/cygdrive/?/}" != "$p" ]; then
    p="${p:10:1}:${p:11}"   # /cygdrive/c/hi -> c:/hi
  fi
  space="$((${#USER}+${#HOSTNAME}+6))"  # width w/out the path
  if [ "$cols" -lt 60 ]; then echo -n "$N "; space=-29; p="$p$N\b"; fi
  if [ "$cols" -lt "$((space+${#p}+20))" ]; then # < 20 chars for the command
    A=$(( (cols-20-space)/4 ))      # a quarter of the space (-20 for cmd)
    if [ $A -lt 4 ]; then A=4; fi   # 4+ chars from beginning
    B=$(( cols-20-space-A*2 ))      # half (plus rounding) of the space
    if [ $B -lt 8 ]; then B=8; fi   # 8+ chars from end
    p="${p:0:$A}..${p: -$B}"
  fi
  echo "$p"
}

PSC() { echo -ne "\[\033[${1:-0;38}m\]"; }
PR="0;34"       # default color used in prompt is green
if [ "$(id -u)" = 0 ]; then
    sudo=41     # root is red background
  elif [ "$USER" != "${SUDO_USER:-$USER}" ]; then
    sudo=31     # not root, not self: red text
  else sudo="$PR"   # standard user color
fi
PROMPT_COMMAND='[ $? = 0 ] && PS1=${PS1[1]} || PS1=${PS1[2]}'
PSbase="$(PSC $sudo)\u$(PSC $PR)@\h $(PSC 33)\$(PSWD \w)"
PS1[1]="$PSbase$(PSC $PR)\$ $(PSC)"
PS1[2]="$PSbase$(PSC  31)\$ $(PSC)"
PS1="${PS1[1]}"
unset sudo PR PSbase

