#!/bin/sh

echo "var imgArray = ["

first=true

for f in $(ls $1); do
    if $first; then
	first=false
    else
	echo ","
    fi
    echo -n "   \"$f\""
done

echo
echo "   ];"


