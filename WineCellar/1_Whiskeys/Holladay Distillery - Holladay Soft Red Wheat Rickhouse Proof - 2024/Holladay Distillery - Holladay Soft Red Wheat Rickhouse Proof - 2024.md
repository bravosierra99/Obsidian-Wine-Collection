---
fileClass: Whiskey
Name: Holladay Distillery - Holladay Soft Red Wheat Rickhouse Proof - 2024
Distiller: Holladay Distillery
WhiskeyName: Holladay Soft Red Wheat Rickhouse Proof
AgeStatement: "6"
Year: "2024"
Type: Wheated Bourbon
MashBill:
BarrelType:
Proof: 121.4
Region-State: Missouri
BatchNumber:
BottleNumber:
Price: "85"
PurchaseSource: Perfect Pour Columbia
PurchaseLink:
Inventory: 0
Buy: 1
Stars: --
ValueForMoney: 8.5
BottleOpenedDate: 2024-11-15
BottleImage:
---

## Bottle Information

### Product Details

### Tasting Notes Summary

```dataviewjs
// Get the current bottle name
const currentBottle = dv.current().file.name;

// Get all tastings for this bottle (in subdirectory)
const tastings = dv.pages('"1_Whiskeys/' + currentBottle + '"')
    .where(p => p.fileClass === "Tasting")
    .sort(p => p.Date, 'desc');

if (tastings.length === 0) {
    dv.paragraph("No tastings recorded yet. [Add a tasting](#)");
} else {
    // Calculate per-taster averages
    const tasterStats = {};

    for (let tasting of tastings) {
        const taster = tasting.TasterName || "Unknown";
        if (!tasterStats[taster]) {
            tasterStats[taster] = {
                count: 0,
                nose: 0,
                palate: 0,
                finish: 0,
                overall: 0,
                total: 0
            };
        }
        tasterStats[taster].count++;
        tasterStats[taster].nose += tasting.Nose || 0;
        tasterStats[taster].palate += tasting.Palate || 0;
        tasterStats[taster].finish += tasting.Finish || 0;
        tasterStats[taster].overall += tasting.Overall || 0;
        tasterStats[taster].total += tasting.TotalScore || 0;
    }

    // Display per-taster averages
    dv.header(3, "Average Scores by Taster");
    const tasterRows = Object.entries(tasterStats).map(([taster, stats]) => [
        taster,
        stats.count,
        (stats.nose / stats.count).toFixed(1),
        (stats.palate / stats.count).toFixed(1),
        (stats.finish / stats.count).toFixed(1),
        (stats.overall / stats.count).toFixed(1),
        (stats.total / stats.count).toFixed(1)
    ]);
    dv.table(
        ["Taster", "Tastings", "Nose", "Palate", "Finish", "Overall", "Total"],
        tasterRows
    );

    // Display all tastings
    dv.header(3, "All Tastings");
    const rows = tastings.map(p => [
        p.file.link,
        p.Date,
        p.TasterName,
        p.DaysFromCrack,
        p.FillLevel + "%",
        p.Nose,
        p.Palate,
        p.Finish,
        p.Overall,
        p.TotalScore
    ]);
    dv.table(
        ["Tasting", "Date", "Taster", "Days", "Fill", "Nose", "Palate", "Finish", "Overall", "Total"],
        rows
    );
}
```

### Create New Tasting

To add a new tasting for this bottle, use the QuickAdd command or create a new note in the `1_Whiskeys/Holladay Distillery - Holladay Soft Red Wheat Rickhouse Proof - 2024` folder.

## Bottle Image
BottleImage::![[Holladay Distillery - Holladay Soft Red Wheat Rickhouse Proof - 2024.jpg]]

## Label
Label::
