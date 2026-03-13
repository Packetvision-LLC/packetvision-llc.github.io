# Security Policy

## GitHub security coverage

This repository uses GitHub's built-in security features to keep the public site dependencies and workflow actions under review:

- **Dependabot version updates** are configured in `.github/dependabot.yml` for npm packages and GitHub Actions.
- **GitHub vulnerability alerts** should remain enabled in the repository settings so maintainers are notified when GitHub identifies a vulnerable dependency.
- **Dependabot security updates** should remain enabled so eligible advisory fixes can be proposed automatically.

## Maintainer response path

When a security alert or Dependabot PR appears:

1. Review the alert or dependency PR in GitHub.
2. Validate the site locally with `npm run build`.
3. Merge the smallest safe fix that clears the alert.
4. Confirm the GitHub Pages deployment completes successfully after merge.

## Reporting

If you discover a security issue that is not already tracked in GitHub alerts, open a private maintainer issue or contact Packetvision LLC maintainers directly before public disclosure.
