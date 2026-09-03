#!/usr/bin/env bash
#
# Daily AI Research Digest.
# Runs the Claude Code research agent headless, delivers the digest to Telegram (Lona).
# Invoked by cron daily. Manual run: bash run.sh
#
set -uo pipefail   # deliberately NOT -e: we must still reach the failsafe on error

PROJECT_DIR="/home/hezki/projects/ai-digest"
TG_ENV="/home/hezki/.claude/channels/telegram-lona/.env"
MODEL="claude-opus-4-7"
CLAUDE_BIN="${CLAUDE_BIN:-/home/hezki/.local/bin/claude}"

# Cron runs with a minimal environment — set what claude needs.
export HOME="/home/hezki"
export PATH="/home/hezki/.local/bin:/home/hezki/.bun/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
cd "$PROJECT_DIR" || { echo "cannot cd $PROJECT_DIR" >&2; exit 1; }

mkdir -p logs
TS="$(date '+%Y-%m-%d_%H%M')"
LOG="logs/${TS}.log"

# Lona bot token + target chat (outbound send only; never echoed).
env_val() { grep -E "^$1=" "$TG_ENV" 2>/dev/null | head -1 | cut -d= -f2- | tr -d '\r\n'; }
BOT_TOKEN="$(env_val TELEGRAM_BOT_TOKEN)"
CHAT_ID="$(env_val TELEGRAM_CHAT_ID)"

send_telegram() {
  local text="$1" chunk
  if [ -z "$BOT_TOKEN" ] || [ -z "$CHAT_ID" ]; then echo "missing TELEGRAM_BOT_TOKEN or TELEGRAM_CHAT_ID in $TG_ENV" >> "$LOG"; return 1; fi
  # Telegram caps a message at 4096 chars; send in <=3500-char chunks.
  while [ -n "$text" ]; do
    chunk="${text:0:3500}"
    text="${text:3500}"
    {
      printf 'telegram http: '
      curl -s -m 20 -o /dev/null -w '%{http_code}' \
        -X POST "https://api.telegram.org/bot${BOT_TOKEN}/sendMessage" \
        --data-urlencode "chat_id=${CHAT_ID}" \
        --data-urlencode "text=${chunk}"
      printf '\n'
    } >> "$LOG" 2>&1
  done
}

echo "=== ai-digest run $TS ===" >> "$LOG"
PROMPT="$(cat digest-prompt.md)"
REPORT="$("$CLAUDE_BIN" -p "$PROMPT" --model "$MODEL" --effort max --output-format text --dangerously-skip-permissions 2>>"$LOG")"
RC=$?

if [ "$RC" -ne 0 ] || [ -z "${REPORT//[[:space:]]/}" ]; then
  ALERT="[FAILED] AI digest did not complete ($TS). exit=$RC. Log: $PROJECT_DIR/$LOG"
  echo "$ALERT" >> "$LOG"
  send_telegram "$ALERT"
  exit 1
fi

printf '%s\n' "$REPORT" >> "$LOG"
send_telegram "$REPORT"
echo "=== sent ($TS) ===" >> "$LOG"
