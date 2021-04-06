#!/bin/bash
# Accepted Date Format YYYY-MM-DD

date=$2

if [ -z $date ]
then
    date="$(date -d $(date +"%Y-%m-%d"))"
else
    date="$(date -d $date)"
fi

## Though i doesn't like polluting the file system i used the solution below from google need to improve it.

touch -t $date /tmp/timestamp

find . -name $1 -type df ! -newer /tmp/timestamp  
