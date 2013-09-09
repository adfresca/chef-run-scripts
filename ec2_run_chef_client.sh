#!/bin/bash
# if 403 error occurs, go to client on the chef-server web ui and delete the client first.
# if 401 error occurs, run ec2_reset_targets and delete the client.pem file first.

if [ "$1" = "" ] || [ "$2" = "" ]
then
	echo "Usage: $0 RECIPE(=ROLE) ENVIRONMENT"
	exit 0
fi

echo "recipe: $1, role: $1, environment: $2"
echo ""

echo "Start processing"
knife ssh "environment:$2 AND role:$1" "sudo chef-client" -x ubuntu -a ec2.public_hostname

echo ""
echo "Finished processing"
