# OpenCode Workflow Spec

## ADDED Requirements

### Requirement: Project-local requirement brainstorming skill

The project SHALL provide a local OpenCode skill named `aws-requirement-brainstorm` for Superpowers-style requirement clarification without requiring the Superpowers plugin to be installed.

#### Scenario: Agent clarifies an unclear requirement

- **GIVEN** a user enters `/aws-explore <topic>` with unclear goals or open-ended brainstorming intent
- **WHEN** the agent has read relevant scaffold, wiki, workspace, and repository context
- **THEN** the agent SHALL use `aws-requirement-brainstorm` before writing discovery findings
- **AND** the output SHALL separate confirmed facts, assumptions, open questions, options, risks, and acceptance criteria.

#### Scenario: Current session has not hot-loaded the skill

- **GIVEN** `.opencode/skills/aws-requirement-brainstorm/SKILL.md` exists
- **AND** the current OpenCode session cannot load `aws-requirement-brainstorm` through the native skill tool
- **WHEN** requirement brainstorming is needed
- **THEN** the agent SHALL read the local skill file and apply the same process directly
- **AND** the agent SHALL tell the user that restarting OpenCode enables native skill discovery.

### Requirement: Clarification remains non-implementation work

The project SHALL keep requirement brainstorming bounded to exploration and discovery unless the user explicitly asks to create proposal artifacts.

#### Scenario: Brainstorm output suggests a possible change

- **GIVEN** the brainstorming pass identifies a possible OpenSpec change
- **WHEN** the user has not explicitly requested proposal work
- **THEN** the agent SHALL recommend a next command or change name only
- **AND** the agent SHALL NOT create business code changes or OpenSpec change artifacts automatically.

### Requirement: No Superpowers plugin installation

The project SHALL NOT require adding `superpowers@git+https://github.com/obra/superpowers.git` to `opencode.json` for this workflow.

#### Scenario: Project-local skill is available

- **GIVEN** `.opencode/skills/aws-requirement-brainstorm/SKILL.md` exists
- **WHEN** OpenCode loads project skills
- **THEN** the requirement brainstorming workflow SHALL rely on the project-local skill
- **AND** `opencode.json` SHALL remain free of a Superpowers plugin entry.
