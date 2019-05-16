#!/usr/bin/env python
import boto3
import argparse
from datetime import date

#Create IAM client
iam = boto3.client('iam')

parser = argparse.ArgumentParser(description='Example with non-optional arguments')
parser.add_argument('keyname', type=str)
arguments = parser.parse_args()
username = arguments.keyname
response = iam.list_access_keys(UserName=username)
access_key = response['AccessKeyMetadata'][0]['AccessKeyId']
accesskeydate = response['AccessKeyMetadata'][0]['CreateDate'].date()
currentdate = date.today()
active_days = currentdate - accesskeydate
print ("The access key age of a user is : "+str(active_days.days))
if active_days.days > 100:
    iam.update_access_key(UserName=username, AccessKeyId=access_key, Status="Inactive")
    print("The access key is greater than 100 days will make inactive")
#elif active_days.days < 100:
#    iam.update_access_key(UserName=username, AccessKeyId=access_key, Status="Active")
else:
    print("The access key is lesser than 100 days will keep active")

