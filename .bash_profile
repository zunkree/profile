# .bash_profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).

# remove /usr/games if you want
if [[ "`uname`" != "FreeBSD" ]] ; then
    export PATH=$PATH:$HOME/bin
fi

if [[ -f ~/.bashrc ]] ; then
    . ~/.bashrc
fi

# export TERM=xterm-256color
