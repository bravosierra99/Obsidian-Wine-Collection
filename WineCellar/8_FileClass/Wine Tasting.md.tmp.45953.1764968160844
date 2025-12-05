---
fileClass:
  version: 1.0
fields:
  - name: Date
    type: Date
    id: WTDate
    options:
      dateFormat: "YYYY-MM-DD"
  - name: TasterName
    type: Input
    id: WTTasterName
  - name: Appearance
    type: Number
    id: WTAppearance
    options:
      min: 0
      max: 3
      step: 0.5
  - name: Aroma
    type: Number
    id: WTAroma
    options:
      min: 0
      max: 6
      step: 0.5
  - name: Taste
    type: Number
    id: WTTaste
    options:
      min: 0
      max: 6
      step: 0.5
  - name: Aftertaste
    type: Number
    id: WTAftertaste
    options:
      min: 0
      max: 3
      step: 0.5
  - name: Overall
    type: Number
    id: WTOverall
    options:
      min: 0
      max: 2
      step: 0.5
  - name: AWS Score
    type: Formula
    id: WTAWSScore
    options:
      autoUpdate: true
      formula: current.Appearance + current.Aroma + current.Taste + current.Aftertaste + current.Overall
  - name: 100pt Scale
    type: Formula
    id: WT100pt
    options:
      autoUpdate: true
      formula: (current.Appearance + current.Aroma + current.Taste + current.Aftertaste + current.Overall) * 5
  - name: LinkedBottle
    type: Input
    id: WTLinkedBottle
---

# Wine Tasting FileClass

This FileClass defines the metadata structure for individual wine tasting notes using the American Wine Society (AWS) 20-point scale.

## Fields:
- **Date**: Date of the tasting session
- **TasterName**: Name of the person tasting
- **Appearance**: Visual assessment (0-3 points)
- **Aroma**: Nose/bouquet assessment (0-6 points)
- **Taste**: Flavor assessment (0-6 points)
- **Aftertaste**: Finish assessment (0-3 points)
- **Overall**: Overall impression (0-2 points)
- **AWS Score**: Auto-calculated total (max 20 points)
- **100pt Scale**: Auto-converted to 100-point scale (AWS × 5)
- **LinkedBottle**: Link to the parent wine bottle note
