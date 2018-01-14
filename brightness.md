# brightness control in plain console

ls /sys/class/backlight
cd /sys/class/backlight/NAME-OF_DEVICE
cat max_brightness
echo THE-BRIGHTNESS > brightness


# brightness control in X (xrandr)

- see output name (LVDSx)
xrandr

- set
xrandr --output LVDSx --brightness 0.6


# brightness control in X (xbacklight)

Only works in intel driver seemly

- decrease 20%
xbacklight --dec 20