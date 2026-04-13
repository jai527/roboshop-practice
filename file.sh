#!/bin/bash

file="jai.txt"

if [ -f $file ]; then
  echo "the will be $file exit"
else 
   echo "ths $file is not there"
fi