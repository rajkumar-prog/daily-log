#!/bin/bash

REPO_DIR="$HOME/daily-log"
DATE=$(date +"%Y-%m-%d")
LOG_FILE="$REPO_DIR/logs/$DATE.md"

cd "$REPO_DIR" || exit 1

git pull --quiet

mkdir -p logs

if [ ! -f "$LOG_FILE" ]; then
  cat > "$LOG_FILE" <<EOF
# $DATE

## What I worked on
- <!-- fill in: PRs opened, issues fixed, code reviewed -->

## Issues explored
- <!-- fill in: issue links and brief description -->

## Notes
- <!-- fill in: things learned, patterns noticed, gotchas -->
EOF
fi

git add .
git commit -m "log: $DATE daily entry" --allow-empty
git push
