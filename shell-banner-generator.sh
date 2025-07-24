#!/bin/bash
# shell-banner-generator.sh
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Purpose: Generate a custom hacker-style shell banner

BANNER_TEXT="IMNI Bash Terminal"
QUOTES=(
  "“Hack the planet.” — The Plague"
  "“Flaming Sniper hacked you!”"
  "“Obscurity is not security.”"
  "“The quieter you become, the more you are able to hear.”"
  "“Zero Trust is a lifestyle.”"
)

FONTPACK="figlet"

echo "🎨 Checking for $FONTPACK..."
if ! command -v figlet &> /dev/null; then
    echo "🧱 Installing figlet..."
    sudo apt update && sudo apt install -y figlet
fi

# Generate ASCII banner
BANNER=$(figlet "$BANNER_TEXT")
RANDOM_QUOTE=${QUOTES[$RANDOM % ${#QUOTES[@]}]}

# Backup .bashrc
cp ~/.bashrc ~/.bashrc.bak

# Inject banner at the bottom of .bashrc
echo -e "\n# --- IMNI Shell Banner ---" >> ~/.bashrc
echo "clear" >> ~/.bashrc
echo "echo -e \"\$BANNER_TEXT\"" >> ~/.bashrc
echo "figlet \"$BANNER_TEXT\"" >> ~/.bashrc
echo "echo -e \"\033[1;32m$RANDOM_QUOTE\033[0m\"" >> ~/.bashrc

echo "✅ Banner set. Please restart terminal or run: source ~/.bashrc"
