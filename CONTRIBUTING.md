# Contributing to packetvision-llc.github.io

## Development workflow

1. Use Node.js 24.
2. Install dependencies with `npm install`.
3. Create a feature branch from `main`.
4. Make your change.
5. Run the validation stack:
   ```bash
   npm run build
   ./scripts/pre-deploy.sh
   ```
6. Open a pull request.

## Preview / staging validation

This repo uses a conservative preview flow so maintainers can validate changes without touching production GitHub Pages content.

### GitHub Actions preview

- Every pull request runs `.github/workflows/preview.yml`
- The workflow performs install, validation, and production build steps
- It uploads the built `dist/` directory as a workflow artifact named `packetvision-preview`
- Reviewers can download that artifact from the workflow run to inspect the exact generated site before merge

### Local preview

For local staging-style review:

```bash
npm run preview:prod
```

That command builds the production output and serves it locally through Astro preview.

## Production release path

- Preview changes in a pull request first
- Confirm the preview workflow passes
- Run `./scripts/pre-deploy.sh` locally before pushing or merging
- Production deploy happens only from `main` via `.github/workflows/deploy.yml`

## Public repository safety rules

- Never add private IPs, local filesystem paths, or environment-specific instructions to docs or code
- Never commit secrets
- Keep workflows and docs portable for fresh clones
- Keep preview automation isolated from the production Pages environment
