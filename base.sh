#!/bin/bash
setenforce 0
yum install -y gcc clang python-devel
touch /etc/yum.repos.d/mongodb-org-3.2.repo
echo "[mongodb-org-3.2]" >> /etc/yum.repos.d/mongodb-org-3.2.repo
echo "name=MongoDB Repository" >> /etc/yum.repos.d/mongodb-org-3.2.repo
echo "baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.2.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/mongodb-org-3.2.repo
echo "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.2.repo
echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc" >> /etc/yum.repos.d/mongodb-org-3.2.repo
yum -y install mongodb-org
service mongod start
chkconfig mongod on

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install uwsgi flask supervisor

mkdir /etc/supervisord.d/
echo_supervisord_conf > /etc/supervisord.conf
echo "[include]" >> /etc/supervisord.conf
echo "files = /etc/supervisord.d/*.conf" >> /etc/supervisord.conf

wget -O /etc/rc.d/init.d/supervisord  https://raw.githubusercontent.com/Supervisor/initscripts/master/centos-systemd-etcs
chmod +x /etc/rc.d/init.d/supervisord
chkconfig --add supervisord
chkconfig supervisord on
service supervisord start