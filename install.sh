#!/bin/bash
while true;
do
    read -p "Copy all files in $PWD/home/ to $HOME/ ? [y/n]" yn
    case $yn in
	y)
	    break
	    ;;
	n)
	    exit
	    ;;
    esac
done

cd home
for name in $(find . -type f)
do
	echo "$name -> $HOME/$name"
	cp --remove-destination $name "$HOME/$name"
done
