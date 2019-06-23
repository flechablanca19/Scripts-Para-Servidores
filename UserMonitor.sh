#!/bin/bash

# Este script se usa para adjuntar un shell bash en ejecuciÃ³n de un usuario
# para monitorear lo que hacen

################################
PROCESS
################# ############
# verificar el proceso por usuario
# ps aux | grep pts | grep "\ -bash" | grep -v grep

# root 30562 0.0 0.1 4136 1356 pts / 0 S 09:59 0:00 -bash
# usuario 30648 0.0 0.1 4140 1388 pts / 2 R 10:45 0:00 -bash

# use strace para adjuntar al proceso
# strace -f -p 30648 2> & 1 | egrep "read | recv | write | send | exec | socket | connect"
#############################
##### #######################

STR=`which strace > /dev/null`
if [ $? -ne "0" ]; then
        echo "strace does not exist"
		if [ -f /etc/arch-release ]; then
			pacman -Sy
			pacman -S strace
		elif [ -f /etc/redhat-release ]; then
			yum update
			yum install strace
		elif [ -f /etc/debian-release ]; then
			apt-get update
			apt-get install strace
		else
			echo "unable to determine distro...please install strace.  Exiting..."
           		exit 1
		fi
fi

if [ "$1" == "" ]; then
	echo "pass the pid to monitor as an option to this script, i.e. $0 12345"
	echo -e "\n\nHere are the running pids\n\n"
	ps aux | grep pts | grep "bash" | grep -v grep
else
	echo -e "connecting to pid: $1  ... please wait\n\n"
	strace -f -p $1 2>&1 | egrep "read|recv|write|send|exec|socket|connect"
fi

#Entonces lo que hago es colocar esto en / bin o / sbin y llamarlo monuser.
#Luego creo un alias .bashrc a ese comando como este:
# alias mu='monuser'
#Ahora todo lo que necesito hacer es ejecutar el comando monuser o mu.
#Ejecutarlo sin ninguna opciÃ³n bÃ¡sicamente descarga la ayuda o el uso y tambiÃ©n todas las conchas bash corriendo. AquÃ­ hay un ejemplo:
# $ mu
#pasa el pid para monitorear como una opciÃ³n para este script, es decir. / Monitor-user.sh 12345
#Supongamos que quiero ver user5 ... ..pid 30571
# mu 30571

