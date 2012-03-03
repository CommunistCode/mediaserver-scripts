#! /bin/bash

# Get the passwords required
source secretPasswords

rand=$RANDOM
tmpBackupFile="/tmp/backup-${rand}"

echo -e 'HTTP Backup\n' > ${tmpBackupFile}

# Backup http
rdiff-backup --print-statistics jack@embed.me.uk::/srv/http /mnt/seaRaid/Backup/embed.me.uk/http >> ${tmpBackupFile}

echo -e '\nvMail Backup\n' >> ${tmpBackupFile}

# Backup vmail
rdiff-backup --print-statistics root@embed.me.uk::/var/vmail /mnt/seaRaid/Backup/embed.me.uk/vmail >> ${tmpBackupFile}

echo -e '\nmySQL Backup\n' >> ${tmpBackupFile}

# Backup mySQL Databases
if ssh -l jack embed.me.uk mysqldump -u root -p${mysqlPassword} --all-databases > /mnt/seaRaid/Backup/embed.me.uk/database/full-dump-$(date +%s).sql;
	then echo "Success!" >> ${tmpBackupFile}
else
	echo "Failure!" >> ${tmpBackupFile}
fi

to="jack@embed.me.uk"
from="mediaserver@home"
subject="Backup Report: embed.me.uk ($(date))"

/home/jack/scripts/sendEmail.sh "${to}" "${from}" "${subject}" "$(cat ${tmpBackupFile})"

rm ${tmpBackupFile}
