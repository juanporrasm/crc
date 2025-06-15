#!/bin/bash
estado=$(crc status|head -1|awk '{print $3}')
if [[ $estado = "Stopped" ]]; then 
   echo "parado"
   echo $estado
   echo "Lo arranco"
   crc start |tee -a credenciales
else 
  echo "Arrancado"
  echo $estado
fi


