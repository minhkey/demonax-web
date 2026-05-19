#!/bin/bash
# Development helper script for demonax-web
# Renders the site, sets up map symlink, and starts preview server

set -e  # Exit on error

echo "=========================================="
echo "Demonax Web - Development Setup"
echo "=========================================="

# Render the site
echo ""
echo "📦 Rendering site with Quarto..."
quarto render

# Create symlink to mapper output
echo ""
echo "🔗 Creating symlink to map files..."
rm -rf _site/map  # Remove if exists (file or directory)
ln -sf ~/repos/demonax-mapper/output _site/map
echo "   Symlink created: _site/map -> ~/repos/demonax-mapper/output"

# Start preview server
echo ""
echo "🚀 Starting Quarto preview server..."
echo "   Server will be available at: http://localhost:4200"
echo "   Press Ctrl+C to stop"
echo ""
quarto preview --port 4200 --no-browser
