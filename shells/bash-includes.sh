#!/usr/bin/env bash


# Terminal stuffs
export TERM=xterm-256color
export EDITOR=vim
export PATH=$PATH:~/.local/bin/:/opt/nvim/bin/
export BASH_COMPLETION_USER_DIR=~/.local/share/bash-completion/completions/

export HUSKY_SKIP_HOOKS="true"

if [ -f ~/.cargo/env ]; then
  . ~/.cargo/env
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

for filename in ${parent_path}/application-includes/*.sh; do
  SCRIPT="$(basename $filename)"
  COMMAND="${SCRIPT%".sh"}"

  if command -v $COMMAND &> /dev/null; then
    source $filename
  else
    #echo -- we dont have $COMMAND ?
    true
  fi
done
