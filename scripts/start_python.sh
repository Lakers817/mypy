#!/bin/bash


cd /home/ubuntu/

passy=$(sudo aws ssm get-parameters --region us-east-1 --names cass --with-decryption --query Parameters[0].Value)
passy=`echo $passy | sed -e 's/^"//' -e 's/"$//'`

export passy=$passy

python test.py
