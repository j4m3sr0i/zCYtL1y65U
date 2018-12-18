#!/bin/bash
##
## OpsPrime VPN Server Configure Script
## by M4rshall
##
## Copyright (c) OpsPrime VPN 2018. All Rights Reserved
##


clear
echo "Welcome to M4rshall's Server Configure Script"
echo "for OpsPrime VPN"
echo ""
echo "Please type the Server Prefix"
read -p "Prefix: " -e -i Prefix01 ServerPrefix
echo ""
echo "Please type the Database IP"
read -p "IP: " -e -i 127.0.0.1 DBhost
echo ""
echo "Please type the Database Username"
read -p "DB Username: " -e -i m4rshall DBuser
echo ""
echo "Please type the Database Password"
read -p "DB Password: " -e -i m4rshall DBpass
echo ""
echo "Please type the Database Name"
read -p "DB Password: " -e -i m4rshall DBname
echo ""
echo "Okay, that's all I need. We are ready to setup your Panel now"
read -n1 -r -p "Press any key to continue..."

## Configure Website
sed -i "s/DBhost/$DBhost/g" ~/users.sh
sed -i "s/DBuser/$DBuser/g" ~/users.sh
sed -i "s/DBpass/$DBpass/g" ~/users.sh
sed -i "s/DBname/$DBname/g" ~/users.sh
sed -i "s/ServerPrefix/$ServerPrefix/g" ~/users.sh

sed -i "s/DBhost/$DBhost/g" /etc/openvpn/login.sh
sed -i "s/DBuser/$DBuser/g" /etc/openvpn/login.sh
sed -i "s/DBpass/$DBpass/g" /etc/openvpn/login.sh
sed -i "s/DBname/$DBname/g" /etc/openvpn/login.sh
sed -i "s/ServerPrefix/$ServerPrefix/g" /etc/openvpn/login.sh