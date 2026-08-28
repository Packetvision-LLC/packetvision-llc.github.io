# Contributing to packetvision-llc.github.io

## Scope

This repository contains the public Packetvision LLC website. Treat every change as production-facing and keep updates conservative, portable, and easy to review.

## Prerequisites

- Node.js 24
- npm

## Setup

```bash
npm install
```

## Daily Workflow

1. Branch from `main`.
2. Make the smallest change that satisfies the task.
3. Run validation:

   ```bash
   npx astro check
   npm run build
   ./scripts/pre-deploy.sh
   ```

4. Inspect the diff for unrelated file churn.
5. Open a PR to `main` with a short summary and the commands you ran.

## Validation Expectations

These are the canonical pre-PR checks for this repo:

- `npx astro check`
- `npm run build`
- `./scripts/pre-deploy.sh`

If one of these fails, fix the problem before asking for review.

## Public-Repo Safety Rules

- Never hardcode maintainer-specific paths, hostnames, or private network references.
- Never commit secrets, API keys, auth tokens, or other sensitive data.
- Keep instructions portable for a fresh clone on a different machine.
- Prefer additive, narrowly scoped changes over broad cleanup work.

## Deployment Model

Merges to `main` trigger the GitHub Pages deployment workflow. Contributors should validate locally first and use local preview tooling when a production-style check is needed.
