# Scaffold CLI Tech Spec

**Status:** Approved
**Owner:** AI agent
**Updated:** 2026-05-05

## Phase Scope

**Standalone:** No
**Reason:** Requirements require script and documentation changes.
**Expected Output:** Implementable plan for CLI consolidation and update metadata.
**Next Phase:** implementation

## Requirement Links

- ../requirements/scaffold-cli.md

## Summary

Consolidate scaffold operations into `scripts/scaffold.sh`, move update-managed path metadata into `scaffold.manifest`, list stale old paths in `scaffold.deprecated`, and use `templates/workspace-root.md` for generated workspace README files.

## Proposed Approach

- Keep `scripts/scaffold.sh` as the only executable scaffold script.
- Keep subcommand implementations in `scripts/lib/*.sh` so `scripts/scaffold.sh` stays a small dispatcher.
- Implement subcommands: `create`, `lint`, `ingest`, and `update`.
- Make `scaffold.manifest` a plain list of managed file/path patterns.
- Keep hard safety exclusions inside `scripts/scaffold.sh`.
- Add `scaffold.deprecated` for old scaffold paths that update should report but not remove.
- Generate workspace root README files from `templates/workspace-root.md`.
- Update docs, wiki pages, and scaffold workspace records to use the single command.

## Testing Strategy

### Automated / Command Checks

- [x] `bash -n scripts/scaffold.sh`
- [x] `./scripts/scaffold.sh lint`
- [x] `./scripts/scaffold.sh ingest`
- [x] `./scripts/scaffold.sh update --source .`
- [x] Temporary-directory update simulation
- [x] Temporary-directory create simulation

## Rollback Plan

Restore the previous separate scripts and remove `scaffold.manifest`, `scaffold.deprecated`, and `templates/workspace-root.md` if the single CLI proves too hard to maintain.
