#!/bin/bash
SG_ID="sg-02677d7f13c97966d"
AMI_ID="ami-0220d79f3f480ecf5"
INSTANCE_TYPE="t3.micro"
ZONE_ID="Z005336437MHJ16KCQQI8"
DOMAIN="jai01.online"

for instance in $@
do
   Instance_ID=$( aws ec2 run-instances \
   --image-id $AMI_ID \
   --instance-type $INSTANCE_TYPE \
   --security-group-ids $SG_ID \
   --tag-specifications \"ResourceType=instance,Tags=[{Key=Name,Value=$TAG-$instance}]" \
   --query 'Instances[0].InstanceId' \
   --output text )

    if [ $instance == frontend ]; then
       IP=$(
        aws ec2 describe-instances \  
        instance-ids $Instance_ID \
        --query 'Reservations[].Instances[].PublicIpAddress' \
        --output text)
    else
       IP=$(
         aws ec2 describe-instances \      
         instance-ids $Instance_ID \
         --query 'Reservations[].Instances[].PrivateIpAddress' \
         --output text
    )
    fi

    Done