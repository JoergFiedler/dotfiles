ssh() {
  host=$(echo "$*" | sed 's/.*[[:space:]]\([^\S]*\)$/\1/')
  if [ -n "${TMUX}" ]; then
    tmux rename-window ${host}
    command ssh "$@"
    tmux set-window-option automatic-rename "on" 1>/dev/null
  else
    command ssh "$@"
  fi
}

copy_ssh_id_host() {
  cat .ssh/id_rsa.pub \
  | ssh $1 \
     "echo copying ssh public key to $1; \
     if test ! -d .ssh/; then \
       mkdir .ssh; \
       chmod 700 .ssh; \
     fi; \
     cat -> .ssh/authorized_keys; \
     chmod 600 .ssh/authorized_keys"
}

copy_ssh_id() {
  for host in $(cat $1); do
    copy_ssh_id_host ${host}
  done
}

copy_bash_profile_host() {
  echo -n "$1"
  ssh $1 "rm .bash_profile &>/dev/null"
  ssh $1 "rm .bashrc &>/dev/null"
  scp ~/.bash_profile_remote $1:.bash_profile &>/dev/null
}

copy_bash_profile() {
  for host in $(cat $1); do
    copy_bash_profile_host ${host}
  done
}

create_ssh_aliases() {
  for host in $(cat $1); do
    alias ${host}="ssh ${host}"
  done
}

