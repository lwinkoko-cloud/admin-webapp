#!/bin/bash

SERVER_FOLDER="mobilex-admin-portal"

echo "Removing existing files"
sudo rm -rf /var/www/${SERVER_FOLDER}

sudo su - <<EOF
    cd /var/www/

    echo "Cloning git repo"
    git clone git@gitlab.com:ayainnovation/mobilex-admin-portal.git
    cd /var/www/${SERVER_FOLDER}
    sudo git checkout sit-release

    npm install -g npm@latest
    npm install
    npm run build

EOF

sudo pm2 restart all
sudo pm2 save

echo "Finished Deploying MobileX AdminPortal!"