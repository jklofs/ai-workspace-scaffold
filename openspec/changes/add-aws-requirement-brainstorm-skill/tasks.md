# Add AWS Requirement Brainstorm Skill Tasks

- [x] Record red checks before implementation.
  - Evidence: `test -s .opencode/skills/aws-requirement-brainstorm/SKILL.md` was missing as expected.
  - Evidence: `.opencode/commands/aws-explore.md` did not reference `aws-requirement-brainstorm` as expected.
  - Evidence: `.opencode/skills/openspec-explore/SKILL.md` did not reference `aws-requirement-brainstorm` as expected.
- [x] Add project-local `aws-requirement-brainstorm` skill.
- [x] Wire `/aws-explore` to use the skill during unclear requirement clarification.
- [x] Wire `openspec-explore` to suggest the skill for unclear requirements and brainstorming.
- [x] Add fallback instructions for current sessions that have not hot-loaded the new project skill.
- [x] Verify skill discovery references and workflow guardrails.

## Verification Checklist

- [x] `test -s .opencode/skills/aws-requirement-brainstorm/SKILL.md`
- [x] `grep -q 'name: aws-requirement-brainstorm' .opencode/skills/aws-requirement-brainstorm/SKILL.md`
- [x] `grep -q 'aws-requirement-brainstorm' .opencode/commands/aws-explore.md`
- [x] `grep -q 'aws-requirement-brainstorm' .opencode/skills/openspec-explore/SKILL.md`
- [x] `python3 -m json.tool opencode.json >/dev/null`
- [x] `openspec validate add-aws-requirement-brainstorm-skill --strict`
- [x] `./scripts/scaffold.sh lint`
- [x] `git diff --check`
- [x] No Superpowers plugin entry was added to `opencode.json`.
- [x] No OpenCode package config diff was introduced for `opencode.json`, `.opencode/package.json`, or `.opencode/package-lock.json`.
- [x] No files under `repos/` were edited for this change; existing dirty `repos/hello` sample changes predate this change.
- [x] Current session skill-tool load returned `not found`; `/aws-explore` and `openspec-explore` now document direct-file fallback plus restart guidance.
