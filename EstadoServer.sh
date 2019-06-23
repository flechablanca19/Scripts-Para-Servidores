#!/bin/bash

    install nmap htop


    echo "************************ [General] ****************************"
    echo " "
    echo "  Hora:           " `date '+%m-%d-%y %H:%M:%S'`
    echo "  IPs:            " `ifconfig | grep "inet addr:" | cut -f2 -d":" | cut -f1 -d" "`
    echo "  Kernel: " `uname -r`
    echo " "

    echo "************************ [Hardware] ***************************"
    echo " "
    echo "  Procesador:             " `cat /proc/cpuinfo | grep "model name" | uniq | cut -f2 -d":"`
    echo "  Nï¿½m.Prosd/nucleos:      " `cat /proc/cpuinfo | grep processor | wc -l`
    echo " "

    echo "*********************** [Memoria RAM] **************************"
    echo " "
    echo "  Memoria total:  " `free -m | grep Mem | awk '{print $(2)}'` Mb.
    echo "  Memoria usada:   " `free -m | grep Mem | awk '{print $(3)}'` Mb.
    echo "  Memoria free:   " `free -m | grep Mem | awk '{print $(4)}'` Mb.
    echo " "

    echo "********************** [Memoria SWAP] **************************"
    echo " "
    echo "  Memoria total:  " `free -m | grep Swap | awk '{print $(2)}'` Mb.
    echo "  Memoria used:   " `free -m | grep Swap | awk '{print $(3)}'` Mb.
    echo "  Memoria free:   " `free -m | grep Swap | awk '{print $(4)}'` Mb.
    echo " "

    echo "********************** [Uso de Disco] **************************"
    disco=`df -h`
    echo -e "-- Disco --\r\n$disco\r\n\r\n"

    echo "************************** [More Info] *************************"
    echo " "
    echo "  Uptime:                 " `uptime | cut -f4 -d" "` dï¿½as
    echo "  Usuarios conectados:    " `w | wc -l`
    echo "  Procesos:               " `ps aux | wc -l`
    echo "  Carga de procesador:    " `uptime | awk '{print $(NF - 2), $(NF - 1), $NF}'`
    echo " "

    echo "************************ [LAMP] ********************************"
    echo " "
    echo "  Procesos MySQL :        " `mysql -N -uuser -ppassword -e "show processlist" | grep -v Sleep | wc -l`
    echo "  Procesos Apache:        " `ps aux | grep apache | wc -l`
    echo "  Peticiones Apache:      " `netstat -an | grep :80 | wc -l`
    echo " "

    echo "********************* [Puertos abiertos] ***********************"
    echo " "
    echo "  (22)   SSH:             " `nmap localhost -p 22 | grep 22 | cut -f2 -d" "`
    echo "  (80)   Apache:  " `nmap localhost -p 80 | grep 80 | cut -f2 -d" "`
    echo "  (110)  POP3:            " `nmap localhost -p 110 | grep 110 | cut -f2 -d" "`
    echo "  (143)  IMAP:            " `nmap localhost -p 143 | grep 143 | cut -f2 -d" "`
    echo "  (3306) MySQL:           " `nmap localhost -p 3306 | grep 3306 | cut -f2 -d" "`
    echo " "
    echo "****************************************************************"
    

