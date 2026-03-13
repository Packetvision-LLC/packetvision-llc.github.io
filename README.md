# Packetvision LLC Website

Public marketing site for Packetvision LLC, built with Astro, Tailwind CSS, and TypeScript.

## Stack

- Astro
- TypeScript
- Tailwind CSS
- Pagefind for blog search indexing during builds
- GitHub Pages deployment from `main`

## Project Structure

```text
/
├── .github/workflows/    # GitHub Pages deployment workflow
├── public/               # Static assets copied as-is
├── scripts/              # Validation + local preview helpers
├── src/                  # Astro pages, layouts, components, and styles
├── PREVIEW-README.md     # Local preview/deployment helper notes
├── astro.config.mjs
├── package.json
└── tsconfig.json
```

## Local Setup

### Prerequisites

- Node.js 24
- npm

### Install

```bash
npm install
```

### Start local development

```bash
npm run dev
```

Astro serves the site locally at `http://localhost:4321` by default.

## Authoritative Validation Commands

Run these from the repository root before opening a PR:

```bash
npx astro check
npm run build
./scripts/pre-deploy.sh
```

What each command covers:

- `npx astro check` — Astro/TypeScript validation
- `npm run build` — production build plus Pagefind indexing
- `./scripts/pre-deploy.sh` — canonical final validation gate used by maintainers before pushing deploy-affecting changes

## Contributor Workflow

See [`CONTRIBUTING.md`](./CONTRIBUTING.md) for the maintainer-facing workflow checklist.

1. Create a short-lived branch from `main`.
2. Make only the changes required for the ticket or PR.
3. Run the authoritative validation commands above.
4. Review generated diffs for accidental environment-specific or unrelated changes.
5. Open a PR into `main` with a concise summary and validation evidence.
6. After merge to `main`, GitHub Pages deploys the site via `.github/workflows/deploy.yml`.

## Public Repo Hygiene

This repository is public. Keep it portable and contributor-safe:

- Do not hardcode local filesystem paths such as `~/projects/...` or `~/databases/...`.
- Do not commit private network addresses, machine-specific ports, secrets, tokens, or personal infrastructure details.
- Do not include private operational notes that only make sense on one maintainer's machine.
- Prefer repository-local scripts and documented commands over one-off shell history.
- Keep changes narrowly scoped; avoid unrelated content or refactors in the same PR.

## Deployment Notes

- Production deploys are driven by GitHub Pages from `main`.
- The deploy workflow lives in `.github/workflows/deploy.yml`.
- Use `PREVIEW-README.md` and `./scripts/deploy-local.sh` when you need a local production-style preview.

## License

Copyright © 2026 Packetvision LLC. All rights reserved.
