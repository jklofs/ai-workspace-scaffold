# Analyze Hello Sample Tech Spec

**Status:** Approved
**Owner:** Sisyphus
**Updated:** 2026-06-25

## Phase Scope

**Standalone:** No
**Reason:** The example is small, but the tech spec records the intended files and verification path before review.
**Expected Output:** Minimal task breakdown for submodule addition, documentation, and verification.
**Next Phase:** implementation

## Requirement Links

- ../requirements/analyze-hello-sample.md

## Summary

Add `david-a-wheeler/hello` as a submodule at `repos/hello`, document it in a dedicated workspace, and verify it with Python execution and unittest commands.

## Current System

The coordination repository stores implementation repositories under `repos/` and active project knowledge under `workspaces/`. Before this task, `repos/hello` and `workspaces/python-hello-sample-onboarding` did not exist.

## Proposed Approach

Use `git submodule add` for the external sample repository, use `./scripts/scaffold.sh` to create lifecycle documents, and fill the documents with source context, decisions, file map, verification evidence, and review results.

## Architecture

```text
ai-workspace-scaffold
|-- repos/
|   `-- hello/                         # external sample repository submodule
|       |-- README.md
|       |-- hello.py
|       `-- test_hello_unittest.py
`-- workspaces/
    `-- python-hello-sample-onboarding/
        |-- raw-input/analyze-hello-sample.md
        |-- discovery/analyze-hello-sample.md
        |-- context/analyze-hello-sample.md
        |-- requirements/analyze-hello-sample.md
        |-- tech-spec/analyze-hello-sample.md
        |-- implementation/analyze-hello-sample.md
        |-- worklog/analyze-hello-sample.md
        `-- review/analyze-hello-sample.md
```

## Data Model Changes

- None.

## API Changes

- None.

## UI / UX Changes

- None.

## Task Breakdown

| Task | Files / Areas | Acceptance |
|------|---------------|------------|
| Add sample repository | `.gitmodules`, `repos/hello` | Submodule status shows a concrete commit for `repos/hello`. |
| Create workspace lifecycle | `workspaces/python-hello-sample-onboarding/` | Standard phase documents exist for topic `analyze-hello-sample`. |
| Fill analysis documents | workspace phase documents, `repos/README.md`, `workspaces/README.md` | Placeholders are replaced with task-specific content and links. |
| Verify sample behavior | `repos/hello` | Compile, script execution, and unittest pass; optional missing tooling is documented. |

## Testing Strategy

### Automated Tests

- [x] `python3 -c 'from pathlib import Path; compile(Path("hello.py").read_text(), "hello.py", "exec"); print("compile ok")'`
- [x] `PYTHONDONTWRITEBYTECODE=1 python3 -m unittest -v`

### Manual Tests

- [x] `PYTHONDONTWRITEBYTECODE=1 python3 hello.py`
- [ ] `python3 -m pylint hello.py` is optional and was not run successfully because `pylint` is not installed.

## Rollback Plan

Before committing, remove the submodule and workspace if the sample should not be kept:

```sh
GIT_MASTER=1 git submodule deinit -f repos/hello
GIT_MASTER=1 git rm -f repos/hello
rm -rf .git/modules/repos/hello workspaces/python-hello-sample-onboarding
```

Also remove the `hello` rows from `repos/README.md` and `workspaces/README.md` if reverting manually.

## Risks

- `pylint` is optional and missing locally. Mitigation: record the failed optional command and rely on compile plus unittest for this onboarding scope.
- Submodule metadata affects parent repository history. Mitigation: do not commit until the user approves the commit plan.

## Review

**Reviewed By:** Sisyphus
**Review Date:** 2026-06-25
**Decision:** Approved
**Notes:** Scope is intentionally small and does not alter upstream sample code.

## Wiki Promotion Candidates

- None. This applies existing repository and workspace conventions.
