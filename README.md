# 🛡️ bash-scripts

A curated collection of security-enhanced, automation-ready Bash scripts developed by **Innocent Michael Network Inc.** for managing, monitoring, and protecting Linux infrastructure.

---

## 🔧 Included Scripts

| Script Name                 | Description                                                                 |
|----------------------------|-----------------------------------------------------------------------------|
| `allow-ssh.sh`             | Allows specific IPs for SSH access using UFW.                               |
| `update-linux.sh`          | Smart updater — installs `nala` if missing and performs system upgrades.    |
| `deceptive-ssh-trap.sh`    | Fake SSH shell that logs attacker inputs with login prompts.                |
| `ssh-trap-replay.sh`       | Replays intruder keystrokes from the SSH trap for forensic review.          |
| `reverse-shell-sniffer.sh` | Monitors and logs reverse shell traffic patterns using tcpdump.             |

---

## 🚀 Quick Start

```bash
git clone https://github.com/innocentmykel/bash-scripts.git
cd bash-scripts
chmod +x *.sh

To run a script, for example:

sudo ./update-linux.sh
📁 Log Files
SSH Trap Logs: /var/log/ssh-trap.log

Reverse Shell Logs: /var/log/reverse-shell.log

🧠 About the Author
Created and maintained by Prince Innocent Uzoma Michael
Founder & President — Innocent Michael Network Inc.

“Flaming Sniper hacked You!” 🔥🎯

🛡️ License
This repository is licensed under the MIT License.


# 🛡️ bash-scripts

[![MIT License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20Debian-orange)
![Security-Hardened](https://img.shields.io/badge/security-zero--trust-red)
![Shell](https://img.shields.io/badge/shell-bash-blue)
![Status](https://img.shields.io/badge/status-actively--maintained-brightgreen)

> A curated collection of cybersecurity-grade Bash scripts by **Innocent Michael Network Inc.** for defensive automation, deception, and remote server control.
