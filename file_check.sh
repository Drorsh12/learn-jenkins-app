#!/bin/sh

FILE=./build/index1.html

if [ -f $FILE ]; then
       exit 0
else
       exit 1
fi       

