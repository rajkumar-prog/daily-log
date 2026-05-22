#!/bin/bash

REPO_DIR="$HOME/daily-log"
DATE=$(date +"%Y-%m-%d")
LOG_FILE="$REPO_DIR/logs/$DATE.md"
DESKTOP_LOG="$HOME/Desktop/Daily-Logs/$DATE.md"

cd "$REPO_DIR" || exit 1

git pull --quiet

mkdir -p logs

# Create GitHub log (short bullet notes)
if [ ! -f "$LOG_FILE" ]; then
  cat > "$LOG_FILE" <<EOF
# $DATE

## What I worked on
-

## PRs
-

## Notes
-
EOF
fi

# Create Desktop log (deeper personal notes)
mkdir -p "$HOME/Desktop/Daily-Logs"
if [ ! -f "$DESKTOP_LOG" ]; then
  cat > "$DESKTOP_LOG" <<EOF
# Daily Log — $DATE

## What I worked on


## What I learned

-

## PRs opened / issues explored

-

## Blockers / things to follow up

-
EOF
fi

git add .
git commit -m "log: $DATE daily entry" --allow-empty
git push
