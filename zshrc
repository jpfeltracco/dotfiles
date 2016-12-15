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
# Customize to your needs...

export PATH=$PATH:/home/jpfeltracco/bin

alias v="nvim"
alias ]="open"
alias edit-gestures="sudo vim /etc/conf.d/libinput-gestures.conf"
alias edit-zshrc="vim ~/.zshrc"
alias muxstartx="exit; startx"
alias ssh:dt19="ssh -YX jfeltracco3@deepthought19.cc.gatech.edu"
alias ssh:dvm="ssh -YX vagrant@desktop -p 8192"

alias killspacemacs="emacsclient -e '(kill-emacs)'"

alias die="shutdown -h now"
alias sleep="systemctl suspend"

alias mbed="sudo picocom -b 57600 /dev/mbed0"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
