#!/bin/sh

names="apfel birne citrone dattel emmer feige gerste hirse idared kirsche limone"

for n in $names; do
    test -d ./slides/$n && rm -r ./slides/$n
done

