# Packetvision LLC - Company Website

A modern company website built with Astro, Tailwind CSS, and TypeScript.

## 🚀 Project Structure

```
/
├── public/
│   └── favicon.svg
├── src/
│   ├── components/
│   ├── layouts/
│   │   └── BaseLayout.astro
│   ├── pages/
│   │   └── index.astro
│   └── styles/
│       └── global.css
├── astro.config.mjs
├── package.json
├── tailwind.config.js
└── tsconfig.json
```

## 🧞 Commands

All commands are run from the root of the project, from a terminal:

| Command                   | Action                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |

## 🎨 Features

- ⚡️ Built with Astro for optimal performance
- 🎨 Styled with Tailwind CSS
- 🌙 Permanent dark mode
- 📱 Fully responsive design
- ⚙️ TypeScript support
- 🚀 Optimized for GitHub Pages deployment

## 🚀 Deployment

### Production

Production deploys remain gated to pushes on `main` via `.github/workflows/deploy.yml`.
That workflow builds the site and publishes it to GitHub Pages for `packetvision.net`.

### Preview / staging path

Because GitHub Pages only provides a single live site for this repository, non-production review uses a dedicated preview build workflow instead of a second Pages environment.

- Pull requests targeting `main` automatically run `.github/workflows/preview.yml`
- The workflow builds the site and uploads a `packetvision-preview-*` artifact from the generated `dist/` output
- Reviewers can download that artifact from the Actions run to inspect the exact static site that would ship
- Maintainers can also reproduce the same preview locally with `npm install && npm run build && npm run preview`

This keeps preview validation isolated from production while preserving a conservative release path: preview on pull request, production only after merge to `main`.

## 📝 License

Copyright © 2026 Packetvision LLC. All rights reserved.# Force redeploy
