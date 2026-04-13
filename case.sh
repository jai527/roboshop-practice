#!/bin/bash

day="sunday"

case $day in 
   monday | tuesday | wednesday| thursday | friday) 
    echo "the $day is weekend"
    ;;
    monday | tuesday)
    echo "$day is weekday"
    ;;
    *)
esac