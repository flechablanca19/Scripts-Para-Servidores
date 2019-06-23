#!/bin/bash
 my_public_ip=`dig +short @resolver1.opendns.com myip.opendns.com 2>/dev/null`
  if [ $? -ne 0 ]
   then echo "No internet access"
   else echo $my_public_ip
   fi

