#!/bin/bash
# 毎週月曜日に AI ニュース HTML を自動生成するスクリプト

set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="$DIR/logs"
LOG_FILE="$LOG_DIR/$(date +%Y_%m_%d).log"
CLAUDE="/opt/homebrew/bin/claude"
PROMPT_FILE="$DIR/PROMPT.md"

mkdir -p "$LOG_DIR"

echo "=== AI News Generation: $(date '+%Y-%m-%d %H:%M:%S') ===" | tee -a "$LOG_FILE"

"$CLAUDE" \
  --print \
  --add-dir "$DIR" \
  --allowedTools "Bash,Write,Read,Edit,WebSearch" \
  "$(cat "$PROMPT_FILE")" \
  2>&1 | tee -a "$LOG_FILE"

echo "=== Done: $(date '+%Y-%m-%d %H:%M:%S') ===" | tee -a "$LOG_FILE"
