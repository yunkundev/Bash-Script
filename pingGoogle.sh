#!/bin/bash
MY_HOST="google.com"
ping -c 1 $MY_HOST
if [ "$?" -eq "0" ]
then
	echo "${MY_HOST} reachable"
else
	echo "${MY_HOST} unreachable"
fi
