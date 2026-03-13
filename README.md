# Packetvision LLC website

Public marketing site for Packetvision LLC, built with Astro, Tailwind CSS, and TypeScript.

## Stack

- Astro
- Tailwind CSS
- TypeScript
- GitHub Actions
- GitHub Pages (production)

## Project structure

```text
/
├── public/
├── src/
├── .github/workflows/
├── scripts/
├── astro.config.mjs
├── package.json
└── tsconfig.json
```

## Local setup

1. Use Node.js 24.
2. Install dependencies:
   ```bash
   npm install
   ```
3. Start the dev server:
   ```bash
   npm run dev
   ```
4. Open `http://localhost:4321`.

## Validation commands

Run these before opening a PR:

```bash
npm run build
./scripts/pre-deploy.sh
```

Command reference:

| Command | Purpose |
| --- | --- |
| `npm run dev` | Start the local Astro dev server |
| `npm run build` | Build the production site and Pagefind index |
| `npm run preview` | Preview the local build |
| `npm run preview:prod` | Build, then preview the production output locally |
| `./scripts/pre-deploy.sh` | Full pre-deploy validation gate used before pushes |

## Preview / staging workflow

This repository keeps production deploys on `main`, but now has an isolated preview path that does **not** affect the live GitHub Pages site:

- Pull requests trigger `.github/workflows/preview.yml`
- The workflow installs dependencies, runs validation, builds the site, and uploads the generated `dist/` directory as a preview artifact
- Maintainers can download that artifact from the workflow run and inspect the exact build output before merging
- For a local staging-style check, run `npm run preview:prod` after building and review the generated site locally

This gives the repo a non-production validation path without publishing preview content onto the live Pages environment.

## Production deployment

Production deploys remain in `.github/workflows/deploy.yml` and run on pushes to `main`.

Before pushing production-bound changes, run:

```bash
./scripts/pre-deploy.sh
```

## Public-repo hygiene

- Do not commit local filesystem paths, private network references, secrets, or machine-specific instructions
- Keep documentation portable for someone cloning the repo fresh
- Treat preview validation as the final check before `main` triggers production deploy

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for the contributor workflow, preview process, and release expectations.

## License

Copyright © 2026 Packetvision LLC. All rights reserved.
