#!/bin/sh
if test -d /usr/share/doc/desaster; then
    cp -r /usr/share/doc/desaster/home/.config $HOME/.
    cp -r /usr/share/doc/desaster/home/bin $HOME/.
fi
