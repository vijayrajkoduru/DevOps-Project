#!/bin/bash

USERID=$(id -u)

# Color codes
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # Reset

# Check for root access
if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR:: You must have sudo access to execute this script${N}"
    exit 1
fi

# Function to install a package
install_package() {
    PACKAGE=$1

    echo -e "${Y}Checking if $PACKAGE is installed...${N}"
    dnf list installed "$PACKAGE" &>/dev/null

    if [ $? -ne 0 ]; then
        echo -e "${Y}$PACKAGE is not installed. Installing...${N}"
        dnf install -y "$PACKAGE" &>/dev/null

        if [ $? -ne 0 ]; then
            echo -e "${R}Installing $PACKAGE ... FAILURE${N}"
            exit 1
        else
            echo -e "${G}Installing $PACKAGE ... SUCCESS${N}"
        fi
    else
        echo -e "${G}$PACKAGE is already ... INSTALLED${N}"
    fi
}

# Call the function with required packages
install_package mysql
install_package git
