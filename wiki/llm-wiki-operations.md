---
title: LLM Wiki Operations
source: WIKI-SCHEMA.md
see-also: [ai-first-development.md, conventions.md]
created: 2026-05-05
updated: 2026-05-05
tags: [llm-wiki, ingest, query, lint, schema]
---

# LLM Wiki Operations

This scaffold applies the upstream LLM Wiki pattern through three recurring operations: ingest, query, and lint.

## Ingest

Use ingest when new source material or durable conclusions need to be integrated.

Core flow:

```text
capture source -> analyze -> update workspace -> promote reusable knowledge -> update index -> update log
```

Rules:

- Keep raw inputs unchanged.
- Put interpretation in discovery, context, requirements, or wiki.
- Promote only stable reusable knowledge to the wiki.
- Update `wiki/index.md` when navigation changes.
- Append `wiki/log.md` when wiki knowledge changes.

## Query

Use query when answering questions.

Core flow:

```text
classify question -> read relevant workspace -> read relevant wiki -> inspect raw source or code if needed -> answer with uncertainty clearly marked
```

Rules:

- Answer from durable knowledge first.
- Read raw sources when exact wording or evidence matters.
- Read code when implementation truth matters.
- Distinguish confirmed facts, assumptions, and unknowns.

## Lint

Use lint to keep the knowledge system healthy.

Check for:

- requirements without traceable sources
- unclear requirements feeding tech specs
- durable workspace conclusions missing from the wiki
- wiki pages missing from `wiki/index.md`
- stale claims
- contradictions across raw inputs, requirements, tech specs, wiki, and code
- missing links between related workspaces

## Limit

The wiki does not make the AI actually omniscient. It makes captured knowledge persistent, structured, and easier to retrieve. Missing information must be reported as a knowledge gap.
