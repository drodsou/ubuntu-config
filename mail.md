
# postfix

- install
apt install postfix

- satellite mode
smtp2.xxx.com

- /etc/aliases
postmaster: root
root: externalemail@email.com

# mail simple, no utf8
echo “mensaje” | mail -s “asunto” root

# mail multiline, utf8, html, attachment
echo -e “<h1>mensaje html utf8 ñóras</h1>” | mail -s “asunto” -A ./att.zip -a “Content-Type: text/html; charset=UTF-8” root


- reconfigure if necessary
dpkg-reconfigure postfix