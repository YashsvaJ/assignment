#!/usr/bin/env python
import boto3
from datetime import date

ec2 =  boto3.client('ec2', region_name='us-east-1')
username = raw_input("Enter ec2 id  : ")
response = ec2.describe_instances(InstanceIds=[username])
variable = response['Reservations'][0]['Instances'][0]['PublicDnsName']
if variable:
    response = ec2.stop_instances(InstanceIds=[username])
    print "Successfully stopped"
else:
    print "Already in stopped state"
    exit()
