#!/bin/bash

#* 1 * * * ./repositoryBackup.sh >> backupsLog

currentTime=`date +%Y%m%d`
locaFolder=$1
gitURL=$2
gitUser=$3
gitPass=$4
backupName=backup$currentTime.tgz

tar czvf $backupName $locaFolder --exclude='backup*.tgz'
 
echo Backup $backupName created successfully!

git pull -q https://$gitUser:$gitPass@$gitURL
git add --all $backupName
git commit -qm 'New Backup' $backupName

echo Backup $backupName committed to the local git repository

git push -q https://$gitUser:$gitPass@$gitURL --all

echo Backup $backupName pushed to the remote git repository $1
