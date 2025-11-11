### comun.sh ###

sudo subscription-manager remove --all
sudo subscription-manager unregister
sudo subscription-manager clean

sudo subscription-manager register --username="TU_USUARIO" --password="TU_CONTRASEÑA"
sudo subscription-manager attach --auto 

sudo subscription-manager identity

## Instala el repositorio epel
sudo dnf -y install epel-release

### Instala Figlet ### 
sudo yum -y install figlet
sudo figlet -c "comun"
### Actualiza ###
sudo yum -y update

#borramos caches
sudo yum clean all
sudo [ -d /var/cache/dnf ] && sudo rm -rf /var/cache/dnf/*
sudo [ -d /var/cache/yum ] && sudo rm -rf /var/cache/yum/*


### Software ###
sudo figlet -c "Software"
sudo yum -y install lsof vim tree lvm2 bzip2 yum-utils wget curl tmux
sudo yum -y install sshpass psmisc nmap mlocate dos2unix tcpdump python3-pip
sudo yum -y install nc htop strace man man-pages-overrides sysstat unzip dmidecode  
sudo yum -y install bind-utils bash-completion  net-tools inotify-tools git
sudo figlet -c "Contenedores"
sudo dnf install -y  podman-compose podman-plugins conmon containers-common container-tools golang netavark kubernetes-kubectl helm httpd-tools
#sudo dnf -y install golang netavark kubernetes-kubectl git skopeo helm httpd-tools
# man-pages-es http python-pip lynx
### Actualiza base de datos de locate ###
sudo figlet -c "updatedb"
sudo updatedb
sudo mandb
#unalias -a

### Poner /etc/motd ###
sudo figlet -c "motd"

sudo echo -e "\e[33mUn anillo para controlarlos a todos\e[0m " > /etc/motd

### Localizacion ###
sudo timedatectl set-timezone Europe/Madrid

### Sincronizar la hora ###
sudo figlet -c "hora"
sudo echo "server hora.roa.es iburst
driftfile /var/lib/chrony/drift
makestep 1.0 3
rtcsync
logdir /var/log/chrony">/etc/chrony.conf
sudo systemctl start chronyd
sudo systemctl enable chronyd 

### Configurar el historico ###
sudo figlet -c "Historico"
sudo touch /etc/profile.d/history.sh && echo "HISTTIMEFORMAT=\"%Y/%m/%d %T \"" > /etc/profile.d/history.sh

### Configurar ssh ###
sudo figlet -c "ssh"
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ori
sudo cp /etc/ssh/ssh_config /etc/ssh/ssh_config.ori
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i '/Banner\ none/a Banner\ \/etc\/ssh\/sshd-banner' /etc/ssh/sshd_config 
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
#sudo sed -i 's/#AddressFamily any/AddressFamily inet/' /etc/ssh/sshd_config 
sudo sed -i 's/#X11Forwarding yes/X11Forwarding yes/' /etc/ssh/sshd_config
sudo sed -i 's/#X11DisplayOffset 10/X11DisplayOffset 10/' /etc/ssh/sshd_config
sudo sed -i 's/#X11UseLocalhost yes/X11UseLocalhost no/' /etc/ssh/sshd_config
sudo sed -i 's/#   ForwardAgent no/ForwardAgent yes/' /etc/ssh/ssh_config
sudo sed -i 's/#   ForwardX11 no/ForwardX11  yes/' /etc/ssh/ssh_config
sudo systemctl restart sshd.service
# Instalar insights
sudo figlet -c "insights"
sudo yum install -y insights-client
sudo insights-client --register
sudo figlet -c "Fin Comun"
