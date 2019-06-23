#!/bin/bash

echo ""
echo "Control de Servicios Activos, Status"
echo ""
sleep 3
echo ""
service tor status
echo ""
sleep 2
echo ""
service ufw status
echo ""
sleep 2
echo ""
service nginx status
echo ""
sleep 2
echo ""
service openvpn status
echo ""
sleep 2
echo ""
#service mysql status
echo ""
#service apache2 status
sleep 2
echo ""
service nfs status
echo ""
service cron status
echo ""
service ntp status
echo ""
service ssh status
echo ""
sleep 2
echo ""
echo "Controlamos con HTOP manuelamente"
echo "Es Mejor usar F3 o F4 dependiendo de las necesidades de cada uno"
echo "Script en Bash  By Msecsysadmin"
echo "FB: https://www.facebook.com/msecsys2016/"
echo ""
