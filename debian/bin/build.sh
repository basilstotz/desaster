#!/bin/sh


NAME="desaster"

find . -name "${NAME}*_all.deb" -exec rm \{\} \;
sed  control.template -e "s/%%version%%/$(date +%s)/" > $NAME/DEBIAN/control
dpkg-deb -b $NAME .
rm $NAME/DEBIAN/control
