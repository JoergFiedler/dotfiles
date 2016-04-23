[ -f /usr/local/etc/bash_completion.d/docker ] && . /usr/local/etc/bash_completion.d/docker
[ $(which boot2docker) ] && eval "$(boot2docker shellinit)"

