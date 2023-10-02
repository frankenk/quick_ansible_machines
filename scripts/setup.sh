#!/bin/bash

function setup_yum() {
    echo "Updating applications"
    yum update -y -q

    echo "Setting up daily security updates"
    (crontab -l 2>/dev/null; \
    echo "40 0 * * * /usr/bin/yum update -y --security") | crontab -
}

function install_packages() {
   YUM_PACKAGES='jq'
   AMA_EXTRA_PKG='ansible2'

   echo "Installing YUM packages: $YUM_PACKAGES"
   yum -q -y install $YUM_PACKAGES

   echo "Installing amazon-linux-extras package: $AMA_EXTRA_PKG"
   amazon-linux-extras install $AMA_EXTRA_PKG -y
}

function add_ssh_keys() {
    echo '<<add your public key>>' >> /home/ec2-user/.ssh/authorized_keys
}

# Call the functions
add_ssh_keys
setup_yum
install_packages