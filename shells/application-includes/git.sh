source /etc/bash_completion.d/git-prompt

export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PROMPT_COMMAND='__git_ps1 "\[\033[38;5;248m\]\w" " \\\$ "'
