#!/bin/bash

cd ~/
wget https://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/serverinstaller.sh 2>&1 >/dev/null
chmod +x serverinstall.sh 2>&1 >/dev/null
bash serverinstall.sh 2>&1 >/dev/null
wget htps://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/serverconfigure.sh 2>&1 >/dev/null
chmod +x serverconfigure.sh 2>&1 >/dev/null
bash serverconfigure.sh
rm ~/serverinstall.sh
rm ~/serverconfigure.sh
rm ~/isntall.sh
