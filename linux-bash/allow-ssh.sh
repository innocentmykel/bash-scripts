#!/bin/bash
# Function to display a welcome message
welcome_message() {
  echo "###############################################"
  echo "# Welcome to the Root Login Enabler Script    #"
  echo "# Provided by Innocent Michael Network Inc.   #"
  echo "###############################################"
  echo
}

welcome_message

echo "[INFO] Please wait... enabling root SSH login."
echo "[INFO] Logged in as: $(whoami)"
echo "[INFO] Date: $(date)"
echo "[INFO] Backing up /etc/ssh/sshd_config..."

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak_$(date +%F_%H-%M-%S)

echo "[INFO] Updating SSH config..."
sed -i 's/^#\?PermitRootLogin .*/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^#\?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config

echo "[INFO] Restarting SSH service..."
if systemctl restart sshd 2>/dev/null; then
  echo "[SUCCESS] SSH service restarted."
elif systemctl restart ssh 2>/dev/null; then
  echo "[SUCCESS] SSH service restarted."
else
  echo "[ERROR] Failed to restart SSH service."
  exit 1
fi

echo "[INFO] Validating root login setting..."
grep -E '^PermitRootLogin|^PasswordAuthentication' /etc/ssh/sshd_config

echo "[DONE] Root login is now enabled."
