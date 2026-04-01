#!/bin/bash

DRONE_IP="192.168.50.27"
USER="dronepii"
SOURCE="${USER}@${DRONE_IP}:/home/dronepii/MissionData/"
DEST="$HOME/Downloads/DronepiiData"
LOGFILE="$HOME/Downloads/rsync_pull_log.txt"

while true
do
	rsync -a \
	    --partial \
	    --append-verify \
	    --inplace \
	    --ignore-existing \
	    --timeout=10 \
	    --no-compress \
	    --bwlimit=6000 \
	    -e "ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5" \
	    "$SOURCE" "$DEST" >> "$LOGFILE" 2>&1
	sleep 1
done
