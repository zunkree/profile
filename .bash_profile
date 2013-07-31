# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [ -f ${HOME}/.bashrc ]; then
    source ${HOME}/.bashrc
fi

# Add ~/bin to PATH 
export PATH=$PATH:$HOME/bin

