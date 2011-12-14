# .bashrc - Bourne Shell startup script for shells
#
# see also sh(1), environ(7).
#
# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# export	TERM=cons25
export ZNKR_UNAME="`uname`"
export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less
if [[ -n "$TMUX" ]] ; then
    export TERM=screen-256color
else
    export TERM=xterm-256color
fi

if [[ "${ZNKR_UNAME}" == "FreeBSD" ]] ; then
    ZNKR_JAILED="`sysctl -n security.jail.jailed`";  export ZNKR_JAILED
fi

if [[ -f /etc/profile.d/bash-completion.sh ]] ; then
	source /etc/profile.d/bash-completion.sh
fi

if [[ "${ZNKR_UNAME}" == "FreeBSD" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias grep='grep --colour=auto'
alias tmux='tmux -2'

if [[ -d ${HOME}/.bashrc.d ]] ; then
    for rc in ${HOME}/.bashrc.d/*rc ; do
        source ${rc}
    done
fi
if [[ "${ZNKR_UNAME}" == "Linux"  ]] ; then
    export LANG="ru_RU.utf8"
fi

# vim: ft=sh
