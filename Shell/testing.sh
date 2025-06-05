#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <person1> <person2>"
    exit 1
fi
# these are run-time variables
PERSON1=$1
PERSON2=$2

echo "$PERSON1:: hi $PERSON2"
echo "$PERSON2:: hi $PERSON1"
echo "$PERSON1:: How are you doing?"
echo "$PERSON2:: I am doing great, thanks for asking!"