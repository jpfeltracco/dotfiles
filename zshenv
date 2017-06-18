#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ "$SHLVL" -eq 1 && ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi


export GTK_CSD=0 # disable ugly window decorations in gtk, related to gtk-optional-csd package
export XKB_DEFAULT_OPTIONS=ctrl:nocaps # change caps lock to ctrl

export PATH=$PATH:/home/jpfeltracco/bin
export BROWSER=chromium
export XDG_CONFIG_HOME="/home/jpfeltracco/.config"
export EDITOR="nvim"
export VISUAL="nvim"
