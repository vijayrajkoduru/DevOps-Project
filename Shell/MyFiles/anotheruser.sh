#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)."
  exit 1
fi

# Prompt for the username
read -p "Enter the username: " username

# Check if user exists
if id "$username" &>/dev/null; then
    echo "✅ User '$username' already exists."
else
    echo "❌ User '$username' does not exist. Creating user..."
    sudo useradd "$username"

    # Optional: Set a default password (e.g., 'password123')
    echo "$username:password123" | sudo chpasswd

    echo "✅ User '$username' has been created with default password: password123"
fi
