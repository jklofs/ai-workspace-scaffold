# Review

Verification notes for scaffold changes.

Use this folder to confirm that the scaffold remains coherent after changes to schema, templates, scripts, wiki pages, or repository rules.

## Phase Scope

**Standalone:** Yes
**Reason:** Foundation review may be performed independently to audit the scaffold or validate a recent change.
**Expected Output:** Approval decision, issue list, audit findings, or follow-up tasks.
**Next Phase:** None | discovery | context | requirements | tech-spec | implementation

## Review Checklist

- [ ] `LLM-WIKI.md` remains an upstream idea document, not a local rules dump
- [ ] `WIKI-SCHEMA.md` describes local lifecycle and wiki behavior
- [ ] `AGENT-RULES.md` contains hard operating rules
- [ ] Agent entry files point to the correct startup documents
- [ ] Workspace templates match the schema
- [ ] `wiki/index.md` lists durable wiki pages
- [ ] `wiki/log.md` records wiki knowledge changes
- [ ] Scripts have usage documentation
- [ ] Markdown passes `git diff --check`
