#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias tmux='TERM=screen-256color-bce tmux'

export PS1="\[\033[38;5;45m\]\u\[$(tput sgr0)\]\[\033[38;5;255m\]@\h:\[$(tput sgr0)\]\[\033[38;5;76m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;45m\]\\$>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
