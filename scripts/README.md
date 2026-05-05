# Scripts

Utility scripts for operating this scaffold.

## Create Workspace

Create a new AI-first workspace from the reusable template:

```sh
./scripts/create-workspace.sh admin
```

This creates:

```text
workspaces/admin/
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

## Lint Scaffold

Run a structural health check:

```sh
./scripts/lint-scaffold.sh
```

This checks required root files, workspace phase README files, template coverage, wiki index coverage, and `git diff --check`.
