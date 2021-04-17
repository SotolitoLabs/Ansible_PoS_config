FROM centos/systemd

MAINTAINER "SotolitoLabS <dev@sotolitolabs.com>"

RUN yum -y install epel-release && \
    yum -y install ansible

RUN ansible-galaxy install geerlingguy.mysql              && \
    ansible-galaxy collection install nginxinc.nginx_core && \
    ansible-galaxy install geerlingguy.repo-remi          && \  
    ansible-galaxy install geerlingguy.repo-epel          && \ 
    ansible-galaxy install geerlingguy.php                && \ 
    ansible-galaxy install geerlingguy.php-mysql          && \ 
    ansible-galaxy collection install geerlingguy.php_roles


COPY ansible_hosts /root/

COPY files/mysql_config.yml /root/.ansible/roles/geerlingguy.mysql/defaults/main.yml
COPY mysql_playbook.yml /root/

RUN ansible-playbook   \
    --connection=local \
    --limit 127.0.0.1 /root/mysql_playbook.yml -i /root/ansible_hosts


# RUN yum -y install httpd; yum clean all; systemctl enable httpd.service

#EXPOSE 80

CMD ["/usr/sbin/init"]
