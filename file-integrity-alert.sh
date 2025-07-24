#!/bin/bash
# file-integrity-alert.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Real-time file integrity alert system with auto-install

MONITORED_DIRS=("/etc" "/var/www" "/usr/bin")
LOGFILE="/var/log/file-integrity-alert.log"
ALERT_CMD="echo"

# Optional webhook integration:
# ALERT_CMD='curl -X POST -H "Content-Type: application/json" -d "{\"text\": \"ALERT: $EVENT\"}" https://mattermost.yourhook.url'

echo "🔍 Checking for inotify-tools..."
if ! command -v inotifywait &>/dev/null; then
    echo "❗ inotify-tools not found. Installing..."
    sudo apt update && sudo apt install -y inotify-tools
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install inotify-tools. Aborting."
        exit 1
    fi
else
    echo "✅ inotify-tools is present."
fi

echo "🛡️ Launching file integrity monitor..."
sudo touch "$LOGFILE"
sudo chmod 600 "$LOGFILE"

for DIR in "${MONITORED_DIRS[@]}"; do
  if [ -d "$DIR" ]; then
    inotifywait -m -r -e modify,create,delete,move "$DIR" --format '%T %w %f %e' --timefmt '%F %T' |
    while read -r TIMESTAMP DIR FILE EVENT; do
      EVENT_MSG="$TIMESTAMP [INTEGRITY] $EVENT detected in $DIR$FILE"
      echo "$EVENT_MSG" | tee -a "$LOGFILE"
      eval $ALERT_CMD "\"$EVENT_MSG\""
    done &
  else
    echo "⚠️ Directory not found: $DIR"
  fi
done

wait
