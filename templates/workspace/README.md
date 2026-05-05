# Workspace Template

Copy this structure when creating a new project, module, or feature workspace.

```text
workspaces/<workspace-name>/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

## Root README Template

```md
# <Workspace Name>

Short description of the module, feature, or project.

**Status:** Draft | In Discovery | Requirements Review | Tech Spec Review | Implementation | Review | Done
**Owner:** <person or agent>
**Updated:** YYYY-MM-DD

## Goal

[One clear sentence describing the desired outcome.]

## Scope

### In Scope

- [What this workspace covers]

### Out of Scope

- [What this workspace intentionally excludes]

## Current Phase

[raw-input | discovery | context | requirements | tech-spec | implementation | review]

## Phase Mode

**Mode:** Full Lifecycle | Standalone Phase | Phase Subset
**Reason:** <why this workspace uses this amount of process>

## Key Documents

- [raw-input/](raw-input/)
- [discovery/](discovery/)
- [context/](context/)
- [requirements/](requirements/)
- [tech-spec/](tech-spec/)
- [implementation/](implementation/)
- [review/](review/)

## Related Workspaces

| Workspace | Relationship |
|-----------|--------------|
| | |

## Related Wiki Pages

| Page | Why It Matters |
|------|----------------|
| | |

## Implementation Repositories

| Repository | Role |
|------------|------|
| | |

## Open Questions

- [ ] [Question]

## Decisions

| Date | Decision | Reason |
|------|----------|--------|
| | | |

## Knowledge Gaps

- [ ] [Missing information]

## Next Step

[The immediate next action.]
```
