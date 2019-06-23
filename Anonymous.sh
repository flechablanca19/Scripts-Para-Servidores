#!/bin/bash

echo " "
echo "Entrando en Anonimato"
sleep 5
echo " "
echo "Inicianto TOR"
sleep 5
echo " "
service tor start
echo " "
sleep 5
echo "Comprobando el estado de TOR"
sleep
echo" "
service tor status
echo " "
sleep 5
echo "Iniciando proxychains"
echo " "
echo "Iniciando  Firefox"
echo " "
sleep 5
proxychains firefox
echo " "
echo "SALIENDO DE ANONYMOUS, ADIOS"
echo " "
#Simple script, que con tener toy y proxychains instalado y configurado se puede hacer sin problemas!
#
