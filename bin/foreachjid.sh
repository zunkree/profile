#!/bin/sh

case "x${1}" in
    "x-h")
        echo "${0} (cmd)"
        echo "where (cmd) is command to run in jails"
        exit 0
    ;;
    "x")
        echo "Need command"
        echo "to help use ${0} -h"
        exit 1
    ;;
    *)
        for jid in $( jls | grep -v JID | awk '{print $1}' ) ; do
            sudo jexec ${jid} ${1}
        done
    ;;
esac
