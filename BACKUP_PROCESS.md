# Tastings Backup Process

## Overview
The repository uses two branches:
- **main**: Contains only the framework (templates, scripts, structure) - no personal data
- **tastings-backup**: Contains personal tastings and data files

The `.gitignore` excludes `WineCellar/1_Wines/` and `WineCellar/1_Whiskeys/` from the main branch.

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

4. **Switch back to main:**
   ```bash
   git checkout main
   ```

5. **Push both branches (use --force for backup branch):**
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
