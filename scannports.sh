#!/bin/bash

if [ "$1" == "" ]
then
echo
echo Script scan de puertos TCP abiertos en una IP o nombre de host
echo Uso : scaner_port.sh \<ip-o-hostname\> \[inicio-port\] \[final-port\]
echo inicio-port - 1 por defecto
echo final-port - 20000 por defecto
echo
exit
fi

START_PORT=$2;[ -z "$START_PORT" ] && START_PORT=1
END_PORT=$3;[ -z "$END_PORT" ] && END_PORT=20000
echo Scanning $1 \(ports $START_PORT to $END_PORT\)

PORT_PROTOCOL="tcp"

scan_port(){
PORT_NUMBER=$1
PORT_SCAN_RESULT=`2>&1 echo "" > /dev/$PORT_PROTOCOL/$TARGET_NAME_OR_IP/$PORT_NUMBER | grep connect`
[ "$PORT_SCAN_RESULT" == "" ] && echo $PORT_NUMBER\/$PORT_PROTOCOL' 'open' '`grep $PORT_NUMBER/$PROTOCOL /etc/services | head -n1 | awk '{print $1}'`
}

TARGET_NAME_OR_IP=$1
echo 'PORT STATE SERVICE'

for PORT_NUMBER in `seq $START_PORT $END_PORT`
do
scan_port $PORT_NUMBER
done
