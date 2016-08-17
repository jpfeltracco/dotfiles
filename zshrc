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

# Customize to your needs...
alias ]="open"
alias edit-gestures="sudo vim /etc/conf.d/libinput-gestures.conf"
alias edit-zshrc="vim ~/.zshrc"
alias muxstartx="exit; startx"

export PATH=$PATH:~/bin
export EDITOR="vim"
