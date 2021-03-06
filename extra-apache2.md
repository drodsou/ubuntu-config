# guias instalacion
Guia instalar LAMP en Ubuntu 16.04
https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04

Guian instalar PHPMyAdmin
https://www.digitalocean.com/community/tutorials/como-instalar-y-proteger-phpmyadmin-en-ubuntu-16-04-es

Guia SSL en Apache
https://www.digitalocean.com/community/tutorials/how-to-create-a-self-signed-ssl-certificate-for-apache-in-ubuntu-16-04

SSL UPDATE: Making self signed certificate for an ip that works in Chrome in 2021, no DNS needed:
- Create 'minimal.cnf' e.g. in /etc/ssl 
```
prompt             = no
distinguished_name = req_dn
x509_extensions = x509_ext

[ req_dn ]

commonName             = My organization

[ x509_ext ]

subjectAltName = @alt_names

[alt_names]
DNS.1 = mydomain.local
DNS.2 = *.mydomain.local
IP.1 = 192.168.1.100
```
- openssl req -x509 -new -newkey rsa:2048 -nodes -days 36500 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt -config minimal.cnf
- make sure /etc/apache2/sites-available ssl is configured to to point to those files
- restart apache: systemctl restart apache2
- open chrome, it will complain not trustable, click on the left of url, certificate, details, download file. Once downloaded double click, install certificate, select store: root trust certif.

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


# update: redirect http AND websockets

- /etc/apache2/mod_enabled, ln -s mod_available proxy_wstunnel
- /etc/apache2/sites-available, edit:
```
Redirect permanent /liveserver /liveserver/ 
<Location /liveserver/>
   ProxyPass http://127.0.0.1:3029/
   ProxyPassReverse http://127.0.0.1:3029/
</Location>
RewriteRule ^/liveserver/?(.*) "ws://127.0.0.1:3029/$1" [P,L]
```
- can test with this
```
// Node.js WebSocket server script
const port = 3029

const http = require('http');
const WebSocketServer = require('websocket').server;
const server = http.createServer((req,res)=>{
    res.writeHead(200, {'Content-Type': 'text/html'});
        res.write(`<!DOCTYPE html>
        <html>
        <head>
          <title>WebSocket Test</title>
        </head>
        <body>
        </body>
        <script>
        const ws = window.location.href.startsWith('https') 
          ? new WebSocket('wss://localhost/liveserver/')
          : new WebSocket('ws://localhost:${port}/');
        ws.onopen = function() {
            console.log('WebSocket Client Connected');
            ws.send('Hi this is web client.');
        };
        ws.onmessage = function(e) {
          console.log("Received: '" + e.data + "'");
        };
        </script>
        </html>
        `);
        res.end();
});

console.log(`listening in ${port}`)
server.listen(port, 'localhost');
const wsServer = new WebSocketServer({
    httpServer: server
});

wsServer.on('request', function(request) {
    const connection = request.accept(null, request.origin);
    connection.on('message', function(message) {
      console.log('Received Message:', message.utf8Data);
      connection.sendUTF('Hi this is WebSocket server!');
    });
    connection.on('close', function(reasonCode, description) {
        console.log('Client has disconnected.');
    });
});
```

