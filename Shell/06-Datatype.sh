#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAM=$(date)

echo "script executed at: $TIMESTAM"
sum=$(($NUMBER1 + $NUMBER2))

echo "Sum of $NUMBER1 and $NUMBER2 is: $sum"
