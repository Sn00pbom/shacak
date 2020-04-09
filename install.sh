#!/bin/bash

# prompt user do backup
while true; do
    read -p "Backup current files in home dir? [Yy/Nn]" yn
    case $yn in
        [Yy]* ) do_backup=1; break;;
        [Nn]* ) do_backup=0; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# make links and copy backups
input="./names"
while IFS= read -r line
do
  echo "$line"
if [ $do_backup = 1 ]
then
    cp $HOME/"."$line $HOME/"."$line".bak"
fi
  rm $HOME/"."$line
  ln -s $PWD"/"$line $HOME"/."$line
done < "$input"
