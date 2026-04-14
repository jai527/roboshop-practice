#!/bin/bash

#example of awhile loop reading lines from a file

filename="loop.sh"

while IFS= read -r line      #IFS means internal field separator
do
  echo "$line"
done< "$filename"
 echo "print lines"