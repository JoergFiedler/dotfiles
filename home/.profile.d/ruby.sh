if which rbenv > /dev/null; then 
  eval "$(rbenv init -)"

  export PATH="${PATH}:$HOME/.rbenv/shims"
fi

