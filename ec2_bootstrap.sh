#!/bin/bash
# if 403 error occurs, go to client on the chef-server web ui and delete the client first.
# if 401 error occurs, run ec2_reset_targets and delete the client.pem file first.

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ]
then
	echo "Usage: $0 RECIPE ROLE ENVIRONMENT"
	exit 0
fi

echo "recipe: $1, role: $2, environment: $3"
echo ""

ec2_addresses=""
while read line; do    
	if [ "$ec2_addresses" != "" ]
	then
		ec2_addresses+="\n"
	fi
	ec2_addresses+="$line"
done < ec2_bootstrap_list.txt

echo "Target ec2 list: " 
cat ec2_bootstrap_list.txt
echo ""

run_list=""
if [ "$2" = "" ]
then
	run_list="$1"	
else
	run_list="$1, role[$2]"
fi
echo "run_list: $run_list" 


echo "Start processing"
echo -ne $ec2_addresses | parallel --tag -j0 knife bootstrap {} -x ubuntu --sudo --environment $3 --run-list "'$run_list'"

echo ""
echo "Finished processing"
