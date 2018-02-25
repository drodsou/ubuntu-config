# guias instalacion
Guia instalar LAMP en Ubuntu 16.04
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04

Guian instalar PHPMyAdmin
https://www.digitalocean.com/community/tutorials/como-instalar-y-proteger-phpmyadmin-en-ubuntu-16-04-es

Guia SSL en Apache
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04

Guia instalar WordPress en Ubuntu 16.04
https://www.digitalocean.com/community/tutorials/como-instalar-wordpress-con-lamp-en-ubuntu-16-04-es


# general
- chequear configuracion
sudo apache2ctl configtest

- ver modulos apache cargados
sudo apache2ctl -M

# autenticar carpeta con php
no, usar php intermedio, enviado mime + readfile si autenticado

# proxy nodejs como directorio de apache2
aunque apache2 este https, nodejs lo levantas http

- tutorial
https://www.1and1.com/cloud-community/learn/application/misc/set-up-a-nodejs-app-for-a-website-with-apache-on-ubuntu-1604/

- añadir proxy a
sudo a2enmod proxy
sudo a2enmod proxy_http

- configurar proxy en /etc/apache2/sites-available/default-ssl.conf
   ProxyRequests Off
   ProxyPreserveHost On
   ProxyVia Full
   <Proxy *>
      Require all granted
   </Proxy>

   <Location /nodejs>
      ProxyPass http://127.0.0.1:8080
      ProxyPassReverse http://127.0.0.1:8080
   </Location>

- reiniciar apache2

- extra: usar pm2 para mantener nodejs levantado en reboots
Make the file executable:
sudo chmod 755 hello.js

Install PM2
Use npm to install PM2 with the command:

sudo npm install -g pm2
Start the hello.js example script with the command:

sudo pm2 start hello.js
As root add PM2 to the startup scripts, so that it will automatically restart if the server is rebooted:

sudo pm2 startup systemd
