#!/bin/bash

day="monday"
day1="sunday"

case $day in 
   monday | tuesday | wednesday| thursday | friday) 
    echo "the $day is weekday"
    ;;
case $day1 in
   sunday  | saturday)
    echo "$day1 is sunday"
    ;;
    *)
esac