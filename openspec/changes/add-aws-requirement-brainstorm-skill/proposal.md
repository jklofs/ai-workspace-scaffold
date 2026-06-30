# Add AWS Requirement Brainstorm Skill

## Why

Requirement clarification currently depends on general `/aws-explore` and `openspec-explore` guidance. The user wants a Superpowers-style brainstorming pass during live clarification, but without installing the full Superpowers OpenCode plugin or copying all upstream skills.

## What Changes

- Add a project-local OpenCode skill named `aws-requirement-brainstorm`.
- Wire `/aws-explore` to invoke that skill after reading repo/wiki/workspace context and before writing discovery findings.
- Wire `openspec-explore` to use that skill when requirements are unclear or the user is brainstorming.
- Keep the workflow bounded to clarification only: no implementation, no business repo edits, no automatic OpenSpec change creation.

## Non-Goals

- Do not add the Superpowers plugin to `opencode.json`.
- Do not vendor the full Superpowers skill set.
- Do not modify files under `repos/`.
- Do not create business requirements without explicit source support.

## Impact

- Affected command: `.opencode/commands/aws-explore.md`.
- Affected skill: `.opencode/skills/openspec-explore/SKILL.md`.
- New project skill: `.opencode/skills/aws-requirement-brainstorm/SKILL.md`.
- No runtime application impact.
