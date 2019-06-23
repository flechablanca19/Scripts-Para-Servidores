#!/bin/bash
clear; echo "Informacion dada por el shell script mysys.sh."
echo "Hola, $USER"
echo
echo "La fecha es `date`"
echo
echo "Usuario conectados:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo
echo "El sistema es `uname -s` y el procesador es `uname -m`."
echo
echo "El sistema esta encendido desde:"
uptime
echo
echo

