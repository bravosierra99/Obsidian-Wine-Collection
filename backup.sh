#!/bin/bash
# Backup script for The Reserve vault
# Handles separate branches for framework vs bottle content

set -e  # Exit on error

VAULT_DIR="/mnt/d/Users/ben/Documents/spirits/the-reserve"
cd "$VAULT_DIR"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== The Reserve Backup ===${NC}\n"

# Check if we're in a git repo
if [ ! -d .git ]; then
    echo -e "${RED}Error: Not a git repository${NC}"
    exit 1
fi

# Parse arguments
DRY_RUN=false
if [ "$2" == "--dry-run" ] || [ "$2" == "-n" ]; then
    DRY_RUN=true
    echo -e "${YELLOW}DRY RUN MODE - No changes will be committed${NC}\n"
fi

# Function to backup bottles on tastings-backup branch
backup_bottles() {
    local dry_run=$1

    echo -e "${YELLOW}Backing up bottles and tastings...${NC}"

    # Ensure we're on tastings-backup branch
    current_branch=$(git branch --show-current)
    if [ "$current_branch" != "tastings-backup" ]; then
        echo -e "${BLUE}Switching to tastings-backup branch${NC}"
        if [ "$dry_run" = false ]; then
            git checkout tastings-backup
        fi
    fi

    # Show what would be added
    echo -e "\n${BLUE}Files to stage:${NC}"
    echo "  - Cellar/1_Wines/"
    echo "  - Cellar/1_Whiskeys/"

    if [ "$dry_run" = false ]; then
        # Stage ONLY bottle and tasting files
        git add Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null || true
    fi

    # Check if there are changes
    if [ "$dry_run" = false ]; then
        if git diff --cached --quiet; then
            echo -e "\n${GREEN}No changes to bottles or tastings${NC}"
            return
        fi

        # Show what's being committed
        echo -e "\n${BLUE}Changes to commit:${NC}"
        git diff --cached --stat

        # Commit with timestamp
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M")
        git commit -m "Backup bottles and tastings - $TIMESTAMP"
        echo -e "\n${GREEN}✓ Committed bottle changes${NC}"

        # Push to remote
        echo -e "\n${YELLOW}Pushing to remote...${NC}"
        git push origin tastings-backup
        echo -e "${GREEN}✓ Pushed to origin/tastings-backup${NC}"
    else
        # Dry run: show what would be committed
        echo -e "\n${BLUE}Would commit these changes:${NC}"
        git diff --stat Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null || echo "  (no changes)"
    fi
}

# Function to backup framework on main branch
backup_framework() {
    local dry_run=$1

    echo -e "\n${YELLOW}Backing up framework files...${NC}"

    # Ensure we're on main branch
    current_branch=$(git branch --show-current)
    if [ "$current_branch" != "main" ]; then
        echo -e "${BLUE}Switching to main branch${NC}"
        if [ "$dry_run" = false ]; then
            git checkout main
        fi
    fi

    # Show what would be added (everything except bottles)
    echo -e "\n${BLUE}Files to stage (excluding bottles):${NC}"
    echo "  - Root files (README.md, CLAUDE.md, etc.)"
    echo "  - Cellar/.obsidian/"
    echo "  - Cellar/8_FileClass/"
    echo "  - Cellar/9_Templates/"
    echo "  - Cellar/0_Collection/"
    echo "  - Cellar/WineCellar/"
    echo "  - .claude/"
    echo "  - backup.sh"

    if [ "$dry_run" = false ]; then
        # Stage ALL changes first
        git add -A

        # Then unstage bottle content
        git reset Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null || true
    fi

    # Check if there are changes
    if [ "$dry_run" = false ]; then
        if git diff --cached --quiet; then
            echo -e "\n${GREEN}No changes to framework${NC}"
            return
        fi

        # Show what's being committed
        echo -e "\n${BLUE}Changes to commit:${NC}"
        git diff --cached --stat

        # Commit with timestamp
        TIMESTAMP=$(date +"%Y-%m-%d %H:%M")
        git commit -m "Update framework - $TIMESTAMP"
        echo -e "\n${GREEN}✓ Committed framework changes${NC}"

        # Push to remote
        echo -e "\n${YELLOW}Pushing to remote...${NC}"
        git push origin main
        echo -e "${GREEN}✓ Pushed to origin/main${NC}"
    else
        # Dry run: show what would be committed
        # Temporarily stage to show diff, then unstage
        git add -A 2>/dev/null || true
        git reset Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null || true

        echo -e "\n${BLUE}Would commit these changes:${NC}"
        git diff --cached --stat 2>/dev/null || echo "  (no changes)"

        # Unstage everything
        git reset 2>/dev/null || true
    fi
}

# Function to show status
show_status() {
    echo -e "${BLUE}=== Current Status ===${NC}\n"

    # Show current branch
    CURRENT_BRANCH=$(git branch --show-current)
    echo -e "Current branch: ${GREEN}$CURRENT_BRANCH${NC}\n"

    # Show uncommitted changes by category
    echo -e "${BLUE}Uncommitted changes:${NC}\n"

    # Check bottles
    if ! git diff --quiet Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null; then
        echo -e "${YELLOW}Bottles/Tastings (goes to tastings-backup):${NC}"
        git status --short Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null | head -10
        echo ""
    fi

    # Check framework
    git add -A 2>/dev/null || true
    git reset Cellar/1_Wines/ Cellar/1_Whiskeys/ 2>/dev/null || true

    if ! git diff --cached --quiet 2>/dev/null; then
        echo -e "${YELLOW}Framework (goes to main):${NC}"
        git diff --cached --stat 2>/dev/null | head -10
        echo ""
    fi

    # Reset staging
    git reset 2>/dev/null || true

    if git diff --quiet && git diff --cached --quiet; then
        echo -e "${GREEN}No uncommitted changes${NC}"
    fi
}

# Main logic
case "${1:-both}" in
    bottles)
        backup_bottles $DRY_RUN
        ;;
    framework)
        backup_framework $DRY_RUN
        ;;
    both)
        backup_bottles $DRY_RUN
        backup_framework $DRY_RUN
        ;;
    status)
        show_status
        ;;
    *)
        echo "Usage: $0 {bottles|framework|both|status} [--dry-run|-n]"
        echo ""
        echo "Commands:"
        echo "  bottles    - Backup bottles/tastings to tastings-backup branch"
        echo "  framework  - Backup framework files to main branch"
        echo "  both       - Backup both (default)"
        echo "  status     - Show current git status by category"
        echo ""
        echo "Options:"
        echo "  --dry-run, -n  - Show what would be done without making changes"
        echo ""
        echo "Examples:"
        echo "  ./backup.sh bottles --dry-run"
        echo "  ./backup.sh both"
        echo "  ./backup.sh status"
        exit 1
        ;;
esac

if [ "$DRY_RUN" = false ]; then
    echo -e "\n${GREEN}=== Backup Complete ===${NC}"
fi
