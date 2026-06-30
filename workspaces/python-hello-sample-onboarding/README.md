# Python Hello Sample Onboarding

A beginner-friendly scaffold walkthrough using a tiny Python `Hello, world!` repository.

**Status:** Complete
**Owner:** Sisyphus
**Updated:** 2026-06-25

## Goal

Add a small external sample repository under `repos/`, analyze it through the workspace lifecycle, and record verification evidence for future onboarding.

## Scope

### In Scope

- Add `https://github.com/david-a-wheeler/hello.git` under `repos/hello` as a git submodule.
- Explain the sample repository structure and behavior for a beginner.
- Record requirements, technical plan, implementation evidence, worklog, and review results.
- Verify the sample with local Python commands where available.

### Out of Scope

- Changing upstream sample repository code.
- Publishing, pushing, or committing changes.
- Installing missing optional tooling such as `pylint`.

## Current Phase

review

## Phase Mode

**Mode:** Full Lifecycle
**Reason:** This is an onboarding example, so the full lifecycle is useful even though the implementation is intentionally small.

## Handoff

### Current State

The sample repository is present at `repos/hello`, the workspace documents are filled, and local verification passed except for optional `pylint`, which is not installed.

### Confirmed

- `repos/hello` points to `https://github.com/david-a-wheeler/hello.git` as a submodule.
- `hello.py` prints `Hello, world!`.
- The repository includes one unittest covering the printed output.
- `python3 hello.py`, `python3 -m unittest -v`, and a syntax compile check passed locally.

### Unknown

- None for the onboarding objective.

### Next Best Action

If the user wants to keep this sample, review the proposed commit split and approve commits. Otherwise remove the submodule and workspace before committing.

### Read First

- `review/analyze-hello-sample.md`
- `implementation/analyze-hello-sample.md`
- `../../repos/hello/README.md`

## Key Documents

| Document | Purpose |
|----------|---------|
| [raw-input/analyze-hello-sample.md](raw-input/analyze-hello-sample.md) | Captures the original request context. |
| [discovery/analyze-hello-sample.md](discovery/analyze-hello-sample.md) | Explains why this repository is a suitable onboarding sample. |
| [context/analyze-hello-sample.md](context/analyze-hello-sample.md) | Summarizes repository structure and verified behavior. |
| [requirements/analyze-hello-sample.md](requirements/analyze-hello-sample.md) | Defines acceptance criteria for the sample onboarding task. |
| [tech-spec/analyze-hello-sample.md](tech-spec/analyze-hello-sample.md) | Describes the minimal technical approach. |
| [implementation/analyze-hello-sample.md](implementation/analyze-hello-sample.md) | Records changes and verification evidence. |
| [worklog/analyze-hello-sample.md](worklog/analyze-hello-sample.md) | Chronological session log. |
| [review/analyze-hello-sample.md](review/analyze-hello-sample.md) | Final acceptance review. |

## Related Workspaces

| Workspace | Relationship |
|-----------|--------------|
| [../scaffold](../scaffold/) | Existing workspace for maintaining the reusable scaffold itself. |

## Related Wiki Pages

| Page | Why It Matters |
|------|----------------|
| [../../wiki/workflow/ai-first-development.md](../../wiki/workflow/ai-first-development.md) | Describes the lifecycle pattern used for this example. |
| [../../wiki/scaffold/scaffold.md](../../wiki/scaffold/scaffold.md) | Explains the scaffold coordination model. |

## Implementation Repositories

| Repository | Role |
|------------|------|
| [../../repos/hello](../../repos/hello/) | Tiny Python implementation repository used as the onboarding sample. |

## Decisions

| Date | Decision | Reason |
|------|----------|--------|
| 2026-06-25 | Use `david-a-wheeler/hello` as the sample repository. | It is small, public, Python-based, and contains both executable code and a unittest. |
| 2026-06-25 | Add the repository as a submodule under `repos/hello`. | The scaffold convention keeps implementation repositories under `repos/` with independent git history. |

## Knowledge Gaps

- [x] No current knowledge gaps for this onboarding example.

## ID Prefix

Use `PYHLO-REQ-001` and `PYHLO-TICKET-001` IDs for requirements and tickets.

## Open Questions

- [x] No open questions for this scope.

## Next Step

Await user approval before creating commits.
