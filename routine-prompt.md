# Daily AI Research Digest — Routine Prompt

This file contains the exact instructions the scheduled Claude Code Routine executes each day.
Edit this file to change digest behavior, then the next run will pick up the changes automatically
(the routine reads this from the attached repo).

---

## Instructions for the Routine

You are running the daily AI Research Digest for Hezki. Your job: research what is new today,
filter out anything already reported, and deliver a clean useful digest.

The `ai-digest` repository is attached. All file reads and writes below refer to that repo.

---

### Step 1 — Load context

Read both files:
- `research-method.md` — your research discipline (sources, signal criteria, output format)
- `coverage-log.md` — everything already reported (you will dedup against this)

---

### Step 2 — Research

Apply `research-method.md`. Research the last 30 days across all six topic areas:

1. AI Research & Models
2. AI Engineering & Tooling
3. Startup & Industry Signal
4. Startup Ideas
5. Data Science Tools
6. Broader Tech

Use WebSearch and WebFetch. Check multiple sources per topic. Prioritize the last 7 days for
freshness; use the full 30-day window as a safety net. Do not rely on a single source per topic.

Note: cloud environment — use web search to access arXiv (search arxiv.org directly).

---

### Step 3 — Dedup

For each finding, check `coverage-log.md`:

- **In log, no meaningful change** → skip entirely
- **In log, significant update** (capability expanded, major version, changed recommendation) → include, mark `[Update]`
- **Not in log** → include, mark `[New]`

If `coverage-log.md` is empty: this is the first run. Do a full 30-day catch-up. The first
digest will be longer than usual — that is expected and fine.

---

### Step 4 — Write the digest

Write to `digests/YYYY-MM-DD.md` (use today's date). Use this format:

```
# AI Research Digest — YYYY-MM-DD

## Today's signal
[2–3 sentence overview of the most important developments this run]

---

## [Topic name — only include section if it has items]

### Item title
[New | Update | Major] — One sentence on what it is.
Why it matters: 1–2 sentences relevant to an AI engineer building toward a startup, working
with the Claude ecosystem and infra-first skills.
Source: URL (check date is within the 30-day window)

[repeat for each item]

---

*[n] new · [m] updates · [total] items in coverage log*
```

Quality bar: each "Why it matters" should be specific to Hezki's context (AI engineering,
infra-leaning, actuarial/DS background, building toward a startup). Generic observations are noise.

---

### Step 5 — Update the coverage log

Append each [New] item to `coverage-log.md` as a new row:
```
| YYYY-MM-DD | Category | Item name | One-line fingerprint | YYYY-MM-DD |
```

For [Update] items: find the existing row and update the "Last Meaningful Update" column.

---

### Step 6 — Commit and push

```bash
git add digests/ coverage-log.md
git commit -m "digest: YYYY-MM-DD (N new, M updates)"
git push
```

---

### Step 7 — Present

Output the full digest content in this session so Hezki can read it directly in the Claude app.

End with one line: `Committed to digests/YYYY-MM-DD.md — coverage log now at [N] entries.`
