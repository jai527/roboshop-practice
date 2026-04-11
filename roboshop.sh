#!/bin/bash
SG_ID="sg-02677d7f13c97966d"
AMI_ID="ami-0220d79f3f480ecf5"
INSTANCE_TYPE="t3.micro"
ZONE_ID="Z005336437MHJ16KCQQI8"
DOMAIN="jai01.online"
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

    record_name="$Domain_Name"
    else
    ip=$(
        aws ec2 describe-instances   
        instance-ids $instance_id \
        --query 'Reservations[].Instances[].PrivateIpAddress' \
        --output text
    )
    record_name="$instance.$Domain_Name"
    fi

    echo "IP Address: $ip"

    aws route53 change-resource-record-sets \
    --hosted-zone-id $ZONE_ID
    --change-batch '
    {
        comment": update a record for 
        Changes": [
            {
            "Action": "UPSERT",
            "ResourceRecordSet": {
               "Name": "'Record_Name'",
               "Type": "A",
               "TTL": 1    ,
               "ResourceRecords": [
                {
                    "Value": "'$ip'"
                }
                ]
            }
        ]
    }
        

done