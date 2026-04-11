#!/bin/bash

set -e

SG_ID="sg-02677d7f13c97966d"
AMI_ID="ami-0220d79f3f480ecf5"
INSTANCE_TYPE="t3.micro"
ZONE_ID="Z005336437MHJ16KCQQI8"
DOMAIN="jai01.online"
TAG="roboshop"

for instance in "$@"
do
  echo "Launching $instance..."

  instance_id=$(aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --instance-type "$INSTANCE_TYPE" \
    --security-group-ids "$SG_ID" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG-$instance}]" \
    --query 'Instances[0].InstanceId' \
    --output text)

  echo "Instance ID: $instance_id"

  aws ec2 wait instance-running --instance-ids "$instance_id"

  if [ "$instance" == "frontend" ]; then
    IP=$(aws ec2 describe-instances \
      --instance-ids "$instance_id" \
      --query 'Reservations[].Instances[].PublicIpAddress' \
      --output text)
    Record_Name="$DOMAIN"
  else
    IP=$(aws ec2 describe-instances \
      --instance-ids "$instance_id" \
      --query 'Reservations[].Instances[].PrivateIpAddress' \
      --output text)
    Record_Name="$instance.$DOMAIN"
  fi

  echo "IP Address: $IP"
  echo "Creating DNS record: $Record_Name"

  aws route53 change-resource-record-sets \
    --hosted-zone-id "$ZONE_ID" \
    --change-batch "{
      \"Comment\": \"UPSERT record for $Record_Name\",
      \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
          \"Name\": \"$Record_Name\",
          \"Type\": \"A\",
          \"TTL\": 1,
          \"ResourceRecords\": [{
            \"Value\": \"$IP\"
          }]
        }
      }]
    }"

done