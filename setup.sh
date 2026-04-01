sudo mv ~/Downloads/DroneBaseTransfer/rsync-pull.service /etc/systemd/system/rsync-pull.service

sudo systemctl daemon-reexec
sudo systemctl daemon-reload

sudo systemctl enable rsync-pull.service
sudo systemctl start rsync-pull.service
