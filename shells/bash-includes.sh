#!/usr/bin/env bash

source /etc/bash_completion.d/git-prompt

# Terminal stuffs
export TERM=xterm-256color

#export LANGUAGE=en_CA.UTF-8
#export LANG=en_CA.UTF-8
#export LC_ALL=en_CA.UTF-8

export EDITOR=vim

# Custom completions
complete -C aws_completer aws
source ~/.dotfiles/tmux/tmux-completion.sh

if [ -f ~/.cargo/env ]; then
  . ~/.cargo/env
fi

export HUSKY_SKIP_HOOKS="true"

export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PROMPT_COMMAND='__git_ps1 "\[\033[38;5;248m\]\w" " \\\$ "'

export PATH=$PATH:~/.local/bin/

if ! command -v fzf &> /dev/null
then
  true
else
  source /usr/share/doc/fzf/examples/key-bindings.bash
fi
