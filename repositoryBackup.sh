#!/bin/bash

#* 1 * * * ./repositoryBackup.sh

currentTime=`date +%Y%m%d`
locaFolder=$1
githubURL=$2
githubUser=$3
githubPass=$4
backupName=backup$currentTime.tgz
echo $backupName
echo $locationFolder
tar czvf $backupName $locaFolder --exclude='*.tgz'
 
#git push https://git-githubUser:
echo Backup $backupName created successfully!

#scp

#echo Backup $backupName committed to the local git repository



#echo Backup $backupName pushed to the remote git repository $1
