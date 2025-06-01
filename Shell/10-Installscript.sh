#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "You must run this script as root"
    exit 1
fi

dnf install mysql-server -y

dnf install git -y
