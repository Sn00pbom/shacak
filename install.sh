#!/bin/bash
while true;
do
    read -p "Dump all files in $PWD/home/ to $HOME/ ? [y/n] " yn
    case $yn in
	y)
	    break
	    ;;
	n)
	    exit
	    ;;
    esac
done

while true;
do
    read -p "Copy files[0] or symbolic link files[1]? " mode
    case $mode in
	0 | 1)
	    break
	    ;;
    esac
done


cd home
for name in $(find . -type f)
do
    abs_source=${name/\./$PWD}
    abs_dest=${name/\./$HOME}
    echo "$abs_source -> $abs_dest"
    case $mode in
	0)
	    cp --remove-destination $abs_source $abs_dest
	    ;;
	1)
	    ln -sf $abs_source $abs_dest
	    ;;
    esac
done
