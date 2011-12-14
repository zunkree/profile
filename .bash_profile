# .bash_profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).

# remove /usr/games if you want
if [[ "`uname`" != "FreeBSD" ]] ; then
    PATH=$PATH:$HOME/bin; export PATH
fi

[[ -r ~/.bashrc ]] && source ~/.bashrc
