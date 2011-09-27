# .bashrc - Bourne Shell startup script for shells
#
# see also sh(1), environ(7).
#
# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# export	TERM=cons25
UNAME="`uname`";    export UNAME
BLOCKSIZE=K;        export BLOCKSIZE
EDITOR=vim;         export EDITOR
PAGER=less;         export PAGER

if [[ "${UNAME}" == "FreeBSD" ]] ; then
    JAILED="`sysctl -n security.jail.jailed`";  export JAILED
fi

if [[ -f /etc/profile.d/bash-completion.sh ]] ; then
	source /etc/profile.d/bash-completion.sh
fi

if [[ "${UNAME}" == "FreeBSD" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias grep='grep --colour=auto'

if [[ -d ${HOME}/.bashrc.d ]] ; then
    for rc in ${HOME}/.bashrc.d/*rc ; do
        source ${rc}
    done
fi
