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
alias ssh:dt19="ssh jfeltracco3@deepthought19.cc.gatech.edu"
alias ssh:dvm="ssh vagrant@desktop -p 8192"

alias mbed="sudo picocom -b 57600 /dev/mbed0"

alias junit="java org.junit.runner.JUnitCore"

export PATH=$PATH:~/bin
export CLASSPATH=$PATH:~/bin/hamcrest-core-1.3.jar:~/bin/junit-4.12.jar:.
export EDITOR="vim"
export VISUAL="vim"
