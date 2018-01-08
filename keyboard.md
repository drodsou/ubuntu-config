
# modificar layout del teclado xkb
# esto vale para consola y para X
# xmodmap solo vale para X

# conceptos
- modificar 
cp es es.ori
vi /usr/share/X11/xkb/symbols/es

- y luego esto, con enter a todo:
dpkg-reconfigure keyboard-configuration 

- traduccion teclas xev a xkb en:
/usr/share/X11/xkb/keycodes/evdev

- en general en kbd AB01 es la "z", AC01 es la "a"
- aumentando numero ACxx vas hacia la derecha
- nombres de teclas son como en xev (Left, ccedilla, etc)
- util tb: http://wiki.linuxquestions.org/wiki/List_of_keysyms

- hay partes dvorak, us, peru, catalan, asturiano, etc que puedes borrar de "es" si no los usas, para simplificar
- las modificaciones van en la primera seccion 'xkb_symbols "basic"'

# mi fichero "es" completo: files/xkb-symbols-es

/usr/share/X11/xkb/symbols/es /usr/share/X11/xkb/symbols/es.ori
cp ./xkb-symbols-es /usr/share/X11/xkb/symbols/es



# ya no usado, xmodmap

xmodmap -e "keycode 66 = Control_L NoSymbol Control_L"
xmodmap -e "keysym s = s S s S Left"
xmodmap -e "keysym f = f F f F Right"
xmodmap -e "keysym e = e E e E Up"
xmodmap -e "keysym d = d D d D Down"
xmodmap -e "keysym w = w W w W Home"
xmodmap -e "keysym r = r R r R End"
xmodmap -e "keysym t = t T t T Prior"
xmodmap -e "keysym g = g G g G Next"

xmodmap -e "keysym a = a A a A Return"
xmodmap -e "keysym q = q Q q Q Delete"
xmodmap -e "keysym comma = comma semicolon comma semicolon less"
xmodmap -e "keysym period = period colon period colon greater"
xmodmap -e "keysym k = k K k K bracketleft"
xmodmap -e "keysym l = l L l L bracketright"
xmodmap -e "keysym i = i I i I braceleft"
xmodmap -e "keysym o = o O o O braceright"
xmodmap -e "keysym 8 = 8 parenleft 8 parenleft parenleft"
xmodmap -e "keysym 9 = 9 parenright 9 parenright parenright"
xmodmap -e "keysym ccedilla = slash ccedilla slash ccedilla braceright"
xmodmap -e "keysym m = m M m M equal"
xmodmap -e "keysym n = n N n N minus"
xmodmap -e "keysym minus = minus underscore minus underscore slash"



