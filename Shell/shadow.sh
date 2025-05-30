#!/bin/bash

# Define output file
OUTPUT_FILE="vijayraj.txt"

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)."
  exit 1
fi

# Append the last line of /etc/shadow to output file
head -n 10 /etc/shadow >> "$OUTPUT_FILE" # you can just change the head to tail to get tast line 

# Print success message
echo "Last line of /etc/shadow has been appended to $OUTPUT_FILE"
