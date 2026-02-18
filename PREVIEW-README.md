# Packetvision.net Deployment Scripts

Pre-deployment validation and local preview scripts for the Packetvision company website.

## Scripts

### `./scripts/pre-deploy.sh`
**Pre-deployment validation pipeline:**
- ✅ Node.js 24 environment setup
- ✅ TypeScript validation (`astro check`)
- ✅ Astro build process  
- ✅ Build artifact verification
- ✅ Security scanning (no secrets in output)
- ✅ Bundle size analysis
- ✅ Required pages validation (home, about, services, contact)

### `./scripts/deploy-local.sh`
**Local preview server:**
- 🌐 Serves site at **http://100.78.31.86:4322** (Tailscale only)
- 🔧 Runs pre-deploy validation first
- 📦 Uses existing build or builds fresh
- 🚪 Uses port 4322 (different from stuartbain.com's 4321)

## Usage

### Preview the Site Locally
```bash
# Run validation + start preview server
./scripts/deploy-local.sh

# Access at: http://100.78.31.86:4322
# (Tailscale network only)
```

### Validation Only
```bash
# Just run pre-deploy checks
./scripts/pre-deploy.sh
```

## Current Status

✅ **Site Pages Complete:**
- Homepage (company overview, hero section)
- About (founder bio, company history)  
- Services (offerings, pricing)
- Contact (obfuscated email, forms)

✅ **Technical Stack:**
- Astro 4.x + TypeScript
- Tailwind CSS 4.0
- Permanent dark mode
- GitHub Pages ready

⏳ **Next Steps:**
1. Stuart reviews via local preview
2. Set `deploy: true` in project-priorities.md
3. Push to GitHub + set up GitHub Actions
4. Configure packetvision.net DNS (CNAME)

## GitHub Pages Deployment

Once approved, the site will deploy to:
- **GitHub Pages:** https://packetvision-llc.github.io  
- **Custom Domain:** https://packetvision.net (after DNS setup)

The repository is ready for GitHub Actions workflow similar to stbain.github.io.