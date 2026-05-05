# Foundation

Defines how this repository operates — conventions, standards, and foundational decisions. This workspace is persistent and never archived.

**Status:** Active
**Owner:** Repository maintainers and AI agents
**Updated:** 2026-05-05

## Scope

- Language and formatting conventions
- Git workflow and commit standards
- Code conventions and naming rules
- Technology choices and architecture decisions
- Documentation standards
- Repository structure and new project initialization guidance
- AI-first workspace lifecycle and LLM Wiki operating model

## Directory Semantics

- `raw-input/`: original source material, imported references, or discussion outputs kept as source documents
- `discovery/`: investigation notes about scaffold structure, process tradeoffs, and unresolved operating model questions
- `context/`: distilled background that AI should use to understand how this repository currently works
- `requirements/`: confirmed requirements for the scaffold itself
- `tech-spec/`: technical specifications for scaffold structure, scripts, templates, and repository organization
- `implementation/`: implementation notes and change tracking for scaffold evolution
- `review/`: verification notes for scaffold changes

## Placement Rules

- Put hard operating rules in `AGENT-RULES.md`
- Put local LLM Wiki schema and lifecycle rules in `WIKI-SCHEMA.md`
- Put source material and imported references in `raw-input/`
- Put investigation and unresolved process questions in `discovery/`
- Put summarized repository behavior and structure guidance in `context/`
- Put reusable stable conclusions in `wiki/`
- Put reusable workspace templates in `templates/`

## Current Phase Usage

Foundation is a persistent workspace, so it may use phases independently. For example:

- Use `discovery/` when researching how the scaffold should evolve.
- Use `requirements/` when defining desired scaffold behavior.
- Use `tech-spec/` when planning structural changes.
- Use `implementation/` when recording changes made to the scaffold.
- Use `review/` when validating that the scaffold remains coherent.

## Key Documents

- [raw-input/](raw-input/)
- [discovery/](discovery/)
- [context/](context/)
- [requirements/](requirements/)
- [tech-spec/](tech-spec/)
- [implementation/](implementation/)
- [review/](review/)
