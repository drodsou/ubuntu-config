# xfce

- install
apt install xfce4 xfce4-whisker-plugin xfce4-terminal gedit firefox

- start with non-root user
In case *startx* or *startxfce4* gives error, do:
`chmod -R youruser:youruser /home/yourusers`

- stetics
add whisker-menu to panel, remove menu
in "keyboard" assign Win or win-space to action: **xfce4-popup-whiskermenu**
change icon by icons/action/format-center
change background

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