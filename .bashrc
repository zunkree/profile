# $FreeBSD: src/share/skel/dot.profile,v 1.23.2.1 2009/08/03 08:13:06 kensmith Exp $
#
# .bashrc - Bourne Shell startup script for shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want

export	PATH=$PATH:/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin:$PATH

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# export	TERM=cons25
export	BLOCKSIZE=K
export	PAGER=less
export	EDITOR=vim

alias ls='ls -G'

if [[ -f /etc/profile.d/bash-completion.sh ]] ; then
	source /etc/profile.d/bash-completion.sh
fi

if [[ "`uname`" == "FreeBSD" ]] ; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias grep='grep --colour=auto'

#. $HOME/.bashrc.d/prompt.sh

