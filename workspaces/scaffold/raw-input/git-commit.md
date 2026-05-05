# Conventional Commits

Source: https://www.conventionalcommits.org/en/v1.0.0/

## Specification (v1.0.0)

A lightweight convention on top of commit messages. Enables automated tooling and structured version control.

### Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Core Types (with SemVer semantics)

- **feat** — New functionality (correlates to MINOR in SemVer)
- **fix** — Bug fix (correlates to PATCH in SemVer)
- **BREAKING CHANGE** — Breaking API changes (correlates to MAJOR in SemVer), indicated via `!` after type or as footer

### Community Types (from Angular convention)

- **build** — Build system changes
- **chore** — Maintenance, dependencies, tooling
- **ci** — CI/CD configuration
- **docs** — Documentation only
- **style** — Formatting, whitespace (no logic change)
- **refactor** — Code restructuring (no feat, no fix)
- **perf** — Performance improvement
- **test** — Adding or updating tests
- **revert** — Reverting a previous commit

### Rules

1. Type prefix is required, followed by optional scope in parentheses, optional `!`, then colon and space
2. Description must immediately follow the colon-space separator
3. Body may appear after one blank line, free-form with multiple paragraphs
4. Footers appear after one blank line from body
5. Breaking changes indicated via `!` after type/scope or as `BREAKING CHANGE:` footer
6. Non-standard types are permitted by the spec

### Examples

```
feat: allow config object to extend other configs
fix(parser): handle nested arrays correctly
docs: correct spelling of CHANGELOG
feat(lang): add Polish language
feat!: send email when product is shipped
chore(deps): upgrade Next.js to 15.x
```
