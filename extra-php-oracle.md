# utiles para instalar rpm en ubuntu (oh yeah)
apt-get install alien build-essential

# descargar instant client rpm's
http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html

 - oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
 - oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm

# convertir rpm's en deb's
 - alien -v xxx.rpm
 - (pulsar enter varias veces, q parece q se cuelga pero no)

# instalar deb 
 - apt install xxx.deb
 -(primero basic, despues el devel)

# instalar OCI para php7
- apt-get install php-pear
- apt-get install php7.0-dev
- si vienes de upgradear php, primero `pecl uninstall oci8`
- pecl install oci8-2.2.0    (ver el adecuado para la versio de php en: https://pecl.php.net/package/oci8/2.2.0/windows)
- cuando pregunte poner:
```
shared,instantclient,/usr/lib/oracle/12.2/client64/lib
```

# añadir extension oracle a ambos php.ini
/etc/php/7.0/apache2/php.ini
/etc/php/7.0/cli/php.ini

```
extension=/usr/lib/php/20151012/oci8.so
```

# añadir variables de entorno a apache
sudo vi /etc/apache2/envvars
```
export PATH=”/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/lib/oracle/12.2/client64:/usr/lib/oracle/12.2/client64/lib”
export LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib
export ORACLE_HOME=/usr/lib/oracle/12.2/client64
```
