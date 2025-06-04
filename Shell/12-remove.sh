#!/bin/bash

# Check for root access
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

# Function to install a package
install_package() {
    PACKAGE=$1

    echo "Checking if $PACKAGE is REMOVED..."
    dnf list remove $PACKAGE # &>/dev/null or can give log
 
    if [ $? -ne 0 ]; then
        echo "$PACKAGE is  installed. REMOVING..."
        dnf remove -y $PACKAGE # &>/dev/null or can give log

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

# Call the function with required packages
remove_package mysql
remove_package git
