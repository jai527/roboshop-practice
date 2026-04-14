#!/bin/bash

echo "counting down:"
while [ $counter -gt 0 ]; do
    echo "$counter"
    (( "counter --" ))
done 