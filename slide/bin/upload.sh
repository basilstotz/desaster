#!/bin/sh

prefix="./dist"

scp -r $prefix/* amxa.ch:public_html/desaster/slides/.
