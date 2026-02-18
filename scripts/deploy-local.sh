#!/bin/bash
# Local deployment script for packetvision.net (PACV)
# Builds and serves the site locally on localhost for Stuart to review

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Configuration (use different port than stuartbain.com)
TAILSCALE_IP="localhost"
PORT="4322"
PREVIEW_URL="http://${TAILSCALE_IP}:${PORT}"

log "🚀 packetvision.net Local Deployment Starting..."

# Check if we're in the right directory
if [[ ! -f "astro.config.mjs" ]]; then
    error "Not in packetvision.net project directory! Run from project root."
    exit 1
fi

# Run pre-deploy validation first
if [[ -f "scripts/pre-deploy.sh" ]]; then
    log "Running pre-deploy validation..."
    bash scripts/pre-deploy.sh
    success "Pre-deploy validation passed ✓"
else
    warning "Pre-deploy script not found, continuing without validation..."
fi

# Ensure Node.js 24 is active
log "Setting up Node.js 24 environment..."
source /home/stuart/.nvm/nvm.sh
nvm use 24 >/dev/null 2>&1
NODE_VERSION=$(node --version)
success "Node.js $NODE_VERSION active"

# Build the project (if not already built)
if [[ ! -d "dist" ]] || [[ ! -f "dist/index.html" ]]; then
    log "Building Astro project..."
    npm run build
    success "Build completed ✓"
else
    log "Using existing build in dist/ directory"
fi

# Check if port is already in use
if lsof -Pi :$PORT -sTCP:LISTEN -t >/dev/null ; then
    warning "Port $PORT is already in use. Attempting to kill existing process..."
    PID=$(lsof -Pi :$PORT -sTCP:LISTEN -t)
    kill $PID 2>/dev/null || true
    sleep 2
fi

log "Starting Astro preview server..."
log "Preview URL: $PREVIEW_URL"
success "🌐 Site will be available at: $PREVIEW_URL"

# Display some helpful info
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${GREEN}🏢 packetvision.net Local Preview${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "${BLUE}🔗 Preview URL:${NC} $PREVIEW_URL"
echo -e "${BLUE}🎯 localhost:${NC} $HOST"
echo -e "${BLUE}🚪 Port:${NC} $PORT"
echo -e "${BLUE}📁 Serving from:${NC} $(pwd)/dist"
echo ""
echo -e "${YELLOW}💡 Tips:${NC}"
echo "  • Site is only accessible via local network"
echo "  • Use Ctrl+C to stop the server"
echo "  • Deploy flag is FALSE - no GitHub pushes will be made"
echo "  • Company website ready for review and deployment!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Start the preview server bound to localhost
export HOST=$HOST
export PORT=$PORT

# Start Astro preview server
npm run preview -- --host $HOST --port $PORT