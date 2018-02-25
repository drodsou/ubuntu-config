# errores de compilacion
tail -n20 /var/log/apache2/error.log

# emitir errores en log
error_log('..');
$debug = var_export($_POST, true);


# mostrar errores browser
<?php
	// login.php – performs validation 
	// mostrar errores
	ini_set('display_errors', 1);
	ini_set('display_startup_errors', 1);
	error_reporting(E_ALL | E_STRICT);
	echo "login.php<br>";
?>

# configuracion
/etc/php/7.0/apache2/php.ini
/etc/php/7.0/cli/php.ini

# que funcione <? sin <?php
short_tags ponerlo a On en php.ini's

# que funcione .htaccess
/etc/apache2/apache2.conf
```
AllowOverride = All
```
