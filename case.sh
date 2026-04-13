#!/bin/bash

day="monday"

case $day in 
   monday | tuesday | wednesday| thursday | friday) 
    echo "the $day is weekday"
    ;;
   sunday  | saturday)
    echo "$day is weekday"
    ;;
    *)
esac