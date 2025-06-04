#!/bin/bash

USERID=$(id -u)

# Color codes
R="\e[31m"  # Red
G="\e[32m"  # Green
Y="\e[33m"  # Yellow
N="\e[0m"   # Reset

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(basename "$0" | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

#  [1] Ensure log directory exists
mkdir -p "$LOGS_FOLDER"

#  [2] Check for root access
if [ $USERID -ne 0 ]; then
    echo -e "${R}ERROR:: You must have sudo access to execute this script${N}"
    exit 1
fi

echo "Script started executing at: $TIMESTAMP" &>>"$LOG_FILE_NAME"

#  [3] Function to install a package
install_package() {
    PACKAGE=$1

    echo -e "${Y}Checking if $PACKAGE is installed...${N}"
    dnf list installed "$PACKAGE" &>>"$LOG_FILE_NAME"

    if [ $? -ne 0 ]; then
        echo -e "${Y}$PACKAGE is not installed. Installing...${N}"
        dnf install -y "$PACKAGE" &>>"$LOG_FILE_NAME"

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

        echo "check the log path :- /var/log/shellscript-logs"

#[4] Call the function with required packages (log redirection happens inside)
install_package mysql
install_package git
