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
FOLDER="$HOME/Desktop/PRs/$REPO_FOLDER/PR${PR_NUM}_$(echo "$TITLE" | tr ' ' '_' | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9_]//g')"

mkdir -p "$FOLDER"
FILE="$FOLDER/notes.md"

cat > "$FILE" <<EOF
# PR #${PR_NUM} — ${REPO} — ${TITLE}
Link: https://github.com/${REPO}/pull/${PR_NUM}
Date: ${DATE}

---

## What is this part of the codebase?


---

## What was the problem?


---

## What did I change?


---

## Before → Now → After


---

## What I learned

-
EOF

echo "Created: $FILE"
echo "Open it and fill in the sections."
