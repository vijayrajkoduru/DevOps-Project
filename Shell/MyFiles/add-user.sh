#!/bin/bash

USERNAME="vijaykumar"

# Check if user already exists
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
else
    # Create user with home directory and bash shell
    useradd "$USERNAME" -m -s /bin/bash
    if [ $? -eq 0 ]; then
        echo "User '$USERNAME' has been created successfully."
    else
        echo "Failed to create user '$USERNAME'."
        exit 1
    fi
fi

# Show user info
id "$USERNAME"

# Verify user in /etc/passwd
if grep -q "^$USERNAME:" /etc/passwd; then
    echo "User '$USERNAME' exists in /etc/passwd."
else
    echo "User '$USERNAME' does not exist in /etc/passwd."
fi
