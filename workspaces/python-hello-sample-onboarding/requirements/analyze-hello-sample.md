# Analyze Hello Sample Requirements

**Status:** Approved
**Owner:** Sisyphus
**Updated:** 2026-06-25

## Phase Scope

**Standalone:** No
**Reason:** Requirements make the onboarding example testable even though the implementation is small.
**Expected Output:** Clear acceptance criteria for adding and documenting the sample repository.
**Next Phase:** tech-spec

## Goal

Add a tiny Python sample repository and document it through the scaffold lifecycle so future readers can see an end-to-end example.

## Background

The scaffold explains how to coordinate implementation repositories under `repos/` and lifecycle documents under `workspaces/`. A concrete, small sample makes that workflow easier to understand.

## Users / Actors

| Actor | Need |
|-------|------|
| New maintainer | See a complete, low-risk example of a repository linked to workspace documents. |
| AI agent | Learn where to record source context, decisions, verification, and review evidence. |

## Tickets

Use workspace-scoped ticket IDs to avoid collisions across workspaces.

| Ticket ID | Source | Summary | Status |
|-----------|--------|---------|--------|
| `PYHLO-TICKET-001` | [../raw-input/analyze-hello-sample.md](../raw-input/analyze-hello-sample.md) | Download a simple sample project and process it through the scaffold. | Complete |

## Functional Requirements

| ID | Requirement |
|----|-------------|
| `PYHLO-REQ-001` | The coordination repository shall track the selected sample under `repos/hello` as an implementation repository. |
| `PYHLO-REQ-002` | The workspace shall explain the sample repository structure, behavior, and verification results for a beginner. |
| `PYHLO-REQ-003` | The sample shall be verified locally without changing upstream sample code. |
| `PYHLO-REQ-004` | The task shall not create commits without user approval. |

## Non-Functional Requirements

- Traceability: source request, selected repository, decisions, and verification evidence must be documented.
- Reproducibility: verification commands must be simple Python commands available to a typical local development environment.
- Safety: upstream sample code must remain unchanged.

## Acceptance Criteria

| Requirement ID | Criterion | Status |
|----------------|-----------|--------|
| `PYHLO-REQ-001` | `.gitmodules` contains `repos/hello` pointing at `https://github.com/david-a-wheeler/hello.git`. | Pass |
| `PYHLO-REQ-002` | Workspace documents describe the sample repository and link implementation evidence to review. | Pass |
| `PYHLO-REQ-003` | `python3 hello.py`, `python3 -m unittest -v`, and a syntax compile check pass. | Pass |
| `PYHLO-REQ-004` | No commit is created during this task. | Pass |

## Scope

### In Scope

- Add submodule metadata in this coordination repository.
- Add sample workspace documentation.
- Update repository and workspace indexes.
- Run local sample verification commands.

### Out of Scope

- Editing `repos/hello` source files.
- Installing optional lint dependencies.
- Committing or pushing changes.

## Dependencies

- Network access to clone `https://github.com/david-a-wheeler/hello.git`.
- Local `python3` for compile, run, and unittest checks.

## Open Questions

- [x] No open questions for the current scope.

## Source Traceability

| Requirement ID | Ticket ID | Source | Notes |
|----------------|-----------|--------|-------|
| `PYHLO-REQ-001` | `PYHLO-TICKET-001` | [../raw-input/analyze-hello-sample.md](../raw-input/analyze-hello-sample.md) | Repository placement requirement. |
| `PYHLO-REQ-002` | `PYHLO-TICKET-001` | [../raw-input/analyze-hello-sample.md](../raw-input/analyze-hello-sample.md) | Scaffold analysis requirement. |
| `PYHLO-REQ-003` | `PYHLO-TICKET-001` | [../raw-input/analyze-hello-sample.md](../raw-input/analyze-hello-sample.md) | Verification requirement. |
| `PYHLO-REQ-004` | `PYHLO-TICKET-001` | [../raw-input/analyze-hello-sample.md](../raw-input/analyze-hello-sample.md) | Commit safety requirement from local rules. |

## Approval

**Approved By:** User instruction to continue
**Approval Date:** 2026-06-25
**Notes:** User asked to continue if next steps existed; no blocking ambiguity remained.

## Wiki Promotion Candidates

- None. This workspace applies existing scaffold conventions.
