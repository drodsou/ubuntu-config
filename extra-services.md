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

## troubleshooting

- "service changed on disk" means you modified .service file while the service was running. Just do what it says `sudo systemctl daemon-reload`
- 
