#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
# Exit immediately if any command in a pipeline fails.
# Treat unset variables as an error.
set -euo pipefail

# === CONFIGURATION ===
SRC_DEV="/dev/mmcblk0"
DEST_DIR="/media/rpi/hitachi/backup"
IMG_NAME="rpi-backup-$(date +%F).img.gz"

# Use the environment variable RETENTION_DAYS if it's set, otherwise default to 7.
# The ${VAR:-default} syntax is used here.
RETENTION_DAYS="${RETENTION_DAYS:-7}"

echo "Retention set to: $RETENTION_DAYS days."

# === CREATE BACKUP ===
echo "[$(date)] Starting backup..."
dd if="$SRC_DEV" bs=4M status=progress | gzip > "${DEST_DIR}/${IMG_NAME}"
echo "[$(date)] Backup complete: ${DEST_DIR}/${IMG_NAME}"

# === CLEAN OLD BACKUPS ===
echo "[$(date)] Cleaning up old backups..."
find "$DEST_DIR" -name "rpi-backup-*.img.gz" -mtime +$RETENTION_DAYS -delete
echo "[$(date)] Old backups (>$RETENTION_DAYS days) deleted."
