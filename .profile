# $FreeBSD: src/share/skel/dot.profile,v 1.23.2.1 2009/08/03 08:13:06 kensmith Exp $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# remove /usr/games if you want
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/games:/usr/local/sbin:/usr/local/bin:$HOME/bin


# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# Use cons25l1 for iso-* fonts
# TERM=cons25;  export TERM

export BLOCKSIZE=K
export EDITOR=vim
export PAGER=less

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

if [ -x /usr/games/fortune ] ; then /usr/games/fortune freebsd-tips ; fi

if [[ "`uname`" == "FreeBSD" ]] ; then
	alias ls='ls -G'
else
	alias ls='ls --color=auto'
fi
alias grep='grep --colour=auto'
