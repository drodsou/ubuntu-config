# xfce

- install
apt install xfce4 xfce4-whiskermenu-plugin xfce4-terminal gedit firefox xbacklight

- start with non-root user
In case *startx* or *startxfce4* gives error, do:
```
chown -R youruser:youruser /home/youruser/
```

- stetics
add whisker-menu to panel, remove menu
in "keyboard" assign Win or win-space to action: **xfce4-popup-whiskermenu**
change icon by icons/action/format-center
change background

- copy profile (done in initial-fix.sh)
cd ~/.config/xfce4
zip -r dotconfig-xfce4.zip panel xfconf xfwm4
see file **files/dotconfig-xfce4.zip**


# xrdp
Works ok with XFCE, not with Unity

- install
apt install xrdp

- config sesion with xfce:
*~/.xsession*
```
xfce4-session
```

- keyboard
it'll be in english. its possible to change it but virtualbox will fight back :-). TODO.