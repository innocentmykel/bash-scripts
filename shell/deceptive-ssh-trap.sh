#!/bin/bash
# deceptive-ssh-trap.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Fake SSH shell with interaction logging

PORT=2222
LOGFILE="/var/log/ssh-trap.log"
FAKEPROMPT="root@imni-secure:~#"

echo "🔍 Checking for 'socat'..."
if ! command -v socat &> /dev/null; then
    echo "❗ 'socat' not found. Installing..."
    sudo apt update && sudo apt install -y socat
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install socat. Aborting."
        exit 1
    fi
fi

echo "🚨 Launching deceptive SSH honeypot on port $PORT..."
sudo touch "$LOGFILE"
sudo chmod 600 "$LOGFILE"

# Start the fake interaction
sudo socat -d -d TCP-LISTEN:$PORT,reuseaddr,fork EXEC:"/bin/bash -c 'echo -e \"login: \"; read user; echo -e \"Password: \"; read -s pass; echo -e \"\\n$FAKEPROMPT\"; while true; do read cmd; echo \"bash: $cmd: command not found\"; echo -n \"$FAKEPROMPT \"; done'",pty,stderr 2>>"$LOGFILE" | \
while IFS= read -r line; do
    echo "$(date '+%F %T') [SSH-TRAP] $line" >> "$LOGFILE"
done
