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

# Create combined Desktop Work Log
mkdir -p "$HOME/Desktop/Work-Logs"
DESKTOP_LOG="$HOME/Desktop/Work-Logs/$DATE.md"
if [ ! -f "$DESKTOP_LOG" ]; then
  cat > "$DESKTOP_LOG" <<EOF
# Work Log — $DATE

---

## Overview
<!-- brief summary of the day -->

---

## PR — <repo> #<number> · <title>

### What is this repo / what does this part do?


### What was the problem — root cause


### What I changed


### What can be done in the future


---

## What I learned today
-

---

## Quick Links
- **PR:** [repo #number](https://github.com/...)
- **Issue:** [issue title](https://github.com/...)
- **File changed:** \`path/to/file\`
EOF
fi

git add .
git commit -m "log: $DATE daily entry" --allow-empty
git push
