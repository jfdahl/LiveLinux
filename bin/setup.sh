#!/usr/bin/env bash

install_mode=${1}

if [[ "$USER" == "xubuntu" ]] && [[ "$HOSTNAME" == "xubuntu" ]]; then
    
elif [[ "$USER" == "mint" ]] && [[ "$HOSTNAME" == "mint" ]]; then

fi

# Setup working folder
current_location=$(pwd)

#  Set system timezone
sudo ln -fs /usr/share/zoneinfo/US/Central /etc/localtime

# Configure package manager.
# sudo sed -i.bak 's|http://archive|http://us.archive|g' /etc/apt/sources.list
# sudo apt-get update -qq

# Disable IPV6 (Broken in Mint live):
# cat << EOF | sudo tee -a /etc/sysctl.conf > /dev/null
# net.ipv6.conf.all.disable_ipv6 = 1
# net.ipv6.conf.default.disable_ipv6 = 1
# net.ipv6.conf.lo.disable_ipv6 = 1
# EOF
# EXECUTE WHEN THIS SCRIPT COMPLETES: sudo service networking restart

# Setup user
./configure_user.sh

# Final action:
# Setup firewall
sudo ufw allow ssh
sudo ufw default deny
sudo ufw enable

# sudo service networking restart
