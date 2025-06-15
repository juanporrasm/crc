tar xvf /tmp/crc-linux-amd64.tar.xz
rm /tmp/crc-linux-amd64.tar.xz
mkdir /home/vagrant/bin
cp /home/vagrant/crc-linux-*-amd64/crc /home/vagrant/bin/
cp /tmp/pull-secret.txt /home/vagrant/bin/
export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> /home/vagrant/.bashrc
/home/vagrant/bin/crc config set consent-telemetry no

echo -e "/home/vagrant/bin/crc setup
/home/vagrant/bin/crc start -p /home/vagrant/bin/pull-secret.txt"> /home/vagrant/ejecuta.sh
chmod 755 /home/vagrant/ejecuta.sh

echo -e "crc oc-env
eval $(crc oc-env)
crc completion bash > /home/vagrant/.crc_bash_completion.sh
echo 'source /home/vagrant/.crc_bash_completion.sh' >> /home/vagrant/.bashrc
oc completion bash > /home/vagrant/.oc_bashcompletion.sh
echo 'source home/vagrant/.oc_bashcompletion.sh' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc" > /home/vagrant/ejecuta2.sh
chmod 755 /home/vagrant/ejecuta2.sh


/home/vagrant/ejecuta.sh   
/home/vagrant/ejecuta2.sh     

        
