#!/usr/bin/expect
spawn -noecho bash
# Wait for a prompt
expect "$ "
# Open neofetch
send "neofetch"
send "\r"
# Hand over control to the user
interact
exit
