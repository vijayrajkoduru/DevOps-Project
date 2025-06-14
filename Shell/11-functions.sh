#!/bin/bash

# Check for root access
USERID=$(id -u) # Get the user ID of the current user
if [ $USERID -ne 0 ]; then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

# Function to install a package
install_package() { # This function installs a package if it is not already installed
    PACKAGE=$1 # Get the package name from the argument

    echo "Checking if $PACKAGE is installed..."
    dnf list installed $PACKAGE # &>/dev/null or can give log
 
    if [ $? -ne 0 ]; then
        echo "$PACKAGE is not installed. Installing..."
        dnf install -y $PACKAGE # &>/dev/null or can give log

        if [ $? -ne 0 ]; then
            echo "Installing $PACKAGE ... FAILURE"
            exit 1 # Exit with an error code if installation fails
        else
            echo "Installing $PACKAGE ... SUCCESS"
        fi
    else
        echo "$PACKAGE is already ... INSTALLED"
    fi
}

# Call the function with required packages
install_package mysql
install_package git
