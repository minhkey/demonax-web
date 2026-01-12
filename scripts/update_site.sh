#!/bin/bash
# Automated Site Update Script
# This script regenerates profile pages from the database and renders the Quarto site
# Designed to run after database updates (e.g., via cron after 06:00 database refresh)

# Exit on any error
set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
LOG_DIR="$PROJECT_DIR/log"
LOG_FILE="$LOG_DIR/update_site.log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Function to log messages with timestamp
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# Function to handle errors
handle_error() {
    local exit_code=$1
    local step=$2
    log "ERROR: Failed at $step (exit code: $exit_code)"
    log "Site update failed"
    exit "$exit_code"
}

# Trap errors and call handle_error
trap 'handle_error $? "unknown step"' ERR

# Change to project directory
cd "$PROJECT_DIR"

log "Starting site update"

# Step 1: Regenerate employee profile pages
log "Step 1/3: Regenerating employee profile pages"
if Rscript scripts/generate_employee_pages.R >> "$LOG_FILE" 2>&1; then
    log "Employee pages regenerated successfully"
else
    handle_error $? "employee page generation"
fi

# Step 2: Regenerate server profile pages
log "Step 2/3: Regenerating server profile pages"
if Rscript scripts/generate_server_pages.R >> "$LOG_FILE" 2>&1; then
    log "Server pages regenerated successfully"
else
    handle_error $? "server page generation"
fi

# Step 3: Render the Quarto site
log "Step 3/3: Rendering Quarto site"
if quarto render >> "$LOG_FILE" 2>&1; then
    log "Site rendered successfully"
else
    handle_error $? "quarto render"
fi

log "Site update completed successfully"

exit 0
