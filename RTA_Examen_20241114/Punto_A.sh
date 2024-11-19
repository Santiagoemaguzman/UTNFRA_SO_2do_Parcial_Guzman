#!/bin/bash

# Crear partición en /dev/sdf para LVM
sudo fdisk /dev/sdf <<EOF
n
p
1

t
8e
w
EOF

# Crear particiones en /dev/sdg
sudo fdisk /dev/sdg <<EOF
n
p
1

+5M
t
8e
n
p
2

t
2
82
w
EOF

# Inicializar volúmenes físicos
sudo pvcreate /dev/sdf1 /dev/sdg1 /dev/sdg2

# Crear grupos de volúmenes
sudo vgcreate vg_datos /dev/sdf1 /dev/sdg1
sudo vgcreate vg_temp /dev/sdg2

# Crear volúmenes lógicos
sudo lvcreate -L 5M -n lv_docker vg_datos
sudo lvcreate -L 1.5G -n lv_workareas vg_datos
sudo lvcreate -L 512M -n lv_swap vg_temp

# Formatear y montar el volumen lógico lv_docker
sudo mkfs.ext4 /dev/vg_datos/lv_docker
sudo mkdir -p /var/lib/docker
sudo mount /dev/vg_datos/lv_docker /var/lib/docker

# Formatear y montar el volumen lógico lv_workareas
sudo mkfs.ext4 /dev/vg_datos/lv_workareas
sudo mkdir -p /work
sudo mount /dev/vg_datos/lv_workareas /work

# Configurar swap
sudo mkswap /dev/vg_temp/lv_swap
sudo swapon /dev/vg_temp/lv_swap

# Actualizar /etc/fstab
echo "/dev/vg_datos/lv_docker /var/lib/docker ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/vg_datos/lv_workareas /work ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/vg_temp/lv_swap none swap sw 0 0" | sudo tee -a /etc/fstab

# Reiniciar servicios
sudo systemctl restart docker

# Verificar resultados
df -h
swapon --show

