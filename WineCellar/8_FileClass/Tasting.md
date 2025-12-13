---
fileClass:
  version: 1.0
fields:
  - name: Date
    type: Date
    id: TDate
    options:
      dateFormat: "YYYY-MM-DD"
  - name: DaysFromCrack
    type: Number
    id: TDaysFromCrack
    options:
      min: 0
      step: 1
  - name: TasterName
    type: Input
    id: TTasterName
  - name: FillLevel
    type: Number
    id: TFillLevel
    options:
      min: 0
      max: 100
      step: 1
  - name: Nose
    type: Number
    id: TNose
    options:
      min: 0
      max: 3
      step: 0.1
  - name: Palate
    type: Number
    id: TPalate
    options:
      min: 0
      max: 3
      step: 0.1
  - name: Finish
    type: Number
    id: TFinish
    options:
      min: 0
      max: 3
      step: 0.1
  - name: Overall
    type: Number
    id: TOverall
    options:
      min: 0
      max: 1
      step: 0.05
  - name: TotalScore
    type: Formula
    id: TTotalScore
    options:
      autoUpdate: true
      formula: current.Nose + current.Palate + current.Finish + current.Overall
  - name: LinkedBottle
    type: Input
    id: TLinkedBottle
---

# Tasting FileClass

This FileClass defines the metadata structure for individual whiskey tasting notes.

## Fields:
- **Date**: Date of the tasting session
- **DaysFromCrack**: Number of days since the bottle was opened
- **TasterName**: Name of the person tasting
- **FillLevel**: Bottle fill level as percentage (0-100)
- **Nose**: Aroma score (0-3, 0.1 precision)
- **Palate**: Taste score (0-3, 0.1 precision)
- **Finish**: Aftertaste score (0-3, 0.1 precision)
- **Overall**: Overall impression (0-1, 0.05 precision)
- **TotalScore**: Auto-calculated sum of all scores (max 10)
- **LinkedBottle**: Link to the parent bottle note
