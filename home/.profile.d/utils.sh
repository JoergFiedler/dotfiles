SSH_DOTFILE_NAME="${HOME}/.dotfiles_ssh.tar.gz"

zip_dotfiles() {
  old_pwd=$(pwd)
  cd ~
  tar czLf ${SSH_DOTFILE_NAME} .ssh/config .bash_profile .profile.d/gitprompt.sh .vimrc .vim .tmux.conf
  cd ${old_pwd}
}

remote_dotfiles_sha() {
  echo `command /usr/bin/ssh -o BatchMode=yes $1 sha1sum ${SSH_DOTFILE_NAME} 2> /dev/null | grep ${SSH_DOTFILE_NAME} |sed 's/\([^ ]*\).*/\1/g'`
}

copy_ssh_id_host() {
  cat ${HOME}/.ssh/id_rsa.pub \
  | command /usr/bin/ssh $1 \
     'echo copying ssh public key to $1; \
     if test ! -d ${HOME}/.ssh/; then \
       mkdir ${HOME}/.ssh; \
       chmod 700 ${HOME}/.ssh; \
     fi; \
     cat -> ${HOME}/.ssh/authorized_keys; \
     chmod 600 ${HOME}/.ssh/authorized_keys'
}

ssh() {
  host=$(echo "$*" | sed 's/.*[[:space:]]\([^\S]*\)$/\1/')
  local_sha=$(shasum -a 1 ${SSH_DOTFILE_NAME} |sed 's/\([^ ]*\).*/\1/g')
  remote_sha=$(remote_dotfiles_sha $host)

  if [ -z "$remote_sha" ]; then
    echo 'Copy public key to enable pub-key authentication'
    copy_ssh_id_host $host
  fi

  if [ "$local_sha" != "$remote_sha" ]; then
    echo "Update remote dotfiles"
    scp -q ${SSH_DOTFILE_NAME} ${host}:
    command /usr/bin/ssh ${host} tar xzf '${HOME}/.dotfiles_ssh.tar.gz'
  fi

  command ssh "$@"
}

create_ssh_aliases() {
  for host in $(cat $1); do
    alias ${host}="ssh ${host}"
  done
}

[[ -f ${HOME}/.ssh-hosts ]] && create_ssh_aliases ${HOME}/.ssh-hosts

zip_dotfiles
