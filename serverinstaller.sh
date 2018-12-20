#!/bin/bash
##
## OpsPrime VPN Server Installer Script
## by M4rshall
##
## Copyright (c) OpsPrime VPN 2018. All Rights Reserved
##


## Check if VPS have root access
if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit
fi

## Check if TUN Device is available
if [[ ! -e /dev/net/tun ]]; then
	echo "The TUN device is not available
You need to enable TUN before running this script"
	exit
fi

## Check if VPS have Debian OS
if [[ -e /etc/debian_version ]]; then
	OS=debian
	GROUPNAME=nogroup
	RCLOCAL='/etc/rc.local'
else
	echo "Looks like you aren't running this installer on Debian, Ubuntu or CentOS"
	exit
fi

## GET REAL IP
if [[ "$PUBLICIP" != "" ]]; then
	IP=$PUBLICIP
fi

## Updating System and Installing OpenVPN and other Application
apt-get update
apt-get install openvpn squid ufw mysql-client unzip -y

## Packet Forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward
sed -i '/net.ipv4.ip_forward=1/s/^#//g' /etc/sysctl.conf
ufw allow ssh
ufw allow 443/tcp
ufw allow 8000/tcp
sed -i 's|DEFAULT_INPUT_POLICY="DROP"|DEFAULT_INPUT_POLICY="ACCEPT"|' /etc/default/ufw
sed -i 's|DEFAULT_FORWARD_POLICY="DROP"|DEFAULT_FORWARD_POLICY="ACCEPT"|' /etc/default/ufw
cd /etc/ufw/
wget "https://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/before.rules" 
echo y | ufw enable

## Configure Squid Proxy
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/squid.conf" 
IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
sed -i "s/ipmokasito/$IP/g" /etc/squid3/squid.conf

## Download OpenVPN Files
cd /etc/openvpn/
rm *
wget "https://github.com/j4m3sr0i/zCYtL1y65U/raw/master/openvpn.zip"
unzip openvpn.zip
rm openvpn.zip

## Download User Count Script
cd ~
wget "https://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/users.sh"
crontab -l > mycron
echo "* * * * * ~/users.sh" >> mycron
crontab mycron
rm mycron

## Setting Permission
chmod +x ~/users.sh
chmod +x /etc/openvpn/login.sh

## Start OpsPrime VPN
service openvpn restart
service squid3 restart
clear
ovpn=openvpn
proxy=squid3
if (( $(ps -ef | grep -v grep | grep $ovpn | wc -l) > 0 ))
	then
	echo "OpenVPN is Running"
	else
	echo "Error Starting OpenVPN. Please contact M4rshall"
fi
if (( $(ps -ef | grep -v grep | grep $proxy | wc -l) > 0 ))
	then
	echo "Squid Proxy is Running"
	else
	echo "Error Starting Squid Proxy. Please contact M4rshall"
fi
