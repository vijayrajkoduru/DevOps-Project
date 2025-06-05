#!/bin/bash

NUMBER1=$1 #
NUMBER2=$2

TIMESTAM=$(date)  #  

echo "script executed at: $TIMESTAM" 
sum=$(($NUMBER1 + $NUMBER2))

echo "Total = $NUMBER1 + $NUMBER2 = $sum"

