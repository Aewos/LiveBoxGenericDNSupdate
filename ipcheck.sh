#!/bin/bash

basedir="."

LiveBoxPublicIP=$(curl -s -X POST -H "Content-Type: application/json" -d '{"parameters":{}}' http://192.168.1.1/sysbus/NMC:getWANStatus | egrep -o '"IPAddress":"([0-9]{1,3}\.){3}[0-9]{1,3}' | egrep -o '([0-9]{1,3}\.){3}[0-9]{1,3}')
previousIP=$(cat $basedir/ip.txt)

if [ "$LiveBoxPublicIP" != "$previousIP" ]
then
	echo $LiveBoxPublicIP > $basedir/ip.txt
	echo $LiveBoxPublicIP : $(date) > $basedir/LiveBoxGenericDNSupdate.log
	if [ "$LiveBoxPublicIP" != "0.0.0.0" ]
	then
		python $basedir/ipupdate.py
	fi
fi ;

