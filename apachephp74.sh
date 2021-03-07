#!/bin/sh
# chmod 755 apachephp74.sh
# ./apachephp74.sh

sudo apt-get install software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php7.4 php7.4-cli php-7.4fpm php-7.4json php-7.4common php-7.4mysql php-7.4zip php-7.4gd php-7.4mbstring php-7.4curl php-7.4xml php-pear php7.4-bcmath

# composer
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php
sudo php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
sudo systemctl restart apache2.service

# yarn 
sudo curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

#npm
sudo apt update
sudo apt install nodejs
nodejs -v
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo apt install npm
sudo npm i -g npm@next