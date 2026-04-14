#!/bin/bash

counter=1
echo "counting up":
until [ $counter -gt 10 ] 
do 
   echo "$counter"
    (( counter++ ))

done
  echo "conting is done"