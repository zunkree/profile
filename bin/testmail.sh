#!/bin/sh

printf "If you see this message it means mailserver is working.\n" | mail -s "Test message from the `hostname`." ${*}
