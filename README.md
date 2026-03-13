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

This site is configured for a conservative GitHub Pages release flow:

1. validate changes locally with `./scripts/pre-deploy.sh`
2. open a pull request to `main`
3. wait for the `Validate Packetvision.net` workflow to pass
4. merge after review
5. manually run `Deploy Packetvision.net to GitHub Pages` from GitHub Actions

See [RELEASE.md](./RELEASE.md) for the full promotion path, required gates, and rollback steps.

## 📝 License

Copyright © 2026 Packetvision LLC. All rights reserved.# Force redeploy
