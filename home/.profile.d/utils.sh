SSH_DOTFILE_NAME='.dotfiles_ssh.tar.gz'

zip_dotfiles() {
  tar czLf ${HOME}/${SSH_DOTFILE_NAME} .bash_profile .profile.d/gitprompt.sh .vimrc .vim .tmux.conf
}

remote_dotfiles_sha() {
  echo `command /usr/bin/ssh -o BatchMode=yes $1 sha1sum ${SSH_DOTFILE_NAME} 2> /dev/null | grep ${SSH_DOTFILE_NAME} |sed 's/\([^ ]*\).*/\1/g'`
}

copy_ssh_id_host() {
  cat .ssh/id_rsa.pub \
  | command ssh $1 \
     "echo copying ssh public key to $1; \
     if test ! -d .ssh/; then \
       mkdir .ssh; \
       chmod 700 .ssh; \
     fi; \
     cat -> .ssh/authorized_keys; \
     chmod 600 .ssh/authorized_keys"
}

ssh() {
  host=$(echo "$*" | sed 's/.*[[:space:]]\([^\S]*\)$/\1/')
  local_sha=$(shasum ${HOME}/${SSH_DOTFILE_NAME} |sed 's/\([^ ]*\).*/\1/g')
  remote_sha=$(remote_dotfiles_sha $host)

  if [ -z "$remote_sha" ]; then
    echo 'Copy public key to enable pub-key authentication'
    copy_ssh_id_host $host
  fi

  if [ "$local_sha" != "$remote_sha" ]; then
    echo "Update remote dotfiles"
    scp -q ${HOME}/${SSH_DOTFILE_NAME} ${host}:
    command ssh $host tar xzf ${SSH_DOTFILE_NAME}
  fi

  command ssh "$@"
}

create_ssh_aliases() {
  for host in $(cat $1); do
    alias ${host}="ssh ${host}"
  done
}

[[ -f ~/.ssh-hosts ]] && create_ssh_aliases ~/.ssh-hosts

zip_dotfiles
