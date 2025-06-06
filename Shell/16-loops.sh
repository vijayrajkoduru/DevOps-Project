#!/bin/bas

USER-ID=$(id -u)
R="\e[31m"
G="\e[32m"
B="\e[34m"
Y="\e[33m"
N="\e[0m"

LOG-FOLDER="/home/ec2-user/shell-scripts.log"
LOG-FILE=$(echo $0 | cut -d "." -f1)
TIMESTAM=$(date +%Y-%m-%d %H:%M:%S)
LOG-FILE_NAME="$LOG-FOLDER/$LOG-FILE.log-$TIMESTAM.log"

VALIDATE(){
    if [$1 -ne 0]
    then 
        echo -e "$2.. ${R}FAILED${N}"
        exit 1
    else
        echo -e "$2.. ${G}SUCCESS${N}"
    fi
}

ROOT(){
    if [ $USER-ID -ne 0 ]
    then
        echo -e "${R}You must be root to run this script${N}"
        exit 1
    fi  
}

echo "script executed at: $TIMESTAM" >> $LOG-FILE_NAME


ROOT

for package in $@
do
    dnf install $package -y &>> $LOG-FILE_NAME
    if [$? -ne 0]
    then
        dnf install $package -y &>> $LOG-FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed${N}"
   fi