#! /bin/bash

to=$1
from=$2
subject=$3
body=$4

echo "To: ${to}" > /tmp/email
echo "From: ${from}" >> /tmp/email
echo "Subject: ${subject}" >> /tmp/email
echo "${body}" >> /tmp/email

cat /tmp/email | msmtp -a default ${to}
