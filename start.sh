#!/usr/bin/env bash

# Boot a Live Linux Mint 18.x image (CD, DVD, USB Flash Drive, ISO, etc.)
# Type the following commands in the new live enviornment:
#     passwd
#     sudo su
#     apt install -y ssh
#     sed -i 's/^#(PasswordAuthentication)/\1/' /etc/ssh/sshd_config
#     sed -i 's/^(ssh.*)$/\1mint/' /etc/group
#     systemctl start sshd
#     ip addr | grep 'inet ' | grep -v ' lo' | awk '{print $2}' | cut -f1 -d/
#
    # Note: If running the live image inside a virtual machine, mount the folder:
    #     sudo mount -t vboxsf shared_folder_name /mnt

ip_addr=${1}
username=xubuntu

if [[ "${ip_addr}" = "usb" ]]; then
    cp -r bin /tmp/
    cd /tmp/bin
    time bash /tmp/bin/setup.sh "usb"
elif [[ "${ip_addr}" = "git" ]]; then
    time bash ./bin/setup.sh "git"
else
    ssh_options='-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
    scp -r $ssh_options bin ${username}@${ip_addr}:/tmp/
    time ssh $ssh_options ${username}@${ip_addr} bash /tmp/bin/setup.sh "net"
fi
