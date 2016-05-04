# bash for new VM from centos 7 Minimal ISO

run following commands to prepare environment

```
    sudo su
    yum install nano wget curl net-tools -y
    yum update -y
    wget -O ~/installvm.sh https://raw.githubusercontent.com/robertyu/newvm/master/base.sh
    chmod +x ~/installvm.sh
    ~/installvm.sh
```
