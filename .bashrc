eval "$(direnv hook bash)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias trls='taskrunner $(taskrunner -list | fzf)'

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'

export PS1="[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]-> \[\033[0m\]"

