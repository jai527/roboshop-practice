#!/bin/bash

SG_ID="sg-02677d7f13c97966d"
AMI_ID="ami-0220d79f3f480ecf5"
INSTANCE_TYPE="t3.micro"
#KEY_NAME="roboshop"
#TAG="roboshop"

for instance in $@
do
  $(aws ec2 run-instances --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --security-group-ids $SG_ID \
  --tag-specifications \"ResourceType=instance,Tags=[{Key=Name,Value=$TAG-$instance}]" 
  --query 'Instances[0].InstanceId' \
  --output text)

if [$instance == frontend];then
    ip=$(
        aws ec2 describe-instances   
        instance-ids $instance_id \
        --query 'Reservations[].Instances[].PublicIpAddress' \
        --output text
    )
    else
    ip=$(
        aws ec2 describe-instances   
        instance-ids $instance_id \
        --query 'Reservations[].Instances[].PrivateIpAddress' \
        --output text
    )

    fi

    echo "IP Address: $ip"

    aws route53 change-resource-record-sets \
    --hosted-zone-id Z0347369KZ7QG8X5B
    --change-batch '{
        "Changes": [
            {
                "Action": "UPSERT",
                "ResourceRecordSet": {
                    "Name": "'$instance.roboshop.internal'",
                    "Type": "A",
                    "TTL": 1    ,
                    "ResourceRecords": [
                        {
                            "Value": "'$ip'"
                        }
                    ]
                }
            }
        ]
    }'
        

done

