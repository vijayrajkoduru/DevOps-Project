#!/bin/bash

# ===== Runtime Variables =====
USERID=$(id -u)
R="\e[31m"        # Red
G="\e[32m"        # Green
Y="\e[33m"        # Yellow
N="\e[0m"         # Reset to normal

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
mkdir -p "$LOGS_FOLDER"

LOG_FILE=$(basename "$0" | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

# ===== Function to validate command execution =====
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILURE $N"
        echo "$2 ... FAILURE" >>"$LOG_FILE_NAME"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
        echo "$2 ... SUCCESS" >>"$LOG_FILE_NAME"
    fi
}

# ===== Function to check root privileges =====
CHECK_ROOT() {
    if [ $USERID -ne 0 ]; then
        echo -e "$R ERROR::$N You must have sudo access to execute this script"
        echo "ERROR:: Script requires root/sudo access" >>"$LOG_FILE_NAME"
        exit 1
    fi
}

# ===== Start Logging =====
echo "Script started executing at: $TIMESTAMP" | tee -a "$LOG_FILE_NAME"

# ===== Root Privilege Check =====
CHECK_ROOT

# ===== Package Installation Loop =====
for package in "$@"; do
    dnf list installed "$package" &>>"$LOG_FILE_NAME"
    if [ $? -ne 0 ]; then
        dnf install "$package" -y &>>"$LOG_FILE_NAME"
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y INSTALLED $N"
        echo "$package is already INSTALLED" >>"$LOG_FILE_NAME"
    fi
done
