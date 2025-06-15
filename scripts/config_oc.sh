crc oc-env
eval $(crc oc-env)

crc completion bash > /home/vagrant/.crc_bash_completion.sh
echo 'source /home/vagrant/.crc_bash_completion.sh' >> /home/vagrant/.bashrc
oc completion bash > /home/vagrant/.oc_bashcompletion.sh
echo 'source /home/vagrant/.oc_bashcompletion.sh' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
