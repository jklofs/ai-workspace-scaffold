# Python Hello Sample Onboarding Context

**Status:** Approved
**Owner:** Sisyphus
**Updated:** 2026-06-25

## Phase Scope

**Standalone:** No
**Reason:** Future readers should understand what the sample repository contains before reading implementation evidence.
**Expected Output:** Repository file map, behavior summary, and constraints.
**Next Phase:** requirements

## Summary

`repos/hello` is a tiny Python 3 repository added as a scaffold onboarding sample. It demonstrates the repository-submodule convention and gives the workspace lifecycle a concrete implementation target.

## Confirmed Facts

- The repository README says the project prints `Hello, world!` to standard output as a simple project example. Source: [README.md](../../../repos/hello/README.md).
- Runtime behavior is implemented by `print_hello()` in [hello.py](../../../repos/hello/hello.py).
- Output behavior is covered by [test_hello_unittest.py](../../../repos/hello/test_hello_unittest.py).
- The parent repository tracks the sample as a submodule through [.gitmodules](../../../.gitmodules).

## Assumptions

- The sample is used only for onboarding; validated by keeping the upstream code unchanged and recording analysis in this workspace.

## Product Context

- Target reader: a human or AI agent learning how to use this scaffold.
- Workflow demonstrated: raw input capture, discovery, context, requirements, tech spec, implementation evidence, worklog, and review.

## Technical Context

- Repository path: `repos/hello`.
- Submodule source: `https://github.com/david-a-wheeler/hello.git`.
- Current submodule commit observed by `git submodule status`: `7595030f7faafb92b96ee392e91ffb4fdd6757c3`.
- Key files:
  - `README.md`: project description and optional pylint command.
  - `hello.py`: defines `print_hello()` and runs it when executed directly.
  - `test_hello_unittest.py`: verifies stdout equals `Hello, world!` plus the platform newline.

## Related Wiki Pages

| Wiki Page | Relevance |
|-----------|-----------|
| [../../../wiki/workflow/ai-first-development.md](../../../wiki/workflow/ai-first-development.md) | Explains the lifecycle this example demonstrates. |
| [../../../wiki/scaffold/scaffold.md](../../../wiki/scaffold/scaffold.md) | Explains the scaffold coordination pattern. |

## Related Workspaces

| Workspace | Relationship |
|-----------|--------------|
| [../../scaffold](../../scaffold/) | Existing scaffold-maintenance workspace. |

## Knowledge Gaps

- [x] No context gaps for the sample onboarding objective.

## Wiki Promotion Candidates

- None. No stable reusable knowledge beyond existing scaffold workflow pages.
