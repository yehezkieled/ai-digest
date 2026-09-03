# ai-digest

Daily AI research digest, delivered to Telegram.

`run.sh` runs Claude Code headless with `digest-prompt.md`, then sends the plain-text
result to the Lona Telegram bot. Each run covers the last 48 hours, so no dedup log is
needed and digests never repeat.

## Files

| File | Purpose |
|---|---|
| `run.sh` | Entry point. Runs `claude -p`, sends the output to Telegram, logs to `logs/`. Sends a `[FAILED]` alert instead if the run errors or returns nothing. |
| `digest-prompt.md` | The prompt. Edit this to change topics, sources, window, or output style. |
| `logs/` | One log per run (`YYYY-MM-DD_HHMM.log`). Git-ignored. |

## Setup

`run.sh` reads two values from `~/.claude/channels/telegram-lona/.env`:

```
TELEGRAM_BOT_TOKEN=...
TELEGRAM_CHAT_ID=...
```

Manual run:

```bash
bash run.sh
```

Daily at 07:00 local time via cron:

```
0 7 * * * /usr/bin/bash /home/hezki/projects/ai-digest/run.sh
```
