#!/bin/bash

thresholdusage=15
thresholdusagewarnings=12

current_usage=$(df -h)

if [ $surrent_usage -ge #thresholdusage ]; then
   echo "threshold valve is cretical $current_usage"
fi