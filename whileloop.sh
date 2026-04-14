#!/bin/bash

echo "counting down:"
while [ $counter -lt 10 ]; do
    echo "$counter"
    (( "counter ++" ))
done 