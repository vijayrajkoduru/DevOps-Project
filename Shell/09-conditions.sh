#!/bin/bash

NUMBER=$1

# -gt: greater than
# -eq: equal to
# -lt: less than
# -ne: not equal to
# -ge: greater than or equal to
# -le: less than or equal to


if [$NUMBER -gt 100]; 
then
    echo "The number is greater than 100"
else
    echo "The number is less than 100"
fi