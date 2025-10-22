#!/bin/bash

set -euo pipefail

# === CONFIGURATION ===
SRC_DEV="/dev/mmcblk0"
DEST_DIR="/media/rpi/hitachi/backup"
IMG_NAME="rpi-backup-$(date +%F).img.gz"
RETENTION_DAYS=7

# === CREATE BACKUP ===
echo "[$(date)] Starting backup..."
dd if="$SRC_DEV" bs=4M status=progress | gzip > "${DEST_DIR}/${IMG_NAME}"
echo "[$(date)] Backup complete: ${DEST_DIR}/${IMG_NAME}"

# === CLEAN OLD BACKUPS ===
find "$DEST_DIR" -name "rpi-backup-*.img.gz" -mtime +$RETENTION_DAYS -delete
echo "[$(date)] Old backups (>$RETENTION_DAYS days) deleted."
