#!/bin/sh

if test -z "$1"; then
    echo "usage: $0 <dirname>"
    exit 0
fi

echo "var imgArray = ["

first=true

for f in $(ls $1); do
    if $first; then
	first=false
    else
	echo ","
    fi
    echo -n "   \"$1/$f\""
done

echo
echo "   ];"


