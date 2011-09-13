
prompt_command () {
    # set an error string for the prompt, if applicable
    if [ $? -eq 0 ]; then
        ERRPROMPT=" "
    else
        ERRPROMPT=" ($?) "
    fi
 
    local BRANCH=""
 
    # if we're in a Git repo, show current branch
#    if [ "\$(type -t __git_ps1)" ]; then
#        BRANCH="\$(__git_ps1 '[ %s ] ')"
#    fi
 
#    if [ -d ".svn" ]; then
#        BRANCH="[ "`svn info | awk '/Last\ Changed\ Rev/ {print $4}'`" ]"
#    fi
 
    if [[ "`uname`" == "FreeBSD" ]] ; then
        local LOAD=`sysctl -n vm.loadavg`
    else
        local LOAD="{ `cut -d' ' -f1,2,3 /proc/loadavg` }"
    fi
    #local TIME=`date +"%d.%m.%Y %H:%M:%S"`
    local TIME=`date +"%H:%M:%S"`
    local CURENT_PATH=`echo ${PWD/#$HOME/\~}`
 
    # trim long path
    if [ ${#CURENT_PATH} -gt "35" ]; then
        let CUT=${#CURENT_PATH}-35
        CURENT_PATH="...$(echo -n $PWD | sed -e "s/\(^.\{$CUT\}\)\(.*\)/\2/")"
    fi
 
    local TITLEBAR="\[\e]2;${CURENT_PATH}\a"
 
    local DKGRAY="\[\033[1;30m\]"
    local RED="\[\033[0;31m\]"
    local BRED="\[\033[1;31m\]"
    local GREEN="\[\033[0;32m\]"
    local BGREEN="\[\033[1;32m\]"
    local YELLOW="\[\033[1;33m\]"
    local BYELLOW="\[\033[1;33m\]"
    local BLUE="\[\033[0;34m\]"
    local BBLUE="\[\033[1;34m\]"
    local MAGENTA="\[\033[0;35m\]"
    local BMAGENTA="\[\033[1;35m\]"
    local CYAN="\[\033[0;36m\]"
    local BCYAN="\[\033[1;36m\]"
    local GRAY="\[\033[0;37m\]"
    local WHITE="\[\033[1;37m\]"
    # return color to Terminal setting for text color
    local DEFAULT="\[\033[0;39m\]"
    local BDEFAULT="\[\033[1;39m\]"
  
    PROMPT="[ ${TIME}, ${LOAD}, ${USER}@${HOSTNAME} ]$ERRPROMPT [ ${CURENT_PATH} ]"
 
    # different prompt and color for root
    local PR="$ "
    local USERNAME_COLORED="${BGREEN}${USER}@${HOSTNAME}"
    if [ "$UID" = "0" ]; then
        PR="# "
        USERNAME_COLORED="${RED}${USER}@${HOSTNAME}"
    fi
 
    # use only ASCII symbols in linux console
    local DASH="\e(0q\e(B"
    local TC="\]\e(0l\e(B\]"
    local BC="\[\e(0\]m\[\e(B\]"
    if [ "$TERM" = "linux" ]; then
        TITLEBAR=""
        DASH="-"
        TC=""
        BC=""
    fi
    if [ "$TERM" = "xterm" ]; then
        TITLEBAR=""
        DASH="-"
        TC=""
        BC=""
    fi
 
    local SEPARATOR=""
    let FILLS=${COLUMNS}-${#PROMPT}
    for (( i=0; i<$FILLS; i++ )) do
        SEPARATOR=$SEPARATOR$DASH
    done
 
    local TOP_LINE="${TC}${CYAN}[ ${DKGRAY}${TIME}, ${BDEFAULT}${LOAD}, ${USERNAME_COLORED} ${CYAN}]${RED}$ERRPROMPT${CYAN}[ ${BBLUE}${CURENT_PATH}${CYAN} ]${GRAY}${SEPARATOR}"
    local BOTTOM_LINE="${BC}${GREEN}${BRANCH}${CYAN}[ ${GREEN}${PR}${DEFAULT}"
    export PS1="${TITLEBAR}\n${TOP_LINE}\n${BOTTOM_LINE}"
}
PROMPT_COMMAND=prompt_command
