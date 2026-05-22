#!/bin/bash
# Usage: ./new_pr_note.sh <repo> <pr-number> <title>
# Example: ./new_pr_note.sh "wandb/weave" "6922" "Retry-After header support"
#
# Creates a Desktop PR notes file ready to fill in.

REPO="$1"
PR_NUM="$2"
TITLE="$3"

if [ -z "$REPO" ] || [ -z "$PR_NUM" ] || [ -z "$TITLE" ]; then
  echo "Usage: ./new_pr_note.sh <repo> <pr-number> <title>"
  echo "Example: ./new_pr_note.sh 'wandb/weave' '6922' 'Retry-After header support'"
  exit 1
fi

# Sanitize repo name for folder (replace / with -)
REPO_FOLDER=$(echo "$REPO" | tr '/' '-')
DATE=$(date +"%Y-%m-%d")
WORK_LOG="$HOME/Desktop/Work-Logs/$DATE.md"

# Append PR section to today's work log (create if it doesn't exist)
mkdir -p "$HOME/Desktop/Work-Logs"

if [ ! -f "$WORK_LOG" ]; then
  cat > "$WORK_LOG" <<HEADER
# Work Log — ${DATE}

---

## Overview
<!-- brief summary of the day -->

HEADER
fi

cat >> "$WORK_LOG" <<EOF

---

## PR — ${REPO} #${PR_NUM} · ${TITLE}
<!-- Added by new_pr_note.sh -->

### What is this repo / what does this part do?


### What was the problem — root cause


### What I changed


### What can be done in the future


EOF

echo "Appended PR section to: $WORK_LOG"
echo "Open Desktop/Work-Logs/$DATE.md and fill in the sections."
