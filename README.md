# Instalación de ansible en el host

```
yum install epel-release
yum install ansible
```


# Obtener módulos desde Ansible Galay

```
ansible-galaxy install geerlingguy.mysql
ansible-galaxy collection install nginxinc.nginx_core
ansible-galaxy install geerlingguy.repo-remi
ansible-galaxy install geerlingguy.repo-epel
ansible-galaxy install geerlingguy.php
ansible-galaxy install geerlingguy.php-mysql

ansible-galaxy collection install geerlingguy.php_roles




git clone https://github.com/nginxinc/ansible-role-nginx.git
mv ansible-role-nginx ~/.ansible/roles/
```

#Editar las varibles requeridas para mySQL

```
vim /root/.ansible/roles/geerlingguy.mysql/defaults/main.yml
```



# Ejecutar el playbook de instalación de mysql

```
ansible-playbook \
--connection=local \
--limit 127.0.0.1 mysql_playbook.yml -i ansible_hosts
```


# Ejecutar el playbook de instalación de nginx

```
ansible-playbook \
--connection=local \
--limit 127.0.0.1 nginx_playbook.yml -i ansible_hosts
```




# Probar conexión con el manejador de mySQL

```
mysql -u root -h 127.0.0.1 -P 3306
```

# Paquetes adicionales requeridos

dnf install -y php-json
dnf install -y strace
dnf search php | grep zip
dnf install -y php72-libzip
dnf search pecl | grep zip
dnf install -y php-pecl-zip


# Ejecutar el build del contenedor

podman build --rm --no-cache -t sotolito/pos .