#!/bin/bash
# Company: Innocent Michael Network Inc.
# Author: Flaming Sniper hacked You!
# Description: Smart Nala Updater

echo "🔍 Checking if 'nala' is installed..."

if ! command -v nala &> /dev/null; then
    echo "❗ Nala not found. Installing now..."
    sudo apt update && sudo apt install -y nala
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install Nala. Aborting."
        exit 1
    fi
else
    echo "✅ Nala is already installed."
fi

echo "🔄 Running nala update and upgrade..."
sudo nala update && sudo nala upgrade -y

if [ $? -eq 0 ]; then
    echo "✅ System updated and upgraded successfully using Nala."
else
    echo "❌ Something went wrong during the upgrade."
fi
