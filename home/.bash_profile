TITLE="\h:\w"

# on a remote machine
if [ -n "${SSH_CLIENT}" ]; then
  PROMPT_COLOR="\e[38;5;179m"
fi

set_title() {
  echo "\033]1; $1 \007"
}

prompt_cmd() {
  PS1="$(set_title ${TITLE})${PROMPT_COLOR}\e[7m[\h | \w]\e[m\n \[\033[1;34m\]"$?"\[\e[0m\] $(git_prompt) $ "
  history -a
}

PROMPT_COMMAND=prompt_cmd

export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

alias ..="cd .."
alias ....="cd ../../"
alias ......="cd ../../../"
alias ll="ls -G -lisa"
alias ls="ls -G"
alias vi="vim"
alias hs="homesick"
alias le="less -R"
alias sdiff="svn diff |colordiff|less -R"

alias pull="git pull --rebase --prune"
alias status="git status ."
alias push="git push"
alias add="git add -p"
alias lg="git lg | head"
alias gpass="openssl rand -base64 12"

[[ -e /usr/local/bin/vi ]] && alias vi='/usr/local/bin/vi'
[[ -e /usr/local/bin/vim ]] && alias vim='/usr/local/bin/vim'

alias tma='tmux attach -t $1'
alias tmn='tmux new -s $1'
alias tm='tmux list-sessions'

export PATH="$HOME/bin:${PATH}"
export TERM=xterm-256color
export PYTHONPATH=$PYTHONPATH:/opt/graphite/lib/

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\e[1;2A": previous-history'
bind '"\e[1;2B": next-history'
stty werase undef
bind '"\C-u": kill-whole-line'
bind '"\C-w": backward-kill-word'

export HISTCONTROL=ignoreboth
export HISTSIZE=10000
shopt -s histappend

if [ -d ~/.profile.d ]; then
  for file in ~/.profile.d/*.sh ; do
    source $file
  done
fi

[[ -r ~/.bashmarks ]] && source ~/.bashmarks

# NodeJS
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
[ -r $NVM_DIR/bash_completion ] && . $NVM_DIR/bash_completion # bash autocompletion for NVM
[ -r $NVM_PATH/../node_modules/npm/lib/utils/completion.sh ] \
  && source $NVM_PATH/../node_modules/npm/lib/utils/completion.sh
#eval "$(grunt --completion=bash)"

