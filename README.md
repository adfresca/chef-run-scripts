chef-run-scripts
================

These are all bash scripts using knife. Knife should be installed

ec2_bootstrap.sh : bootsrapping ec2 instances listed in the ec2_bootstrap_list.txt
ec2_reset_client.sh: delete client.pem on ec2 instances listed in the ec2_reset_targets.txt
ec2_run_chef_client.sh: run chef-client on ec2 instances listed in the "ec2_#{environment}_list.txt"


# note
- ssh key file should be named as "aws-#{environment}.pem" (ie. aws-production.pem) and it should be located under ~/.ec2 directory.
- ec2_bootstrap_list.txt, "ec2_#{environment}_list.txt" and ec2_reset_targets.txt should have ec2 public addresses.
