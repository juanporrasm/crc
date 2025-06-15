sudo yum -y install  cockpit   
#sudo yum -y install   cockpit-system  cockpit-ws  sos  cockpit-doc 
# cockpit-bridge  lynx lsof vim tree cockpit-pcp cockpit-packagekit cockpit-networkmanager  cockpit-storaged cockpit-tests cockpit-docker

#sudo firewall-cmd --add-service=cockpit
#sudo firewall-cmd --add-service=cockpit --permanent
sudo  systemctl start cockpit  
#sudo  systemctl enable cockpit 
#sudo  systemctl enable cockpit.socket 
sudo systemctl enable --now cockpit.socket
