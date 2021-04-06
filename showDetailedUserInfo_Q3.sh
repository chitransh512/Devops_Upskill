#!/bin/bash

cat /etc/passwd | grep -v '^#' | awk -F ':' '{ print " username= " $1 "\n password= " $2 "\n userinfo= " $5 "\n home= " $6 }'