#!/bin/bash

file="jai.txt"
rm-rf jai.txt

if [  $file ]; then
  echo "the will be $file exit"
else 
   echo "ths $file is not there"
fi