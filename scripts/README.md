# Scripts

Utility scripts for operating this scaffold.

`scaffold.sh` is the only user-facing script. Files under `scripts/lib/` are internal implementation modules sourced by `scaffold.sh`; call the top-level command instead of calling library files directly.

## Create Workspace

Create a new AI-first workspace from the reusable template:

```sh
./scripts/scaffold.sh create user-management
```

This creates:

```text
workspaces/user-management/
├── README.md
├── raw-input/
├── discovery/
├── context/
├── requirements/
├── tech-spec/
├── implementation/
└── review/
```

After creation, update the workspace root `README.md` and capture original source materials in `raw-input/`.

Use meaningful names for both workspaces and phase documents. For one work item, keep the same topic slug across phases:

```text
raw-input/create-user-table.md
requirements/create-user-table.md
tech-spec/create-user-table.md
implementation/create-user-table.md
```

## Update Scaffold

Update an existing project from a newer checkout of this scaffold:

```sh
./scripts/scaffold.sh update --source ../project-scaffold-latest
```

The update command is intentionally non-destructive by default:

- missing managed scaffold files are copied into the target project
- existing files with identical content are left unchanged
- existing files with different content are not overwritten
- candidate updates are written under `.scaffold-updates/<timestamp>/`
- a report is written to `.scaffold-updates/<timestamp>/report.md`

Run a preview first:

```sh
./scripts/scaffold.sh update --source ../project-scaffold-latest --dry-run
```

Use `--force` only when the target project intentionally wants to replace its local scaffold files with the newer scaffold versions.

The update command does not copy the reference workspace `workspaces/scaffold/`. User workspaces are project-owned data and must not be overwritten by scaffold updates.

The managed file list is defined in [../scaffold.manifest](../scaffold.manifest). Each non-comment line is a scaffold-owned file or path pattern. Update that manifest when adding new scaffold-owned files or directories.

Deprecated scaffold paths are defined in [../scaffold.deprecated](../scaffold.deprecated). Update reports these paths when they still exist downstream, but never deletes them automatically.

## Lint Scaffold

Run a structural health check:

```sh
./scripts/scaffold.sh lint
```

This checks required root files, workspace phase README files, template coverage, wiki index coverage, ignored local noise files, and `git diff --check`.

## Update Ingest Queue

Generate the wiki ingest queue from visible workspace sections:

```sh
./scripts/scaffold.sh ingest
```

Workspace documents can include:

```md
## Wiki Promotion Candidates

- [ ] wiki/scaffold/example.md — Stable conclusion to promote
- [x] wiki/workflow/example.md — Already promoted
```

Unchecked items are collected into `wiki/ingest-queue.md`.
