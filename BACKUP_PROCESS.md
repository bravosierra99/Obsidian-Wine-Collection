# Tastings Backup Process

## Overview
The repository uses two branches:
- **main**: Contains only the framework (templates, scripts, structure) - no personal data
- **tastings-backup**: Contains personal tastings and data files - **USE THIS BRANCH FOR DAILY WORK**

The `.gitignore` excludes `WineCellar/1_Wines/` and `WineCellar/1_Whiskeys/` from the main branch.

## Daily Workflow

**IMPORTANT: Stay on `tastings-backup` branch for all normal work!**

### Normal Operations (Adding Bottles, Tastings, Images)
- Work on `tastings-backup` branch
- Your tasting files are always present and accessible
- Add bottles, create tastings, add images normally
- Commit changes as needed

### Framework Changes (Templates, Scripts, Structure)
When updating templates, scripts, documentation, or other framework files:
1. Switch to `main` branch: `git checkout main`
2. Make framework changes and commit them
3. Switch back to `tastings-backup`: `git checkout tastings-backup`
4. Merge the framework changes: `git merge main`

This ensures both branches have the latest framework while keeping personal data separate.

## How to Backup Tastings (ALWAYS OVERWRITE, NO HISTORY)

This process backs up the current state of all tastings, overwriting the previous backup.

### Steps:

1. **Switch to backup branch:**
   ```bash
   git checkout tastings-backup
   ```

2. **Force add ignored directories:**
   ```bash
   git add -f WineCellar/1_Wines/ WineCellar/1_Whiskeys/
   ```

3. **Amend the previous commit (overwrites, no new history):**
   ```bash
   git commit --amend -m "Backup tastings and personal data - $(date +%Y-%m-%d)"
   ```

4. **Push backup branch (use --force to overwrite):**
   ```bash
   git push origin main
   git push origin tastings-backup --force
   ```

### What Gets Backed Up
- All tasting notes in `WineCellar/1_Wines/` and `WineCellar/1_Whiskeys/`
- Bottle images and labels
- Any personal data in those directories

### Important Notes
- The backup branch ALWAYS overwrites - no commit history is kept
- This is intentional - we only care about the current state, not the history
- The `--amend` flag overwrites the last commit instead of creating a new one
- Use `--force` when pushing to overwrite the remote backup branch
