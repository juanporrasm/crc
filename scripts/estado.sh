#!/bin/bash
TERM=xterm-256color
estado=$(crc status|head -1|awk '{print $3}')
if [[ $estado = "Stopped" ]]; then 
  tput setaf 1; echo "parado"; tput sgr0
  tput setaf 214; echo $estado; tput sgr0
  tput setaf 48; echo "Lo arranco"; tput sgr0
  crc start |tee -a credenciales
else 
  tput setaf 48; echo "Arrancado"; tput sgr0
  tput setaf 214; echo $estado ; tput sgr0 
fi
tput setaf 226
cat /home/vagrant/credenciales
tput sgr0
tput setaf 153
crc console --credentials
tput sgr0

