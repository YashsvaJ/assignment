#!/usr/bin/env python
import boto3
from datetime import date

ec2 =  boto3.client('ec2', region_name='us-east-1')
username = raw_input("Enter ec2 id  : ")
response = ec2.describe_instances(InstanceIds=[username])
variable = response['Reservations'][0]['Instances'][0]['SecurityGroups']
#print (variable)

if variable[0]['GroupId'] != "sg-06cebf98426df3cea":
    response = ec2.modify_instance_attribute(Groups=["sg-06cebf98426df3cea"],InstanceId=username)
    print "The security group sucessfully changed"
else:
    print "The security group is already attached"
#    exit()
