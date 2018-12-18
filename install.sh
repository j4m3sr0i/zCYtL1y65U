#!/bin/bash

cd ~/
curl --request GET --header 'PRIVATE-TOKEN: MykKrUmaQZts1F9QoF6W' 'https://gitlab.com/api/v4/projects/9957454/repository/files/serverinstall.sh/raw?ref=master' 2>&1 >/dev/null
chmod +x serverinstall.sh 2>&1 >/dev/null
bash serverinstall.sh 2>&1 >/dev/null
curl --request GET --header 'PRIVATE-TOKEN: MykKrUmaQZts1F9QoF6W' 'https://gitlab.com/api/v4/projects/9957454/repository/files/serverconfigure.sh/raw?ref=master' 2>&1 >/dev/null
chmod +x serverconfigure.sh 2>&1 >/dev/null
bash serverconfigure.sh
rm ~/serverinstall.sh
rm ~/serverconfigure.sh
rm ~/isntall.sh