# AI Workspace Workflow Commands

This guide maps the `/aws-*` OpenCode commands onto the existing AI Workspace Scaffold and OpenSpec workflow. It is for old-project stable iteration, where the scaffold keeps long-term memory, OpenSpec holds the change contract, and opencode/omo runs the work.

For the broader scaffold lifecycle, see [the onboarding guide](ai-first-guide.md). This page stays focused on command order, handoff points, and promotion boundaries.

## Old-project first onboarding flow

Use this path when an existing implementation project needs to enter the scaffold for stable, repeatable iteration.

1. Clone the existing project into `repos/`.
2. Run `/aws-init` from the scaffold root.
3. Run `/aws-onboard <repo-name>` to capture old-project onboarding context.
4. Run `openspec init` inside the target repository when it does not already have OpenSpec initialized.
5. Run `/aws-spec-init <repo-name>` to align repository OpenSpec context with the scaffold workflow.

Example:

```text
old-project onboarding
repos/new-frontdesk/
/aws-init
/aws-onboard new-frontdesk
openspec init
/aws-spec-init new-frontdesk
```

## Normal requirement flow

Use this path for ordinary changes after the repository has been onboarded.

1. Run `/aws-explore <topic>` to gather context and identify candidate workspace material.
2. Run `/aws-propose <repo-name> <change-name>` to create the OpenSpec change contract.
3. Run `/aws-apply <repo-name> <change-name>` to implement the accepted change.
4. Run `/aws-review <repo-name> <change-name>` to check the implementation against the contract.
5. Run `/aws-archive <repo-name> <change-name>` after the change is accepted.
6. Run `/aws-finish <workspace-name>` to refresh scaffold evidence and handoff notes.

Example:

```text
order lookup success-rate improvement
/aws-explore order-lookup-success-rate
/aws-propose new-frontdesk improve-order-lookup-success-rate
/aws-apply new-frontdesk improve-order-lookup-success-rate
/aws-review new-frontdesk improve-order-lookup-success-rate
/aws-archive new-frontdesk improve-order-lookup-success-rate
/aws-finish frontdesk-ops
```

## High-risk requirement flow

Use this path when the work affects core flows, production configuration, cross-system behavior, stability, permissions, or security.

1. Create workspace with `./scripts/scaffold.sh create <workspace-name>`.
2. Write raw-input/context/requirements before implementation work starts.
3. Run `/aws-propose` for the target repository and change.
4. Review proposal/design/tasks with a human before applying.
5. Run `/aws-apply` only after the contract is accepted.
6. Run `/aws-review` and resolve review findings.
7. Run `/aws-finish` to update handoff and evidence.
8. Run `/aws-promote` only for confirmed durable knowledge or rule candidates.

Example:

```text
new-frontdesk config change governance
./scripts/scaffold.sh create new-frontdesk config-change-governance
write raw-input/context/requirements
/aws-propose new-frontdesk govern-config-changes
review proposal/design/tasks
/aws-apply new-frontdesk govern-config-changes
/aws-review new-frontdesk govern-config-changes
/aws-finish new-frontdesk
/aws-promote new-frontdesk
```

## Boundaries

- scaffold manages long-term memory.
- OpenSpec manages change contract.
- opencode/omo manages execution.
- wiki and `AGENTS.md` require human confirmation before durable promotion.
- scaffold-supported workspace/phase creation uses `./scripts/scaffold.sh create` and `create-doc`; manual creation only when CLI cannot express the specialized file.

## Candidate-first guardrails

Keep uncertain material in workspace candidates until a human or reviewer confirms it. `/aws-promote` should move only confirmed long-term facts into `wiki/`, and rule candidates should stay out of `AGENTS.md` until they meet the repository rule promotion policy.

## Closed-loop map

Use this map to verify that each workflow entry point has an output, a next step, and a check before moving on.

| Entry point | Primary output | Next step | Closure check |
|-------------|----------------|-----------|---------------|
| `./scripts/opencode.sh` | OpenCode starts from the scaffold root with the configured session | Run `/aws-init` or a task-specific `/aws-*` command | `./scripts/opencode.sh --version` and `/` shows the `/aws-*` commands |
| `/aws-init` | Core OpenCode/Codex/Claude instructions are checked or completed | Onboard a repo or create a workspace | `python3 -m json.tool opencode.json >/dev/null` |
| `/aws-onboard <repo-name>` | Onboarding context under `workspaces/<repo-name>-onboarding/context/` | Initialize or align OpenSpec in `repos/<repo-name>` | Context files exist and unknowns are marked `TODO` |
| `/aws-spec-init <repo-name>` | OpenSpec candidate specs for confirmed current behavior | Start a concrete change with `/aws-explore` or `/aws-propose` | Candidate specs avoid future requirements and mark unknowns `TODO` |
| `/aws-explore <topic>` | Discovery notes, options, risks, and suggested change name | Create the OpenSpec change contract with `/aws-propose` | Discovery output identifies scope, risks, and open questions |
| `/aws-propose <repo-name> <change-name>` | OpenSpec proposal, design, tasks, and delta specs | Human review, then `/aws-apply` | `openspec validate <change-name> --strict` when available |
| `/aws-apply <repo-name> <change-name>` | Implementation following `tasks.md` only | `/aws-review` | `tasks.md` checked off and related tests or manual checks recorded |
| `/aws-review <repo-name> <change-name>` | Blocking issues, risks, missing tests, and merge recommendation | Fix blockers or archive accepted work | Review decision is explicit: approve, changes requested, or reject |
| `/aws-archive <repo-name> <change-name>` | Archived OpenSpec change and promotion candidates | `/aws-finish` | Change tasks are complete and archive result is recorded |
| `/aws-finish <workspace-name>` | Updated handoff, worklog/review notes, ingest queue, lint report | Promote durable knowledge or stop | `./scripts/scaffold.sh ingest`, `./scripts/scaffold.sh lint`, and `git diff --check` have recorded results |
| `/aws-promote <workspace-name>` | Confirmed stable knowledge in `wiki/` | Re-run ingest and lint | `wiki/index.md` and `wiki/log.md` are updated; source candidate is checked off |
| `/aws-rule-candidates <workspace-name>` | Pending rule candidates in workspace review docs | Human approval before `AGENTS.md` changes | Every candidate has reason, trigger, target file, evidence, and pending status |

For scaffold-only operations, use `./scripts/scaffold.sh create`, `create-doc`, `status`, `stale`, `ingest`, and `lint`; close each operation by checking `./scripts/scaffold.sh status`, `./scripts/scaffold.sh lint`, and any generated handoff or ingest queue changes.
