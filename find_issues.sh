#!/bin/bash

DATE=$(date +"%Y-%m-%d")
OUTPUT_FILE="$HOME/daily-log/issues/$DATE.md"
mkdir -p "$HOME/daily-log/issues"

echo "# Issues to Explore — $DATE" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

fetch_issues() {
  local REPO=$1
  local LABEL=$2
  gh issue list --repo "$REPO" --label "$LABEL" --state open --limit 3 \
    --json number,title,url --jq '.[] | "- [#\(.number) \(.title)](\(.url))"' 2>/dev/null
}

# wandb/weave — bug + documentation
echo "## wandb/weave" >> "$OUTPUT_FILE"
{ fetch_issues "wandb/weave" "bug"; fetch_issues "wandb/weave" "documentation"; } | sort -u >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# explodinggradients/ragas — bug + enhancement
echo "## explodinggradients/ragas" >> "$OUTPUT_FILE"
{ fetch_issues "explodinggradients/ragas" "bug"; fetch_issues "explodinggradients/ragas" "enhancement"; } | sort -u >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# openai/evals — bug
echo "## openai/evals" >> "$OUTPUT_FILE"
fetch_issues "openai/evals" "bug" >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# tiangolo/fastapi — bug + docs
echo "## tiangolo/fastapi" >> "$OUTPUT_FILE"
{ fetch_issues "tiangolo/fastapi" "bug"; fetch_issues "tiangolo/fastapi" "docs"; } | sort -u >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# Trusted-AI/adversarial-robustness-toolbox — enhancement + documentation
echo "## Trusted-AI/adversarial-robustness-toolbox" >> "$OUTPUT_FILE"
{ fetch_issues "Trusted-AI/adversarial-robustness-toolbox" "enhancement"; fetch_issues "Trusted-AI/adversarial-robustness-toolbox" "documentation"; } | sort -u >> "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

cd "$HOME/daily-log"
git add "issues/$DATE.md"
git commit -m "issues: $DATE" --allow-empty 2>/dev/null
git push 2>/dev/null

echo "Done. Issues saved to $OUTPUT_FILE"
