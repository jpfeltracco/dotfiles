#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias redshift="redshift -l 33.748995:-84.387982"

export PATH=$PATH:/home/jpfeltracco/bin

alias v="nvim"
alias ]="open"

alias mbed="sudo picocom -b 57600 /dev/mbed0"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
