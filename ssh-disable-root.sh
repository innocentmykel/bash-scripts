#!/bin/bash
# ssh-disable-root.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Disable direct root SSH login for hardening

CONFIG="/etc/ssh/sshd_config"
BACKUP="/etc/ssh/sshd_config.bak"

echo "🔍 Checking if root SSH login is already disabled..."
if grep -q "^PermitRootLogin no" "$CONFIG"; then
    echo "✅ Root login already disabled in SSH."
    exit 0
fi

echo "🛠️ Disabling root SSH login..."
sudo cp "$CONFIG" "$BACKUP"
sudo sed -i 's/^#*PermitRootLogin .*/PermitRootLogin no/' "$CONFIG"

if ! grep -q "^PermitRootLogin no" "$CONFIG"; then
    echo "PermitRootLogin no" | sudo tee -a "$CONFIG" >/dev/null
fi

echo "🔁 Restarting SSH service..."
sudo systemctl restart ssh || sudo service ssh restart

echo "✅ Root SSH login disabled and service restarted."
