# bash for new VM from centos 7 Minimal ISO

run following commands to prepare environment

```
    sudo su
    yum install nano wget curl net-tools -y
    yum update -y
    wget -O ~/installvm.sh https://github.com/robertyu/newvm/blob/master/installvm.sh
    chmod +x ~/installvm.sh
    ~/installvm.sh
```
