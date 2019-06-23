#!/bin/bash
#Instalamos nano
#Ejecutar como ROOT

sudo apt install nano

echo " "
echo "Puedes desactivar las respuestas de ping de manera temporal con el siguiente comando"
echo " "
echo "echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all"
echo "Cargando el codigo"
echo " "
sudo nano echo "1" > /proc/sys/net/ipv4/icmp_echo_ignore_all
echo " "
echo "Para activar la respuesta de ping nuevamente podemos ejecutar el siguiente comando"
echo " "
echo "echo "0" > /proc/sys/net/ipv4/icmp_echo_ignore_all"
echo " "
echo "Si lo que deseamos es bloquear la respuesta de ping permanentemente"
echo "lo que podemos hacer es modificar el archivo sysctl.conf que suele estar en /etc/sysctl.conf"
echo "agregando la siguiente linea al archivo"
echo " "
echo  "/etc/sysctl.conf"
sudo nano net.ipv4.icmp_echo_ignore_all =1 > /etc/sysctl.conf
echo " "
echo "Para ver el cambio inmediatamente ejecutamos el comando"
echo " "
echo "sysctl -p"
echo " "
echo "Este comando sirve para cargar"
echo "las configuraciones previamente realizadas en el archivo: sysctl.conf"
 #TESTEAR EL .sh

