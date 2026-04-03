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
- 🌐 Serves site at **http://localhost:4322**
- 🔧 Runs pre-deploy validation first
- 📦 Uses existing build or builds fresh
- 🚪 Uses port 4322 (different from stuartbain.com's 4321)

## Usage

### Preview the Site Locally
```bash
# Run validation + start preview server
./scripts/deploy-local.sh

# Access at: http://localhost:4322
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
1. Review locally with `./scripts/deploy-local.sh`
2. Open a PR to `main` and wait for the validation workflow to pass
3. Merge after review, then manually run the GitHub Pages deploy workflow
4. Confirm the live site and packetvision.net DNS/CNAME behavior

## GitHub Pages Deployment

Once approved, the site will deploy to:
- **GitHub Pages:** https://packetvision-llc.github.io  
- **Custom Domain:** https://packetvision.net (after DNS setup)

The repository is ready for GitHub Actions workflow similar to stbain.github.io.