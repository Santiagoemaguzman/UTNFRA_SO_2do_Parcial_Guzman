#!/bin/bash

# Pasos que segui para realizar este punto:

# Navegar al directorio de proyecto
cd ~/UTN-FRA_SO_Examenes/202406/ansible

# Creo/modifico el archivo de inventario
cat <<EOL > hosts
[local]
localhost ansible_connection=local
EOL

# verifico el archivo de playbook, tiene que tener algo asi:
cat <<EOL > playbook.yml
---
- hosts: all
  become: true

  tasks:
    - include_role:
        name: 2do_parcial

    - name: "Otra tarea"
      debug:
        msg: "Despues de la ejecucion del rol"
EOL

# Creo la estructura de roles y directorios
mkdir -p roles/2do_parcial/{defaults,tasks,templates}

#en resumen en el punto anterior hice esto:
# Crear la estructura de directorios
mkdir -p /tmp/2do_parcial/alumno
mkdir -p /tmp/2do_parcial/equipo

# Crear los archivos vacíos
touch /tmp/2do_parcial/alumno/datos_alumno.txt
touch /tmp/2do_parcial/equipo/datos_equipo.txt


# Configurar/completar el defaults/main.yml con mis datos:
cat <<EOL > roles/2do_parcial/defaults/main.yml
---
# defaults file for 2do_parcial
nombre: "santiago"
apellido: "guzman"
division: "113"
ip: "192.168.56.3"
distro: "Ubuntu 22.04.4 LTS (Jammy Jellyfish)"
cores: "2"
EOL

# Codear/hacer el archivo tasks/main.yml
cat <<EOL > roles/2do_parcial/tasks/main.yml
---
# tasks file for 2do_parcial

- debug:
    msg: "Tareas del 2do Parcial"

- name: Crear directorio alumno
  file:
    path: /tmp/2do_parcial/alumno
    state: directory

- name: Crear directorio equipo
  file:
    path: /tmp/2do_parcial/equipo
    state: directory

- name: Generar archivo datos_alumno.txt
  template:
    src: datos_alumno.txt.j2
    dest: /tmp/2do_parcial/alumno/datos_alumno.txt

- name: Generar archivo datos_equipo.txt
  template:
    src: datos_equipo.txt.j2
    dest: /tmp/2do_parcial/equipo/datos_equipo.txt

- name: Configurar sudo sin contraseña para el grupo 2PSupervisores
  lineinfile:
    path: /etc/sudoers.d/2psupervisores
    state: present
    create: yes
    line: '%2PSupervisores ALL=(ALL) NOPASSWD: ALL'

- name: Validar configuración sudoers
  command: visudo -cf /etc/sudoers.d/2psupervisores
  register: visudo_check
  failed_when: visudo_check.rc != 0
EOL

# Creo el archivo de plantilla para datos_alumno.txt.j2
cat <<EOL > roles/2do_parcial/templates/datos_alumno.txt.j2
Nombre: {{ nombre }}
Apellido: {{ apellido }}
Division: {{ division }}
EOL

# Creo el archivo de plantilla para datos_equipo.txt.j2
cat <<EOL > roles/2do_parcial/templates/datos_equipo.txt.j2
IP: {{ ip }}
Distribución: {{ distro }}
Cantidad de Cores: {{ cores }}
EOL

# Creo el archivo de plantilla para 2psupervisores.j2(me tiraba error si no)
cat <<EOL > roles/2do_parcial/templates/2psupervisores.j2
%2PSupervisores ALL=(ALL) NOPASSWD: ALL
EOL

# Ejecutar el playbook
ansible-playbook -i hosts playbook.yml

