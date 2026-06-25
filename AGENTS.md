# Codex Entry

Read these files before acting:

1. [LLM-WIKI.md](LLM-WIKI.md)
2. [WIKI-SCHEMA.md](WIKI-SCHEMA.md)
3. [AGENT-RULES.md](AGENT-RULES.md)
4. [scripts/README.md](scripts/README.md)

Use the documented `./scripts/scaffold.sh` command for scaffold operations.

## Context Loading Rules

- Low/small changes: read the current repository `AGENTS.md`.
- Medium changes: read the relevant OpenSpec change.
- High-risk changes: read workspace background material, relevant wiki pages, and the relevant OpenSpec change.
- Never read all wiki pages by default; read `wiki/index.md` first, then follow only relevant links.

## Change Risk Classification

- `Low`: copy/text changes, small bug fixes, and changes with no business behavior change.
- `Medium`: API, configuration, database, or business workflow changes.
- `High`: core flows, production configuration, cross-system behavior, stability, permissions, or security changes.
- Medium and High changes must create an OpenSpec change before implementation.
- High changes must create workspace background material before implementation.

## Knowledge Promotion Policy

- Agents may write worklog, review, wiki candidates, and rule candidates.
- Agents must not automatically modify long-term rules or the formal wiki unless the user explicitly asks.
- Uncertain content must be marked TODO.

## Rule Promotion Policy

A rule may enter `AGENTS.md` only when at least one is true:

- The same class of mistake has happened twice.
- Code review confirmed it as a project constraint.
- Incident review produced it as a stability rule.
- New maintainers must know it to work safely.
- It affects build, test, release, rollback, or production safety.
