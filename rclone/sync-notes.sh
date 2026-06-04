#!/usr/bin/env bash
# Mirror ~/Documents/Notes to the root of Google Drive (folder "Notes").
# Run by the rclone-sync-notes.timer systemd user unit, or manually.
set -euo pipefail

RCLONE="${RCLONE:-$HOME/.local/bin/rclone}"
SRC="${NOTES_SRC:-$HOME/Documents/Notes}"
DST="${NOTES_DST:-DriveBruno:Notes}"

[ -x "$RCLONE" ] || { echo "rclone not found at $RCLONE" >&2; exit 1; }
[ -d "$SRC" ]   || { echo "source folder missing: $SRC" >&2; exit 1; }

exec "$RCLONE" sync "$SRC" "$DST" \
  --exclude '.git/**' \
  --exclude '.gitignore' \
  --log-level INFO
