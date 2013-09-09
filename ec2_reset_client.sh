#!/bin/bash

if [ "$1" = "" ]
then
	echo "Usage: $0 ENVIRONMENT"
	exit 0
fi

echo "environment: $1"
echo ""

ec2_addresses=""
while read line; do    
	if [ "$ec2_addresses" != "" ]
	then
		ec2_addresses+="\n"
	fi
	ec2_addresses+="$line"
done < ec2_reset_targets.txt

echo "Target ec2 list: " 
cat ec2_reset_targets.txt
echo ""

echo "Start processing"
echo -ne $ec2_addresses | parallel --tag -j0 ssh -o StrictHostKeyChecking=no -2 -i ~/.ec2/aws-$1.pem ubuntu@{} 'sudo rm -f /etc/chef/client.*'

echo ""
echo "Finished processing"
