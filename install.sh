#!/bin/bash
input="./names"
while IFS= read -r line
do
  echo "$line"
  cp $HOME/"."$line $HOME/"."$line".bak"
  rm $HOME/"."$line
  ln -s $PWD"/"$line $HOME"/."$line
done < "$input"
