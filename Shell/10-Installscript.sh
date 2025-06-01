#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must run this script as root"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Failed to install MySQL server"
    exit 1
fi

dnf install git -y
if [ $? -ne 0 ]; then
    echo "Failed to install Git"
    exit 1
fi