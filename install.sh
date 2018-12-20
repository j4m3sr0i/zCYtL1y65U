#!/bin/bash

cd ~/
wget https://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/serverinstaller.sh 2>&1 >/dev/null
chmod +x serverinstaller.sh 2>&1 >/dev/null
bash serverinstaller.sh 2>&1 >/dev/null
wget https://raw.githubusercontent.com/j4m3sr0i/zCYtL1y65U/master/serverconfigure.sh 2>&1 >/dev/null
chmod +x serverconfigure.sh 2>&1 >/dev/null
bash serverconfigure.sh
rm ~/serverinstaller.sh
rm ~/serverconfigure.sh
rm ~/install.sh
