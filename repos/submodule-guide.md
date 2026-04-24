# Submodule Guide

This repository uses git submodules under `repos/` to reference implementation repositories.

## Why Submodules

Submodules keep implementation repositories independent while allowing the coordination repository to track which implementation commit it currently references.

## Add A Repository

```bash
git submodule add <repo-url> repos/<repo-name>
git submodule update --init --recursive
```

After adding a repository:

1. update `repos/README.md`
2. commit `.gitmodules`
3. commit the submodule pointer in this repository

## Clone A Repository With Submodules

```bash
git clone --recurse-submodules <repo-url>
```

If already cloned:

```bash
git submodule update --init --recursive
```

## Daily Workflow

### When changing implementation code

1. enter the target repository under `repos/`
2. make code changes there
3. commit in that implementation repository
4. return to the coordination repository
5. commit the updated submodule pointer if the parent repository should reference the new implementation commit

### When changing only planning or knowledge

Commit only in the coordination repository.

## URL Guidance

Prefer portable submodule URLs in `.gitmodules`.

Relative URLs are often a good default when repositories share the same remote owner.
