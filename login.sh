#!/bin/bash
##
## OpsPrime VPN Authentication Script
## by M4rshall
##
## Copyright (c) OpsPrime VPN 2018. All Rights Reserved
##

user_id=$(mysql -hDBhost -P3306 -uDBuser -pDBpass DBname -sN -e "SELECT user_name FROM users WHERE user_name = '$username' AND user_pass = '$password' AND user_server = 'ServerPrefix'")
[ "$user_id" != '' ] && [ "$user_id" = "$username" ] && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
