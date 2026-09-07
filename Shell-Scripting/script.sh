#!/bin/bash

curDate=$(date)
hstName=$(hostname)
usrName=$(whoami)

echo "Current Date: $curDate"
echo "Hostname: $hstName"
echo "Username: $usrName"

echo "Disk Usage:"
df -h

read -p "Enter a name for your new directory: " dir_name
read -p "Enter a name for your new file: " file_name

mkdir "$dir_name"
touch "$dir_name/$file_name"

echo "Directory '$dir_name' and file '$file_name' created successfully."

ps aux > "$dir_name/$file_name"

echo "Running processes have been saved to $dir_name/$file_name"
