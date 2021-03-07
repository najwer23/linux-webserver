# Linux Web Server on Virtual Box

## General Info
* Ubuntu Server 20.04.2 LTS (https://ubuntu.com/download/server)
* Oracle VirtualBox 6.1

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
- Your dynamiclly IP is inet 192.168.38 (ifconfig). Type IP address in your browser (Chrome). You should see Apache2 Ubuntu Default Page

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
git clone https://github.com/najwer23/linux-webserver.git
```

```
sudo apt update
sudo apt install php php7.4-cli php-7.4fpm php-7.4json php-7.4common php-7.4mysql php-7.4zip php-7.4gd php-7.4mbstring php-7.4curl php-7.4xml php-pear php7.4-bcmath
```

```

chmod 755 composer2.sh && ./composer2.sh && sudo mv composer.phar /usr/local/bin/composer
```


```
cd /var/www/html
git clone https://github.com/najwer23/antoni-gaudi.git
add file *.env
```

instalacja yarn 
plik env 
uprawnienia
```

systemctl reload apache2