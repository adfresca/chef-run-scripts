chef-run-scripts
================

These are all bash scripts using knife. 

ec2_bootstrap.sh: bootsrapping EC2 instances listed in the ec2_bootstrap_list.txt

ec2_reset_client.sh: delete client.pem on EC2 instances listed in the ec2_reset_targets.txt

ec2_run_chef_client.sh: run chef-client on EC2 instances listed in the "ec2_#{environment}_list.txt"


note
----
- Knife should be installed
- GNU parallel should be installed. (http://www.gnu.org/software/parallel/)
- ssh key file should be named as "aws-#{environment}.pem" (ie. aws-production.pem) and reside under ~/.ec2 directory.
- ec2_bootstrap_list.txt, "ec2_#{environment}_list.txt" and ec2_reset_targets.txt should have EC2 public addresses.
