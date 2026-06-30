# Raw Input

Original materials go here unchanged.

Do not rewrite, summarize, or clean up raw source content inside this folder. Put analysis in `discovery/`, background in `context/`, and confirmed product intent in `requirements/`.

Recommended source files include customer chats, bug tickets, meeting notes, screenshots, exported notes, stakeholder requests, and third-party documentation.

For request-driven work, use the same topic slug that later phase documents will use:

```text
raw-input/create-user-table.md
requirements/create-user-table.md
tech-spec/create-user-table.md
implementation/create-user-table.md
```

Do not name raw inputs `request.md`, `notes.md`, or `input.md`.

Create raw-input documents with `./scripts/scaffold.sh create-doc <workspace-name> raw-input <topic-slug>` when wrapping pasted source material. Use [../../../templates/documents/raw-input.md](../../../templates/documents/raw-input.md) manually only when the CLI cannot express the specialized file.
