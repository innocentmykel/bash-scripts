#!/bin/bash
# ssh-trap-replay.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Replay captured keystrokes from deceptive SSH trap

LOGFILE="/var/log/ssh-trap.log"

if [ ! -f "$LOGFILE" ]; then
    echo "❌ Log file not found: $LOGFILE"
    exit 1
fi

echo "🎬 Replaying attacker input from $LOGFILE..."
echo "--------------------------------------------"
grep "\[SSH-TRAP\]" "$LOGFILE" | cut -d']' -f3- | while read -r line; do
    echo -n "$line"
    sleep 0.15
done
echo
echo "✅ Replay complete."
