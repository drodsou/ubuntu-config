
# POSTFIX MAIL

## send only

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-postfix-as-a-send-only-smtp-server-on-debian-9


## installation (satellite, when you have no internet domain)

- apt install postfix mailutils
- satellite mode: smtp2.xxx.com
- /etc/aliases:
```
postmaster: root
root: externalemail@email.com
```

extra config: 
- /etc/postfix/main.cf
- /etc/postfix/master.cf

## mail simple, no utf8
echo "mensaje" | mail -s "asunto" root

## mail multiline, utf8, html, attachment
```
echo -e "<h1>mensaje html utf8 ñóras</h1>" | mail -s "asunto" -A ./att.zip -a "Content-Type: text/html; charset=UTF-8" root
```

## reconfigure if necessary:
dpkg-reconfigure postfix


## errors
tail /var/log/mail.log



