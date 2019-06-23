#!/bin/sh
 
# cantidad de usuarios conectados 
uconn=`who | wc -l | sed 's/^ *//g'`
# cantidad de usuarios reales 
ureal=`who | cut -f1 -d ' ' | sort -u | wc -l | sed 's/^ *//g'`
 
# mostrar usuarios con el número de conexiones 
who | cut -f1 -d ' ' | uniq -c | sort | sed 's/^ *//g'
 
# explicación
# who			muestra todos los usuarios
# cut -f1 -d ' '	obtiene solo los nombres
# uniq -c		obtiene cantidad de repeticiones
# sort			ordenar por número de conexiones
# sed 's/^ *//g'	eliminar espacios en blanco al
#			al principio de la línea. 
#			eso es para todo, ya que algunos
#			programas mantienen un largo numérico
#			para mostrar en la salida. 
 
# imprimir informacion
echo "connected: $uconn"
echo "reales   : $ureal"
