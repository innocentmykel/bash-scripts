#!/bin/bash
# reverse-shell-sniffer.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Detect and log reverse shell traffic in real-time

LOGFILE="/var/log/reverse-shell.log"
INTERFACE="eth0"
ALERT_KEYWORDS=("bash -i" "nc -e" "sh -i" "/dev/tcp" "0<&196" "exec 5<>")

echo "🔍 Monitoring $INTERFACE for reverse shell traffic..."
sudo touch "$LOGFILE"
sudo chmod 600 "$LOGFILE"

sudo tcpdump -l -A -i "$INTERFACE" tcp port 4444 or portrange 4000-9000 2>/dev/null | \
while read -r line; do
    for keyword in "${ALERT_KEYWORDS[@]}"; do
        if echo "$line" | grep -qi "$keyword"; then
            echo "$(date '+%F %T') [SHELL-TRAP] $line" | tee -a "$LOGFILE"
        fi
    done
done
