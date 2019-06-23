#!/bin/bash

if [ -z $1 ]; then echo "crearCertificado.sh nobmreusuario"; exit 1; fi;

echo "Crear un cerficiado"
echo "Informacion del usuario y aceptar con y las dos veces"
cd /root/openvpn-ca
./build-key $1

if [ $? -eq 0 ]; then
	cd /root/client-config
	./make_config.sh $1
	echo "mira en /root/client-config/file esta el ovpn para el usuario"
else
	exit 1;
fi


