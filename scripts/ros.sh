sudo figlet -c "INI CRC"
tar xvf /tmp/crc-linux-amd64.tar.xz
rm /tmp/crc-linux-amd64.tar.xz
mkdir /home/vagrant/bin
cp /home/vagrant/crc-linux-*-amd64/crc /home/vagrant/bin/
cp /tmp/pull-secret.txt /home/vagrant/bin/
export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> /home/vagrant/.bashrc
/home/vagrant/bin/crc config set consent-telemetry no

/home/vagrant/bin/crc setup
/home/vagrant/bin/crc start -p /home/vagrant/bin/pull-secret.txt

crc stop
crc config set disk-size 50
crc config set memory 15555
crc config set cpus 4
crc start
crc oc-env

eval $(crc oc-env)
echo 'eval $(crc oc-env)' >> /home/vagrant/.bashrc
crc completion bash > /home/vagrant/.crc_bash_completion.sh
echo 'source /home/vagrant/.crc_bash_completion.sh' >> /home/vagrant/.bashrc
oc completion bash > /home/vagrant/.oc_bashcompletion.sh
echo 'source /home/vagrant/.oc_bashcompletion.sh' >> /home/vagrant/.bashrc
echo "/home/vagrant/estado.sh" >> /home/vagrant/.bashrc
echo 'echo "Ejecutar crc console, para ver la consola"' >> /home/vagrant/.bashrc
echo 'echo "crc console --credentials para ver las credenciales"' 
source /home/vagrant/.bashrc  >> /home/vagrant/.bashrc
echo "alias odev='oc login -u developer -p developer https://api.crc.testing:6443'" >> /home/vagrant/.bashrc

sudo figlet -c "FIN CRC"    

crc stop

sudo systemctl reboot

