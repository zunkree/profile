# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less
export TERM=xterm-256color
export HISTSIZE=262144
[[ -n "$TMUX" ]] && export TERM=screen

alias grep='grep --colour=auto'
alias tmux='tmux -2'
alias ls='ls --color=auto'
alias ll="ls --color=auto -la"
alias lh="ls --color=auto -lah"

if [[ ${EUID} == 0 ]] ; then
    export PS1='\[\033[01;31m\]\H\[\033[01;34m\] \w \$\[\033[00m\] '
else
    export PS1='\[\033[01;32m\]\u@\H\[\033[01;34m\] \w \$\[\033[00m\] '
fi

case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
        PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}\007"'
    ;;
    screen)
        PROMPT_COMMAND='echo -ne "\033_${HOSTNAME}\033\\"'
    ;;
esac

[[ -f /etc/bash_completion ]] && source /etc/bash_completion
[[ -r /etc/profile.d/bash-completion.sh ]] && source /etc/profile.d/bash-completion.sh

# vim: ft=sh
