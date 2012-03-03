#! /bin/bash

to="jack@embed.me.uk"
from="mediaserver@home"
subject="ALERT: Raid Degredation Detected ($(date))"

RAIDStatus=$(cat /proc/mdstat)

if [[ "$RAIDStatus" =~ "[UUUUU]" ]]
then
	# Do nothing
	echo 'All good in the hood!'
else
	/home/jack/scripts/sendEmail.sh "${to}" "${from}" "${subject}" "${RAIDStatus}"
	echo 'Uh oh - stuffs going down!'
fi
