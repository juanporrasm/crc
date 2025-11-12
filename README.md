# $\textsf{\color{#1761f8}{Nota:}}$
-----
##  $\textsf{\color{#129C00}{CRC}}$
En la carpta CRC añade tu pull-secret.txt . 
Lo puedes bajar de: https://console.redhat.com/openshift/create/local
## $\textsf{\color{#129C00}{Scripts}}$
En la carpeta scripts, en el script comun4.sh, modifica la linea 7:
``` bash
sudo subscription-manager register --username="TU_USUARIO" --password="TU_CONTRASEÑA"
```
## $\textsf{\color{#129C00}{Acceso}}$
Se crea un fichero llamado **credenciales** en el home de vagrant, para poder acceder, a la consola y a la API.
