#!/bin/sh

FILE=./build/index.html

if [ -f $FILE ]; then
       echo true
else
       echo false
fi       

