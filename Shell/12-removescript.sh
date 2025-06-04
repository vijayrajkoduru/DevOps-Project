#!/bin/bash

# Check for root access
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: You must have sudo access to execute this script"
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
            echo "Removing $PACKAGE ... FAILURE"
            exit 1
        else
            echo "Removing $PACKAGE ... SUCCESS"
        fi
    else
        echo "$PACKAGE is already ... REMOVED"
    fi
}

# Call the function with packages to remove
remove_package mysql
remove_package git
