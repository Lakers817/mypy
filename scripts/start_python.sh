#!/bin/bash


cd /home/ubuntu/

noni=$(aws ssm get-parameters --region us-east-1 --names cass --with-decryption --query Parameters[0].Value)
soni="${noni%\"}"
soni="${soni#\"}"
echo $soni

export toni=$soni
sleep 5

python test.py
