
# wine 

- instalar wine
ir a pagina web de wine y seguir instrucciones

- instalar extras no documentados pero que van dando errores al instalar cosas
apt install mesa-utils winbind p11-kit:i386 gnome-keyring:i386

-configurar 
winecfg   
seleccionar "windows 7"

- descargarse firefox antiguo (pj version 42 va bien) de:
https://ftp.mozilla.org/pub/firefox/releases/42.0b9/win32/es-ES

- descargarse flashplayer standalone de:
https://www.adobe.com/es/products/flashplayer/distribution.html

- Instalar
wine FirefoxInstaler.exe
wine FlasPlayerInstaler.exe

- Acceso directos
Crearlos en .local/usr/applications para que salgan en las aplicaciones y puedas pinearlo en favoritos, el comando asi:

bash -c 'exec wine "ruta/aplicacion.exe" "parametros"'


# Sobre playonlinux (no recomendado)
En teoría bien, pero se descarga una copia de wine para cada programa que instalas, además que son versiones viejas... un rollo.
**Así que mmejor tirar con el wine a pelo**

Procedimiento sería, una vez instalado wine:
-instalar playonlinux
Ir a web de playonlinux y descargar el .deb 
(No instalar el 'apt install playonlinux' porque hace un desastre, instala otra version más de wine antigua y monta un lio del carajo.
- ejecutar "playonlinux" desde un terminal, para vigiliar los mensajes de error que puedan salir en la terminal que pasan desapercibidos con los mensajes normales... /_-
- instalar firefox pero seleccionar el que has descargado cuando te pregunte, en vez de descargarlo
- y el resto palante, pinchar en flash que lo descarga soloy todo deberia funcionar.