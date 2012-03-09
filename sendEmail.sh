#! /bin/bash

to=$1
from=$2
subject=$3
body=$4

rand=$RANDOM

echo "To: ${to}" > /tmp/email-${rand}
echo "From: ${from}" >> /tmp/email-${rand}
echo "Subject: ${subject}" >> /tmp/email-${rand}
echo "Date: $(date --rfc-822)" >> /tmp/email-${rand}
echo "${body}" >> /tmp/email-${rand}

cat /tmp/email-${rand} | msmtp -a default ${to}

rm /tmp/email-${rand}
