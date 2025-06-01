#!/bin/bash

echo "all variables: $@"
echo "Number of variables: $#"
echo "script name: $0"
echo "present working directory: $PWD"
echo "which user is running the script: $USER"
echo "Home directory of the user: $HOME"
echo "process ID of the script: $$"
sleep 60 &
echo "process ID of the last background command: $!"

