" iptables syntax
if getline(1) =~ "^# Generated by iptables-save" ||
 \ getline(1) =~ "^# Generated by iptables-save" ||
 \ getline(1) =~ "^# Firewall configuration written by"
    setfiletype iptables
    set commentstring=#%s
    finish
endif

