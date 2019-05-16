#!/usr/bin/env python
import boto3
from datetime import date

ec2 =  boto3.client('ec2', region_name='us-east-1')
username = raw_input("Enter ec2 id  : ")
#response = ec2.describe_instances(InstanceIds=[username])
#print(response)
response = ec2.create_tags(Resources=[username], Tags=[{'Key':'Name', 'Value':'Kumars'}])
if response['ResponseMetadata']['HTTPStatusCode'] == 200:
    print "Succesfully tagged"
