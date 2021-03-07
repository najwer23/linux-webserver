#!/bin/sh
# chmod 755 apachephp74.sh
# ./apachephp74.sh

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.4 php7.4-cli php-7.4fpm php-7.4json php-7.4common php-7.4mysql php-7.4zip php-7.4gd php-7.4mbstring php-7.4curl php-7.4xml php-pear php7.4-bcmath

# composer
chmod 755 composer2.sh && ./composer2.sh && sudo mv composer.phar /usr/local/bin/composer
sudo systemctl restart apache2.service

# yarn 
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

