function gco() {
  local message=$1

  if [ -z $message ]; then
    read -p 'Commit message: ' message
  fi

  git commit -m "$message"
}
