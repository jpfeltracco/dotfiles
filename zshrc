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

TERM=xterm-256color

export PATH=$PATH:/home/jpfeltracco/bin
export CLASSPATH=$PATH:/home/jpfeltracco/bin/hamcrest-core-1.3.jar:/home/jpfeltracco/bin/junit-4.12.jar:.

alias ]="open"
alias edit-gestures="sudo vim /etc/conf.d/libinput-gestures.conf"
alias edit-zshrc="vim ~/.zshrc"
alias muxstartx="exit; startx"
alias ssh:dt19="ssh jfeltracco3@deepthought19.cc.gatech.edu"
alias ssh:dvm="ssh vagrant@desktop -p 8192"

alias killspacemacs="emacsclient -e '(kill-emacs)'"

alias die="shutdown -h now"
alias sleep="systemctl suspend"

alias mbed="sudo picocom -b 57600 /dev/mbed0"

alias junit="java org.junit.runner.JUnitCore"

alias em="emacsclient -n"
alias emt="emacsclient -t"                      # used to be "emacs -nw"
alias emw="emacsclient -c -a emacs"           # new - opens the GUI with alternate non-daemon
