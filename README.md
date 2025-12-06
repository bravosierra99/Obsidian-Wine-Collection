# The Reserve

My personal collection of wines and whiskeys, tracked in Obsidian with a sophisticated tasting note system.

## What This Is

This is my curated spirits collection vault, built on an Obsidian foundation. I've extended the original [Obsidian-Wine-Collection](https://github.com/Peptino/Obsidian-Wine-Collection) framework to track both wines and whiskeys with a separated bottle/tasting architecture.

Each spirit gets:
- **A bottle note** with all the metadata (distillery, region, price, etc.)
- **Separate tasting notes** for each time I taste it (multiple tastings per bottle)
- **Scoring systems**: American Wine Society (AWS) 20-point scale for wines, custom scoring for whiskeys
- **Aggregated views** showing averages across all tastings

## Key Features

- **Separated Architecture**: Bottles and tastings live in subdirectories, keeping the collection organized
- **Multiple Tasting Support**: Track how a bottle evolves over time or compare opinions with friends
- **Git Branch Strategy**:
  - `main` branch: Framework only (templates, scripts, structure)
  - `tastings-backup` branch: Personal data (bottles, tastings, images)
- **Interactive Forms**: Click "Add New Tasting" buttons to create tastings inline
- **DataviewJS Aggregation**: Automatic per-taster averages and statistics

## Tech Stack

**Obsidian Plugins:**
- [Dataview](https://github.com/blacksmithgu/obsidian-dataview) - Query and aggregate tasting data
- [Metadata Menu](https://github.com/mdelobelle/metadatamenu) - Structured metadata with field buttons
- [Minimal Theme](https://github.com/kepano/obsidian-minimal) - Clean, focused interface

**Scoring Systems:**
- **Wines**: AWS 20-point scale (Appearance 0-3, Aroma 0-6, Taste 0-6, Aftertaste 0-3, Overall 0-2)
- **Whiskeys**: Custom multi-category scoring

## Structure

```
WineCellar/
├── 0_Collection/          # Collection views (all bottles, cards, inventory)
├── 1_Wines/               # Wine bottles and tastings
│   └── {BottleName}/
│       ├── {BottleName}.md
│       └── Tasting-{Date}-{Taster}.md
├── 1_Whiskeys/            # Whiskey bottles and tastings
│   └── {BottleName}/
│       ├── {BottleName}.md
│       └── Tasting-{Date}-{Taster}.md
├── 8_FileClass/           # Metadata definitions
├── 9_Templates/           # Note templates
└── labels/                # Bottle label images
```

## Workflow

1. **Add a bottle**: Use the template to create a new bottle note
2. **Add tastings**: Click "Add New Tasting" button on any bottle
3. **Track scores**: Fill in the AWS scoring fields (wines) or custom scores (whiskeys)
4. **View aggregates**: See per-taster averages and all tastings in the bottle note

## Git Workflow

See [BACKUP_PROCESS.md](BACKUP_PROCESS.md) for details on the dual-branch strategy.

**Daily work** (on `tastings-backup`):
- Add bottles, tastings, images
- All personal data lives here

**Framework changes** (on `main`):
- Update templates, FileClasses, scripts
- Merge back to `tastings-backup` when done

## Origins

This project started as a fork of Peptino's excellent [Obsidian-Wine-Collection](https://github.com/Peptino/Obsidian-Wine-Collection). I've extended it with:
- Whiskey support
- Separated bottle/tasting architecture
- AWS scoring system for wines
- Multiple taster support with aggregation
- Git branch strategy for framework vs. data

## Future Plans

Working on automation tools (in sibling `automation/` directory) to:
- Auto-populate bottle metadata from web research
- Extract label text from photos using vision models
- Auto-crop and optimize label images
- Batch import from sommelier lists

---

**License**: MIT (see [LICENSE](LICENSE))

**Original Framework**: Copyright (c) 2025 Peptino
**Modifications**: Copyright (c) 2025 Ben Smith
