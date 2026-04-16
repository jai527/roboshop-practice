#!/bin/bash

echo "village name "
read reply
echo "street name"
read street
if [ village_name -eq 0]; then
    echo "correct village"
else
   echo "wrong village"