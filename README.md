# Linux Web Server on Virtual Box

## General Info
* Ubuntu Server 20.04.2 LTS (https://ubuntu.com/download/server)
* Oracle VirtualBox 6.1
* Apache2 2.4.41
* Bash scripts:
```
git clone https://github.com/najwer23/linux-webserver.git
```
## Install apache2
```
sudo apt-get install apache2
```

## Get public Ip

### Dynamiclly IP
```
sudo apt install net-tools
ifconfig
```
- Your dynamiclly IP is inet 192.168.1.38 (ifconfig). Type IP address in your browser (Chrome). You should see Apache2 Ubuntu Default Page

- By default, when you create a VM in VirtualBox, network adapter 1 is set to NAT. This will give the VM an IP address of 10.0.2.15/24 and a default route of 10.0.2.2 (which should be your host). Long story short, windows will not route to an address it is providing NAT for, without jumping through more hoops first. Shutting down the VM and changing the VM network adapter1 setting to "bridged" will allow your host (and any host on your local network) to communicate with that VM without any special routes added or hoops to jump through.

### Static IP

```
chmod 755 staticip.sh
sudo ./staticip.sh
sudo nano /etc/network/interfaces
```

Restart network
```
sudo systemctl restart systemd-networkd
```

Back to Windows and open "C:\Windows\System32\drivers\etc\hosts" and add your IP server
```
http://192.168.1.38/     gaudi.com
```
Type (http://gaudi.com) in your browser.


## Useful commands Linux
- To navigate into the root directory, use "cd /"
- To navigate to your home directory, use "cd" or "cd ~"
- To navigate up one directory level, use "cd .."
- To navigate to the previous directory (or back), use "cd -"

# Linux Web Server on Virtual Box - Symfony 5.2 (deploy)

```
chmod 755 apachephp74.sh
./apachephp74.sh

sudo nano /var/www/html/phpinfo.php
<?php phpinfo( ); ?>

cd /var/www/
git clone https://github.com/najwer23/antoni-gaudi.git
sudo chown -R www-data:www-data /var/www/antoni-gaudi/
sudo chmod -R 755 /var/www/antoni-gaudi/

mv .env /var/www/antoni-gaudi

sudo composer update
sudo composer install

sudo npm update
sudo npm install

sudo yarn install
sudo yarn encore production

sudo mv symfony.conf /etc/apache2/sites-available/
sudo a2ensite symfony.conf
sudo systemctl restart apache2.service

sudo php bin/console cache:clear --no-warmup
sudo rm -dr /var/www/html/antoni-gaudi/var/

sudo composer dump-env prod
sudo yarn install
```