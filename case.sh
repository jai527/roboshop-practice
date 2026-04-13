#!/bin/bash

day="monday"
day1="sunday"

case $day in 
   monday | tuesday | wednesday| thursday | friday) 
    echo "the $day is weekday"
    ;;
   sunday  | saturday)
    echo "$day1 is sunday"
    ;;
    *)
esac