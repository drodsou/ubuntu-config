# add custom service to Ubuntu 16+ (systemd)

## create .service file

sudo micro /lib/systemd/system/MYSERVICE.service
(root/root 644)

```
[Unit]
Description=MYSERVICE
After=network.target

[Install]
WantedBy=multi-user.target

[Service]
Type=simple
Restart=always
RestartSec=5
User=MYUSER
ExecStart=EXECUTABLE_WITH_FULL_PATH
```

## enable / start / stop

sudo systemctl enable MYSERVICE   (to run at boot)
sudo systemctl start/stop MYSERVICE

## logs

by default stdout and stderr are written to /var/log/syslog

you can view it more easyly than a 'tail' with `journalctl -e -u MYSERVICE`

also you can redirect to file adding:
```
StandardOutput=file:/var/log/MYSERVICE.log
StandardError=file:/var/log/MYSERVICE.log
```

If you do this 'touch' the log file and chown to the user of the service to avoid permissions problems

## troubleshooting

- "service changed on disk" means you modified .service file while the service was running. Just do what it says `sudo systemctl daemon-reload`

