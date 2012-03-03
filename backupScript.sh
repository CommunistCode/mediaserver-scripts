#! /bin/bash

body=$(rdiff-backup --print-statistics jack@embed.me.uk::/srv/http /mnt/seaRaid/Backup/embed.me.uk/http)

to="jack@embed.me.uk"
from="mediaserver@home"
subject="Backup Report: embed.me.uk ($(date))"

/home/jack/sendEmail.sh "${to}" "${from}" "${subject}" "${body}"

