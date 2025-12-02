---
fileClass: Whiskey
Name: "{{value:Distiller}} - {{value:WhiskeyName}} - {{value:Year}}"
Distiller: "{{value:Distiller}}"
WhiskeyName: "{{value:WhiskeyName}}"
AgeStatement:
Year: "{{value:Year}}"
Type:
MashBill:
BarrelType:
Proof:
Region-State:
BatchNumber:
BottleNumber:
Price:
PurchaseSource:
PurchaseLink:
Inventory: 0
Buy: 0
Stars: --
ValueForMoney:
BottleOpenedDate:
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

```dataviewjs
const bottleName = dv.current().file.name;
const folderPath = `1_Whiskeys/${bottleName}`;

// Create button
const button = dv.el('button', 'Add New Tasting');
button.style.padding = '8px 16px';
button.style.backgroundColor = '#4CAF50';
button.style.color = 'white';
button.style.border = 'none';
button.style.borderRadius = '4px';
button.style.cursor = 'pointer';
button.style.fontSize = '14px';

button.addEventListener('click', async () => {
    try {
        // Use metadata-menu's inputPrompt for input
        const date = await app.plugins.plugins['metadata-menu'].api.inputPrompt(
            "Date (YYYY-MM-DD)",
            new Date().toISOString().split('T')[0]
        );
        if (!date) return;

        const taster = await app.plugins.plugins['metadata-menu'].api.inputPrompt("Taster Name", "");
        if (!taster) return;

        const days = await app.plugins.plugins['metadata-menu'].api.inputPrompt("Days from crack", "0");
        const fill = await app.plugins.plugins['metadata-menu'].api.inputPrompt("Fill level (%)", "100");

        // Read template
        const templatePath = "WineCellar/9_Templates/Tasting.md";
        const template = await app.vault.adapter.read(templatePath);

        // Replace template variables
        let content = template
            .replace(/{{value:Date}}/g, date)
            .replace(/{{value:TasterName}}/g, taster)
            .replace(/{{value:DaysFromCrack}}/g, days || "0")
            .replace(/{{value:FillLevel}}/g, fill || "100")
            .replace(/{{value:LinkedBottle}}/g, `[[${bottleName}]]`);

        // Create file
        const fileName = `Tasting-${date}-${taster}.md`;
        const filePath = `WineCellar/${folderPath}/${fileName}`;

        await app.vault.create(filePath, content);

        // Open the new file
        const file = app.vault.getAbstractFileByPath(filePath);
        await app.workspace.getLeaf().openFile(file);

        new Notice("Tasting created successfully!");
    } catch (error) {
        console.error("Error creating tasting:", error);
        new Notice(`Error: ${error.message}`);
    }
});
```

## Bottle Image
BottleImage::

## Label
Label::
