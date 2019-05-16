#!/usr/bin/env python
import boto3
from datetime import date

#Create IAM client
iam = boto3.client('iam')

username = raw_input("Enter username to check access key age : ")
response = iam.list_access_keys(UserName=username)
accesskeydate = response['AccessKeyMetadata'][0]['CreateDate'].date()
currentdate = date.today()
active_days = currentdate - accesskeydate
print ("The access key age of a user is : "+str(active_days.days))
