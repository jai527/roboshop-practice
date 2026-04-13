#!/bin/bash

SG_ID="sg-02677d7f13c97966d"
AMI_ID="ami-0220d79f3f480ecf5"
InstanceId

for instance in $@
do
    Instance_Id=$(aws ec2 run-instances \
    --image-id $AMI_ID \
    --count 1 \
    --instance-type t3.micro \
    --security-group-ids $SG_ID \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=instance}]" \
    --query 'Instances[0].InstanceId' \
    --output.txt)

    if [ $instance == "frontend" ]; then
       IP=$(aws ec2 describe-instances \
       --instance-ids $Instance_Id \
       --query "Reservations[].Instances[].PublicIpAddress" \
       --output text)
    else
       [ $instance == "frontend" ]; then
       IP=$(aws ec2 describe-instances \
       --instance-ids $Instance_Id \
       --query "Reservations[].Instances[].PrivateIpAddress" \
       --output text)
    fi
       
done