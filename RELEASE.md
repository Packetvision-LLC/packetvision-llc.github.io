# Packetvision.net Release Path

This repository uses a conservative release path so validated changes do not auto-promote to the public site unexpectedly.

## Release Principles

- `main` is the public-release branch.
- Every change lands through a pull request.
- Every pull request must pass the validation workflow before merge.
- Production deployment is a separate manual action from the GitHub Actions UI.
- `scripts/pre-deploy.sh` is the authoritative validation entrypoint for both local checks and CI.

## Safe Promotion Flow

1. Create a feature branch from `main`.
2. Make the change and run local validation:
   ```bash
   npm ci
   ./scripts/pre-deploy.sh
   ```
3. If a reviewer needs a local smoke test, run:
   ```bash
   ./scripts/deploy-local.sh
   ```
4. Open a pull request targeting `main`.
5. Wait for the **Validate Packetvision.net** workflow to pass.
6. Review the PR diff and confirm it only contains the intended public-site change.
7. Merge the PR into `main` only after validation and review are complete.
8. After merge, go to **Actions → Deploy Packetvision.net to GitHub Pages** and run the workflow manually.
9. Confirm the deployment URL and perform a post-deploy smoke test on the live site.

## Why deployment is manual

The site is public-facing. Separating merge from deploy gives maintainers a final approval point after code review and CI validation. That keeps content, SEO, and public messaging changes from shipping automatically just because a branch was merged.

## Required Gates

- Local `./scripts/pre-deploy.sh` before requesting review
- Pull request validation in GitHub Actions
- Human review before merge
- Manual production deploy from Actions after merge

## Emergency rollback

If a bad release reaches production:

1. Revert the offending commit on `main` with a new pull request.
2. Run validation again.
3. Merge the revert.
4. Manually run the deploy workflow to publish the rollback.
