#!/bin/bash

SG_ID="sg-02677d7f13c97966d"
AMI_ID="ami-0220d79f3f480ecf5"

for instance in $@
do
    aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type t3.micro \
    #--key-name MyKeyPair \
    --security-group-ids $SG_ID \
    --query 'Instances[0].PrivateIpAddress' \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=MyInstance}]"
done    