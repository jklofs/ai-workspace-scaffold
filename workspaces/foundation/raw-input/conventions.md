# Project Conventions — Raw Input

Collected from discussions on 2026-04-16.

## Language

- All persistent files (docs, wiki, workspace content) must be written in English
- Git commit messages must be in English
- File names use kebab-case

## Git

- Follow [Conventional Commits v1.0.0](https://www.conventionalcommits.org/en/v1.0.0/) — see [git-commit.md](git-commit.md) for full spec
- No Co-Authored-By or Claude-related info in commit messages
- Commit messages in English, concise, describe the "why"

## Documentation

- All markdown files in English
- Wiki is auto-maintained by LLM — humans work in workspaces, knowledge sinks to wiki
- Look up wiki first, then workspace context, then code

## Code

- All code repositories live under `repos/`, each with independent git
- All code is AI-produced, operated from root directory
