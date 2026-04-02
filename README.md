# Drone Base Transfer - Rsync Pull Service

## Overview

This repository contains configuration and setup scripts used for automatic file transfer between Base Raspberry Pi and Drone Raspberry Pi using **rsync** and **systemd service**.

The purpose of this setup is to:

* Automatically pull files from Base Station
* Enable continuous synchronization
* Ensure service starts automatically on boot
* Provide reliable data transfer for drone operations

---

## Files Included

### 1. rsync-pull.service

Systemd service file responsible for:

* Running rsync transfer
* Pulling files from base station
* Running automatically at startup

### 2. setup script

This script installs and enables the rsync pull service.

---

## Installation Steps

Run the following commands on **Drone Raspberry Pi**:

```bash
sudo mv ~/Downloads/DroneBaseTransfer/rsync-pull.service /etc/systemd/system/rsync-pull.service

sudo systemctl daemon-reexec
sudo systemctl daemon-reload

sudo systemctl enable rsync-pull.service
sudo systemctl start rsync-pull.service
```

---

## What Each Command Does

### Move Service File

```bash
sudo mv ~/Downloads/DroneBaseTransfer/rsync-pull.service /etc/systemd/system/rsync-pull.service
```

Moves the service file to systemd directory so Linux can recognize it.

---

### Reload Systemd

```bash
sudo systemctl daemon-reexec
sudo systemctl daemon-reload
```

These commands:

* Reload systemd configuration
* Register new service

---

### Enable Service

```bash
sudo systemctl enable rsync-pull.service
```

This ensures:

* Service starts automatically on boot

---

### Start Service

```bash
sudo systemctl start rsync-pull.service
```

Starts the rsync pull service immediately.

---

## Verify Service Status

To check if service is running:

```bash
sudo systemctl status rsync-pull.service
```

---

## Stop Service

```bash
sudo systemctl stop rsync-pull.service
```

---

## Disable Service

```bash
sudo systemctl disable rsync-pull.service
```

---

## Use Case

This setup is used in:

* GPS denied drone system
* Base to drone communication
* Automatic file sync
* Autonomous drone operations

---

## Requirements

* Raspberry Pi 4 / Raspberry Pi 5
* Linux OS (Ubuntu / Raspberry Pi OS)
* rsync installed
* SSH enabled

Install rsync if not available:

```bash
sudo apt update
sudo apt install rsync -y
```

---

## Architecture

Base Station  →  Drone Pi
(files pushed / pulled automatically)

---

## Notes

* Ensure SSH access between Base and Drone
* Ensure IP address is configured correctly
* Make sure service file paths are correct

---

## Future Improvements

* Add retry mechanism
* Add logging
* Add watchdog monitoring
* Add health check

---

## License

MIT License

---

