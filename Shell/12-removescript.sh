#!/bin/bash

# Check for root access
USERID=$(id -u)
# Color codes
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # Reset


if [ $USERID -ne 0 ]; then
    echo "${R}ERROR:: You must have sudo access to execute this script${N}"
    exit 1
fi

# Function to remove a package if installed
remove_package() {
    PACKAGE=$1

    echo "Checking if $PACKAGE is installed..."
    dnf list installed "$PACKAGE" # &>/dev/null

    if [ $? -eq 0 ]; then  # Package found
        echo "$PACKAGE is installed. Removing..."
        dnf remove -y "$PACKAGE" # &>/dev/null

        if [ $? -ne 0 ]; then
            echo "${Y}Removing $PACKAGE ... FAILURE${N}"

            exit 1
        else
            echo "${Y}Removing $PACKAGE ... SUCCESS${N}"
        fi
    else
        echo "${R}$PACKAGE is already ... REMOVED${N}"
    fi
}

# Call the function with packages to remove
remove_package mysql
remove_package git
