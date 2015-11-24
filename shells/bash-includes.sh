source /etc/bash_completion.d/git-prompt


# MY OWN PATH
PATH=$PATH:/home/leprechaun/.bin/


# GIT PROMPT
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
PS1='\u@\h$(__git_ps1 " [\[\033[01;32m\]%s\[\033[00m\]]"):\w$ '


# Terminal stuffs
alias screen='screen -T screen-256color'
export TERM=xterm-256color

export LANGUAGE=en_CA.UTF-8
export LANG=en_CA.UTF-8
export LC_ALL=en_CA.UTF-8

export EDITOR=vim

# Custom completions
complete -C aws_completer aws
source ~/.dotfiles/tmux/tmux-completion.sh