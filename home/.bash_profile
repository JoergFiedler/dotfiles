ITERM_TITLE="\[\e]2;\h:\]\w\[\a\]"
ITERM_TAB="\[\e]1;\h:\]\W\[\a\]"

prompt_cmd() {
  PS1="${ITERM_TITLE}${ITERM_TAB}\e[7m[\D{%k:%M} | \w]\e[m\n \[\033[1;34m\]"$?"\[\e[0m\] $(git_prompt) $ "
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

alias pull="git pull --rebase"
alias status="git status ."
alias push="git push"
alias add="git add -p"
alias gpass="openssl rand -base64 12"

export JAVA_HOME=$(/usr/libexec/java_home)
export MAVEN_HOME="~/opt/maven/"
export PATH="$HOME/.rbenv/shims:$HOME/bin:${PATH}:${JAVA_HOME}/bin:${MAVEN_HOME}/bin"
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

# brew bash completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
     . `brew --prefix`/etc/bash_completion
fi

for file in ~/.profile.d/*.sh ; do
  source $file
done

create_ssh_aliases ~/.ssh-hosts
[[ -r ~/.bashmarks ]] && source ~/.bashmarks

# NodeJS
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh # This loads NVM
[ -r $NVM_DIR/bash_completion ] && . $NVM_DIR/bash_completion # bash autocompletion for NVM
[ -r $NVM_PATH/../node_modules/npm/lib/utils/completion.sh ] \
  && source $NVM_PATH/../node_modules/npm/lib/utils/completion.sh
#eval "$(grunt --completion=bash)"

