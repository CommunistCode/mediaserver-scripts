#! /bin/bash

RAIDStatus=$(cat /proc/mdstat)

if [[ "$RAIDStatus" =~ "[UUUUU]" ]]
then
	echo "matched"
else
	echo "not matched"
fi
