#!/bin/bash


cd /home/ubuntu/

passy=$(aws ssm get-parameters --region us-east-1 --names cass --with-decryption --query Parameters[0].Value)

passy=`echo $passy | sed -e 's/^"//' -e 's/"$//'`

export passy=$passy

# we are getting the output in text.log

python test.py >> text.log
