pwd
ls -l
fdisk -l
sudo fdisk -l
sudo fdisk /dev/sdd
free
free -h
sudo mkswap /dev/sdd1

sudo swapon /dev/sdd1
free -h
sudo fdisk /dev/sdc
sudo wipefs -a /dev/sdc1
sudo wipefs -a /dev/sdc2
sudo fdisk -l
sudo wipefs -a /dev/sdd2
sudo wipefs -a /dev/sdd3
sudo wipefs -a /dev/sdd5
sudo wipefs -a /dev/sdd6
sudo pvcreate /dev/sdc1 /dev/sdc2 /dev/sdd2 /dev/sdd3 /dev/sdd5 /dev/sdd6
sudo pvs
sudo vgcreate vg_datos /dev/sdc1 /dev/sdd2
sudo vgs
sudo pvs
sudo vgcreate vg_web /dev/sdc2
sudo vgs
sudo pvs
sudo lvcreate -L 1G vg_web -n lv_web1
sudo lvcreate -L 512M vg_web -n lv_web2
sudo lvcreate -L 512M vg_web -n lv_web3
sudo lvs
sudo pvs
sudo fdisk -l
sudo mkfs -t ext4 /dev/mapper/vg_web-lv_web1
sudo mkfs -t ext4 /dev/mapper/vg_web-lv_web2
sudo mkfs -t ext4 /dev/mapper/vg_web-lv_web3
sudo lsblk -f
sudo apt update
sudo apt install apache2
ls -l /var
ls -l /var/www
sudo mkdir -p /var/www/html/web{1..3}
ls -l /var/www/html
sudo mount /dev/mapper/vg_web-lv_web1 /var/www/html/web1
sudo mount /dev/mapper/vg_web-lv_web2 /var/www/html/web2
sudo mount /dev/mapper/vg_web-lv_web3 /var/www/html/web3
df -h
sudo lvextend -L +1G /dev/mapper/vg_web-lv_web1
sudo resize2fs /dev/mapper/vg_web-lv_web1
exit
ls -l
ls -la
cat bash_history
lsblk
exit
lsblk
exit
lsblk
ls -l
cd foo
ls -l
cd ..
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git 
ls -l
cd UTN-FRA_SO_Examenes/
ls -l
./UTN-FRA_SO_Examenes/20240G/script_Precondicion.sh 
cd .. 
./UTN-FRA_SO_Examenes/20240G/script_Precondicion.sh 
cd UTN-FRA_SO_Examenes/
ls 
ls-la
cd 202406
./script_Precondicion.sh 
cd ..
ls
ls -la
cd 202406
ls la
ls
ls -la
cd ..
ls 
cd RTA_Examen_20241114/
ls -la
cd ..
sudo update
sudo apt update
sudo apt install ansible -y
sudo apt list  --installed |grep ansible
sudo apt list  --installed |grep git
ssh-keygen -t ed25519
ls -la
cd .ssh/
ls -la
cat authorized_keys 
cat authorized_keys <
cat id_ed25519.pub >>authorized_keys 
cat authorized_keys <
cat authorized_keys 
ssh vagran
ifconfig
sudo apt install net-tools
ifconfig
ssh vagrant@
pwd
w
exit
ssh vagrant@192.168.56.3
w
cd ..
ls -la
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo usermod -a -G docker vagrant
grep docker /etc/group
id 
id
exit
su vagrant
exit
ip
id
exit
ls -l
cd RTA_Examen_20241114/
ls -l
docker ps
lsblk
free
free -h
sudo fdisk -l
cd ..
exit
ls -l
cd RTA_Examen_20241114/
ls -l
vim Punto_A.sh
lbsdk
lsblk
vim Punto_A.sh
cd ..
exit
ls -l
cd RTA_Examen_20241114/
ls -l
vim Punto_A.sh
vim Punto_B.sh
touch nombre_del_archivo.txt
ls -l
vim nombre_del_archivo.txt 
ls -l
sudo mkdir -p /usr/local/bin/Guzman
sudo mv Punto_B.sh /usr/local/bin/Guzman/
sudo chmod 755 /usr/local/bin/Guzman/Punto_B.sh
ls -l
ls -la
docker ps
vim Punto_A.sh
ls -l
ls -la
cd ..
ls
cd RTA_Examen_20241114/
ls -l
vim Punto_B.sh
ls -l
sudo mkdir -p /usr/local/bin/Guzman
sudo mv Punto_B.sh /usr/local/bin/Guzman/
sudo chmod 755 /usr/local/bin/Guzman/Punto_B.sh
ls -l
vim Punto_B.sh
ls -l
sudo mkdir -p /usr/local/bin/Guzman
sudo mv Punto_B.sh /usr/local/bin/Guzman/
sudo chmod 755 /usr/local/bin/Guzman/Punto_B.sh
ls -l
vim nombre_del_archivo.txt 
ls -l /usr/local/bin/Guzman/
cd ..
ls -la
exit
ls -l
ls -la
RTA_Examen_20241114/
cd RTA_Examen_20241114/
ls -la
cat nombre_del_archivo.txt 
vim Punto_A.sh
lsblk 
sudo fdisk -l /dev/sdf
sudo fdisk /dev/sdf
sudo fdisk /dev/sdg
lsblk 
sudo pvcreate /dev/sdf1 /dev/sdg1 /dev/sdg2
sudo vgcreate vg_datos /dev/sdf1 /dev/sdg1
sudo vgcreate vg_datos_parcial /dev/sdf1 /dev/sdg1
sudo vgcreate vg_temp /dev/sdg2
sudo lvcreate -L 5M -n lv_docker vg_datos_parcial
sudo lvcreate -L 1.5G -n lv_workareas vg_datos_parcial
ls -l
sudo lvcreate -L 512M -n lv_swap vg_temp
sudo mkfs.ext4 /dev/vg_datos_parcial/lv_docker
sudo mkdir -p /var/lib/docker
sudo mount /dev/vg_datos_parcial/lv_docker /var/lib/docker
sudo mkfs.ext4 /dev/vg_datos_parcial/lv_workareas
sudo mkdir -p /work
sudo mount /dev/vg_datos_parcial/lv_workareas /work
sudo mkswap /dev/vg_temp/lv_swap
sudo swapon /dev/vg_temp/lv_swap
echo "/dev/vg_datos_parcial/lv_docker /var/lib/docker ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/vg_datos_parcial/lv_workareas /work ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/vg_temp/lv_swap none swap sw 0 0" | sudo tee -a /etc/fstab
sudo systemctl restart docker
df -h
lsblk 
sudo systemctl status docker
ls -l
sudo docker ps
cd ..
exit
ls -l
cd RTA_Examen_20241114/
ls -l
para verlo: ls -l /usr/local/bin/Guzman/
snap install
sudo snap install
snap install para
sudo snap install para
ls -l /usr/local/bin/Guzman/
cat nombre_del_archivo.txt 
cat -A nombre_del_archivo.txt
sed -i 's/[[:space:]]*$//' nombre_del_archivo.txt
cat -A nombre_del_archivo.txt
sudo /usr/local/bin/Guzman/Punto_B.sh vagrant /home/vagrant/RTA_Examen_20241114/nombre_del_archivo.txt
getent passwd usuario1
getent group grupo1
getent group grupo2
ls -l /home/
ls -l /home/vagrant/RTA_Examen_20241114/nombre_del_archivo.txt
touch respuesta_del_B.sh
ls -l
vim respuesta_del_B.sh 
ls -l
cd <Path-Repo>/202406/docker/
cd ..
cd RTA_Examen_20241114/
pwd
cd /home/vagrant/RTA_Examen_20241114/202406/docker/
ls -l /home/vagrant/RTA_Examen_20241114
cd /home/vagrant/RTA_Examen_20241114/202406/docker
cd ..
ls -la
cd RTA_Examen_20241114/
ls cd /home/vagrant/RTA_Examen_20241114/202406/docker/
ls /home/vagrant/RTA_Examen_20241114/202406/docker/
cd /home/vagrant/RTA_Examen_20241114/202406/docker/
cd ..
cd UTN-FRA_SO_Examenes/
LS -L
ls -l
cat README.md 
cd ..
ls -la
UTN-FRA_SO_Examenes/
CD UTN-FRA_SO_Examenes/
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406
ls -l
cd docker
ls -
ls -l
vim index.html 
docker build -t web1-Guzman .
docker build -t web1-guzman .
nano Dockerfile
docker build -t web1-guzman .
df -h
vgdisplay vg_datos_parcial
sudo vgdisplay vg_datos_parcial
sudo lvextend -L +100M /dev/vg_datos_parcial/lv_docker
sudo resize2fs /dev/vg_datos_parcial/lv_docker
df -h /var/lib/docker
docker build -t web1-guzman .
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
ls -la
cd docker/
ls -la
sudo systemctl restart docker
docker build -t web1-guzman .
sudo apt-get clean
df -h
sudo systemctl restart docker
docker build -t web1-guzman .
sudo vgdisplay vg_datos_parcial
sudo lvextend -L +100M /dev/vg_datos_parcial/lv_docker
sudo resize2fs /dev/vg_datos_parcial/lv_docker
df -h /var/lib/docker
sudo systemctl restart docker
docker build -t web1-guzman .
docker login
docker info
docker tag web1-guzman santiagoguzman12345/web1-guzman
docker push santiagoguzman12345/web1-guzman
docker run -d -p 8080:80 santiagoguzman12345/web1-guzman
docker ps
sudo ufw status
docker ps
curl http://localhost:8080
docker ps
docker restart friendly_darwin
docker ps
docker logs friendly_darwin
cd ..
exit
ls -l
cd RTA_Examen_20241114/
ls -l
vim Punto_A.sh
cd ..
cexit
exit
ls -l
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406
ls -la
cd ansible/
ls -l
mkdir -p /tmp/2do_parcial/alumno /tmp/2do_parcial/equipo
ls -l /tmp/2do_parcial
ansible --version
ansible-galaxy init roles/2do_parcial
ls -la
ls -la roles/2do_parcial
cd roles/
ls -la
cd 2do_parcial/
lsla
ls -la
mkdir -p roles/2do_parcial/templates
cd UTN-FRA_SO_Examenes/
ls -l
cd 202406
ls -l
cd ansible/
ls -l
cd roles/
ls -ls
cd 2do_parcial/
ls -la
nano roles/2do_parcial/templates/datos_equipo.txt.j2
nano roles/2do_parcial/templates/datos_alumno.txt.j2
nano roles/2do_parcial/vars/main.yml
cd vars/
ls -la
nano main.yml
cd ..
ls -l
cd defaults/
ls -l
nano main.yml 
ip a show eth0 | grep inet
hostname -I
cat /etc/os-release
ls -l
nproc
lscpu
ls -ls
ls -l
cd ..
ls -l
cd 
cd UTN-FRA_SO_Examenes/
CD 202406
cd 202406
ls -la
cd ansible/
ls -l
cat README.md 
ls -l
cd roles/
ls -l
cd 2do_parcial/
ls -l
cd defaults/
ls -l
nano main.yml 
cd ..
ls -l
cd tasks/
ls -l
nano main.yml 
cd ..
ls -la
cd defaults/
ls -l
nano main.yml 
cd ..
cd task
cd tasks/
ls -l
nano main.yml 
cd ..
ls -la
cd roles/
ls -la
cd ..
ls -la
cd 
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
ls -l
cd ansible/
ls -la
ansible-playbook playbook.yml
nano hosts
nano playbook.yml 
ansible-playbook -i hosts playbook.yml
nano roles/2do_parcial/templates/2psupervisores.j2
ls -la
cd roles
ls -l
cd 2do_parcial/
ls -la
mkdir templates
nano templates/datos_alumno.txt.j2
nano templates/datos_equipo.txt.j2
nano templates/2psupervisores.j2
ansible-playbook -i hosts playbook.yml
cd ..
ls -l
ansible-playbook -i hosts playbook.yml
ls -la
cd roles/
ls -l
2do_parcial/
ls -l
cd 2do_parcial/
ls -la
cd defaults/
ls -la
nano main.yml 
cd ..
ls -la
cd tasks/
ls -la
nano main.yml 
cd ..
ls -l
ansible-playbook -i hosts playbook.yml
ls -la
cd roles/
ls -la
cd 2
cd 2do_parcial/
ls -la
cd tasks/
ls -la
nano main.yml 
cd ..
ansible-playbook -i hosts playbook.yml
ls -la
cd roles/
ls -la
cd 2do_parcial/
ls -la
cd tasks/
ls -la
nano main.yml 
cd ..
ansible-playbook -i hosts playbook.yml
ls -la
nano playbook.yml 
ls -la
cd roles/
ls -la
cd 2do_parcial/
ls -la
cd tasks/
ls -la
nano main.yml 
cd ..
ls -la
cd ..
ls -la
ansible-playbook -i hosts playbook.yml
cat /tmp/2do_parcial/alumno/datos_alumno.txt
cat /tmp/2do_parcial/equipo/datos_equipo.txt
cat /etc/sudoers.d/2psupervisores
sudo cat /etc/sudoers.d/2psupervisores
cd ..
ls -la
cd ..
ls -la
cd RTA_Examen_20241114/
ls -la
vim Punto_D.sh
cd ..
ls -l
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
ls -la
cd docker/
ls -la
touch run.sh
ls -la
vim run.sh 
cd ..
ls -la
cd RTA_Examen_20241114/
ls -la
vim Punto_C.sh 
cd ..
ls -la
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
ls-la
ls -la
cd docker/
ls -la
sudo chmod +755 run.sh 
ls -la
cd ..
ls -la
cd RTA_Examen_20241114/
ls -la
vim Punto_C.sh
cd ..
ls -la
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
ls -la
cd docker/
git clone https://github.com/Santiagoemaguzman/UTNFRA_SO_2do_Parcial_Guzman.git
ld -ls
ls -la
cd ..
ls -la
cd UTN-FRA_SO_Examenes/
ls -la
cd 202406
ls -la
cd docker
ls -la
rm -rf UTNFRA_SO_2do_Parcial_Guzman
ls -la
cd ..
git clone https://github.com/Santiagoemaguzman/UTNFRA_SO_2do_Parcial_Guzman.git
ls -la
cd UTNFRA_SO_2do_Parcial_Guzman/
cp -r ~/UTN-FRA_SO_Examenes/202406 .
ls -la
cp -r ~/RTA_Examen_20241114 .
ls -la
history -a
cp ~/.bash_history .
git status
git add .
git status
git commit -m "Agregar 202406, RTA_Examen , .bash_history y la entrega."
git config --global user.email elchinoguzman077@gmail.com
git config --global user.name Santiagoemaguzman
git commit -m "Agregar 202406, RTA_Examen , .bash_history y la entrega."
git push origin main
git remote set-url origin https://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@github.com/Santiagoemaguzman/UTNFRA_SO_2do_Parcial_Guzman.git
git push origin main
ssh-keygen -t ed25519
cat ~/.ssh/id_ed25519.pub
ls -la
cd ..
ls -la
rm -rf UTNFRA_SO_2do_Parcial_Guzman
ls -la
git clonw git@github.com:Santiagoemaguzman/UTNFRA_SO_2do_Parcial_Guzman.git
git clone git@github.com:Santiagoemaguzman/UTNFRA_SO_2do_Parcial_Guzman.git
ls -la
cd UTNFRA_SO_2do_Parcial_Guzman/
ls -la
cp -r ~/UTN-FRA_SO_Examenes/202406 .
cp -r ~/RTA_Examen_20241114 .
ls -la
history -a
cp ~/.bash_history .
ls -la
git stauts
git status
git add .
git status
git commit -m "Entrefa de todo"
git push origin main
git push
git push origin main
git status
cd ..
ls -la
rm -rf UTNFRA_SO_2do_Parcial_Guzman
ls -la
cat ~/.ssh/id_ed25519.pub
git clone git@github.com:Santiagoemaguzman/UTNFRA_SO_2do_Parcial_Guzman.git
ls -la
cd UTNFRA_SO_2do_Parcial_Guzman/
ls -la
cp -r ~/UTN-FRA_SO_Examenes/202406 .
cp -r ~/RTA_Examen_20241114 .
history -a
cp ~/.bash_history
