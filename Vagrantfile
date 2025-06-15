# -*- mode: ruby -*-
# vi: set ft=ruby :

#https://github.com/hashicorp/vagrant/tree/master/keys ### rsa y rsa.pub de vagrant

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false
  config.ssh.forward_agent = true
  
  config.vm.define "crc" do |app|
  app.vm.box= "alvistack/rhel-9"
  app.vm.synced_folder ".", "/vagrant", type: "rsync", rsync__exclude: ".git/" # vagrant rsync-auto #bidireccional
  app.vm.hostname = "crc"
  app.vm.network :private_network, ip: "192.168.5.5", auto_correct: true
  app.vm.network "private_network",type: "dhcp",libvirt__network_name: "default",libvirt__host_ip: "192.168.99.5" 
  
  app.vm.provider :libvirt do |v|
     v.cpus = 4
     #v.storage :file, :size => '20G'
     v.memory = 16384
     v.driver = 'kvm'
     ######## Para el entorno grafico ##########
     v.graphics_type = "spice"
     v.video_type = "virtio"
     v.sound_type     = "ich6"
     ###########################################
     v.management_network_name = "default"
     v.management_network_address = "192.168.99.0/24"
  end 

  app.vm.provision :file do |f|
  f.source= "ficheros/psroot"
  f.destination= "/tmp/"
  end  
    
  app.vm.provision :file do |f|
  f.source= "ficheros/psuser"
  f.destination= "/tmp/"
  end   
  
  app.vm.provision :file do |f|
  f.source= "ficheros/pstudent"
  f.destination= "/tmp/"
  end 
  
  app.vm.provision :file do |f|
  f.source= "ficheros/vagrant_id_rsa"
  f.destination= "/home/vagrant/.ssh/id_rsa"
  end  
    
  app.vm.provision :file do |f|
  f.source= "ficheros/vagrant_rsa.pub"
  f.destination= "/home/vagrant/.ssh/id_rsa.pub"
  end 

  app.vm.provision :file do |f|
  f.source= "ficheros/home_vagrant_inventario"
  f.destination= "/home/vagrant/inventario"
  end

  app.vm.provision :file do |f|
  f.source= "ficheros/vimrc"
  f.destination= "/home/vagrant/.vimrc"
  end
  
  app.vm.provision :file do |f|
  f.source= "ficheros/etc_ansible_ansible.cfg"
  f.destination= "/tmp/"
  end

  app.vm.provision :file do |f|
  f.source= "ficheros/etc_hosts"
  f.destination= "/tmp/"
  end
 
  app.vm.provision :file do |f|
  f.source= "ficheros/etc_cockpit_machines.d_99-webui.json"
  f.destination= "/tmp/"
  end       

  app.vm.provision :file do |f|
  f.source= "crc/pull-secret.txt"
  f.destination= "/tmp/"
  end   

  app.vm.provision :file do |f|
  f.source= "crc/crc-linux-amd64.tar.xz"
  f.destination= "/tmp/"
  end   
 
  app.vm.provision :file do |f|
  f.source= "scripts/ros.sh"
  f.destination= "/home/vagrant/ros.sh"
  end 

  app.vm.provision :file do |f|
  f.source= "scripts/estado.sh"
  f.destination= "/home/vagrant/estado.sh"
  end 
       
  app.vm.provision "shell", path: "scripts/comun4.sh"
  app.vm.provision "shell", path: "scripts/instalar_cockpit.sh"
  app.vm.provision "provisiona_prin", type: "shell", inline: <<-'SHELL'
    sudo yum -y install figlet
    sudo figlet -c "crc" > /etc/ssh/sshd-banner
    sudo systemctl restart sshd.service 
    sudo cp /tmp/etc_hosts /etc/hosts
    # copia promt
    sudo figlet -c "prompt"
    sudo cat /tmp/psroot >>/root/.bashrc
    cat /tmp/psuser >>/home/vagrant/.bashrc
    

    sudo figlet -c "pass"
    sudo echo vagrant  | sudo passwd --stdin root 
    sudo yum -y install ansible
    chmod 600 /home/vagrant/.ssh/id_rsa.pub
    chmod 600 /home/vagrant/.ssh/id_rsa
    chmod 755 /home/vagrant/ros.sh
    chmod 755 /home/vagrant/estado.sh
    sudo cp /tmp/etc_ansible_ansible.cfg /etc/ansible/ansible.cfg
    sudo figlet -c "student"
    sudo useradd student
    sudo echo student |sudo passwd --stdin student
    sudo echo "student ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/student
   
    sudo chmod 754 /tmp/pstudent
    sudo chown student:student /tmp/pstudent
    sudo -u student bash -c 'cat /tmp/pstudent >>/home/student/.bashrc'
   

    ### Cockpit ###
    sudo mv /tmp/etc_cockpit_machines.d_99-webui.json /etc/cockpit/machines.d/05-mis_maquinas.json
    sudo chown root.root /etc/cockpit/machines.d/05-mis_maquinas.json
     
    ###############
    ### Entorno grafico ##########
    sudo figlet -c "GUI"

    sudo figlet -c "FIN"
    ##############################
  SHELL
   
  app.vm.provision "ansible" do |a|
    a.playbook = "playbooks/gui.yml"
    a.version = "latest"
    a.inventory_path = "ficheros/inventario"
    a.verbose = "vv"
    a.compatibility_mode = "2.0"
  
 
  end
  

 end  
  
end




