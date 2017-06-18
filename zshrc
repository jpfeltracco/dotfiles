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

alias e="emacsclient -nc"
alias v="nvim"
alias vim="nvim"
alias ]="open"
alias edit-gestures="sudo vim /etc/conf.d/libinput-gestures.conf"
alias edit-zshrc="vim ~/.zshrc"
alias muxstartx="exit; startx"
alias ssh:dt19="ssh -YX jfeltracco3@deepthought19.cc.gatech.edu"
alias ssh:dvm="ssh -YX vagrant@desktop -p 8192"

alias killspacemacs="emacsclient -e '(kill-emacs)'"

alias die="shutdown -h now"
alias sleep="systemctl suspend"

#alias wristdetectdis="xinput set-prop \"DLL060A:00 06CB:2734" "libinput Disable While Typing Enabled\" 0"

alias mbed="sudo picocom -b 57600 /dev/mbed0"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
