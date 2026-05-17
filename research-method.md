# Research Method

Canonical research discipline shared by both the daily digest routine and the `/kickoff` command.
Apply this methodology whenever doing research for either use case.

---

## Topic Areas

1. **AI Research & Models** — model releases, notable arXiv papers, capability jumps, eval results
2. **AI Engineering & Tooling** — Claude Code updates, agent frameworks, MCP, RAG patterns, dev strategies
3. **Startup & Industry Signal** — significant funding, YC requests, what's being built, Anthropic news
4. **Startup Ideas** — emerging market gaps, founder threads, underserved problems, clever pivots
5. **Data Science Tools** — library releases (sklearn, pandas, polars, etc.), new DS workflows
6. **Broader Tech** — general software, infra, languages, non-AI developments with engineering relevance

---

## Primary Sources

**AI Research & Models**
- arxiv.org (cs.AI, cs.LG, stat.ML, cs.CL) — use arxiv MCP when available locally
- anthropic.com/news, openai.com/blog, deepmind.google/research/blog
- huggingface.co (model releases + blog)
- paperswithcode.com

**AI Engineering & Tooling**
- github.com/trending (filter Python/TypeScript)
- Claude Code docs/changelog
- Simon Willison's blog (simonwillison.net) — consistently high signal
- LangChain, LlamaIndex, CrewAI release notes
- The New Stack (thenewstack.io) AI/ML section

**Startup & Industry Signal**
- news.ycombinator.com (front page, Show HN, Ask HN)
- ycombinator.com/blog
- TechCrunch AI section
- Crunchbase notable rounds (>$20M in AI/ML)

**Startup Ideas**
- ycombinator.com/rfs (Requests for Startups)
- HN "Ask HN: What problems are you solving?" threads
- indiehackers.com trending projects
- Reddit r/SideProject, r/MachineLearning

**Data Science**
- Kaggle blog (kaggle.com/blog)
- PyPI announcements for major DS libraries
- Towards Data Science — pick genuinely novel pieces only

**Broader Tech**
- Ars Technica (arstechnica.com)
- TLDR Newsletter topics

---

## Recency Rules

- Default research window: **last 30 days**
- Prioritize last 7 days for the "lead" items
- For papers: use arXiv publish date, not submission date
- For products: use GA (general availability) date, not announcement date

---

## Signal vs Noise

**Include:**
- Capability jumps or paradigm shifts in AI/ML
- Tools that meaningfully change how an AI engineer works today
- Funding that signals market validation (>$20M, or notable seed for a genuinely clever idea)
- Model releases with real benchmark improvements or new capabilities
- Actionable insights — things you can apply this week
- Strong "why now" stories (what crossing a threshold made this possible in 2026)

**Skip:**
- Incremental point releases with no practical change
- Marketing announcements without shipped features
- Reposted or regurgitated content with no original analysis
- "Company X adds AI feature" when the feature is generic and the company is not a bellwether

---

## Output Format

Group by topic. Include a section only if it has new items. Major items first within each section.

For each item:
```
### Title of item
[Major | Notable | Update] — One sentence on what it is.
Why it matters: 1–2 sentences relevant to an AI engineer building toward a startup and working
with the Claude/Anthropic ecosystem.
Source: URL (dated)
```

---

## Novelty and Significance

When checking against the coverage log (digest use only):
- Item in log, no meaningful change → **skip**
- Item in log, capability significantly expanded / major version / changed best practice → **include as [Update]**
- Not in log → **include as [New]**

Override: if something is genuinely critical (major security vulnerability, paradigm-shifting model release),
include even if recently reported. Use sparingly.
