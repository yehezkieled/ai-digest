# ai-digest

Personal AI research system. Two things in one repo:

1. **Daily digest** — a Claude Code Routine (scheduled cloud agent) runs at ~7am AEST. Researches
   the last 30 days across AI, tech, startups, and data science. Delivers only genuinely new or
   meaningfully-updated items to the Claude mobile app. Never repeats.

2. **`/kickoff` enrichment** — on-demand. Run `/kickoff "<rough idea>"` in any Claude Code session
   to get a current-best-practices brief: relevant stack, Claude skills, recent dev strategies,
   known pitfalls, minimal starting point.

---

## Repo structure

| File/Folder | Purpose |
|---|---|
| `research-method.md` | Canonical research discipline — sources, signal criteria, output format. Edit this to tune what gets included. |
| `coverage-log.md` | Dedup ledger. The routine reads this every run and skips anything already reported (unless meaningfully updated). |
| `digests/` | One `YYYY-MM-DD.md` per routine run. Permanent searchable archive. |
| `routine-prompt.md` | Exact prompt the daily Routine executes. Edit to change digest behavior. |

Claude config (outside this repo):
- `~/.claude/agents/researcher.md` — subagent used by `/kickoff`
- `~/.claude/commands/kickoff.md` — slash command definition

---

## Tuning

- Topic scope, sources, signal/noise filter → edit `research-method.md`
- Digest format, dedup rules, step-by-step → edit `routine-prompt.md`
- `/kickoff` brief format → edit `~/.claude/commands/kickoff.md`
- Coverage log (manual corrections) → edit `coverage-log.md` directly
