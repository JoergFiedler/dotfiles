zip_dotfiles() {
  tar czf ${HOME}/.dotfiles_ssh.tar.gz .bash_profile .vimrc .vim .profile.d
}

public_key_auth_ok() {
  echo `command /usr/bin/ssh -o BatchMode=yes $1 echo 'ok' 2> /dev/null`
}

ssh() {
  host=$(echo "$*" | sed 's/.*[[:space:]]\([^\S]*\)$/\1/')
  if [ -z "$(public_key_auth_ok $host)" ]; then
    echo 'Need to copy public key to enable pub-key authentication'
    copy_ssh_id_host $host
  fi
  command ssh "$@"
}

copy_ssh_id() {
  for host in $(cat $1); do
    copy_ssh_id_host ${host}
  done
}

create_ssh_aliases() {
  for host in $(cat $1); do
    alias ${host}="ssh ${host}"
  done
}

