---
fileClass: Whiskey
Name: Holladay Distillery - Holladay Soft Red Wheat Rickhouse Proof - 2024
Distiller: Holladay Distillery
WhiskeyName: Holladay Soft Red Wheat Rickhouse Proof
AgeStatement: "6+ years"
Year: "2024"
Type: Wheated Bourbon
MashBill: 73% Corn, 15% Wheat, 12% Barley
BarrelType: New Charred Oak
Proof: 121.4
Region-State: Weston, Missouri
BatchNumber: October 2024
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

**About This Bourbon:**
Holladay Soft Red Wheat Rickhouse Proof is a wheated bourbon produced at Holladay Distillery in Weston, Missouri. Each batch is bottled at barrel proof (uncut, unfiltered) directly from the rickhouse after a minimum of 6 years of aging. The October 2024 batch was pulled from Rickhouses B and C.

**Mash Bill:** 73% Corn, 15% Wheat, 12% Barley

**Production Notes:**
- Aged minimum 6 years in original Holladay rickhouses
- Bottled at exact barrel proof (no water added)
- Each batch varies in proof and flavor profile
- Produced in Weston, Missouri

**Typical Flavor Profile (per reviews):**
Stone fruits, caramel, banana nut bread, cedar wood, molasses, leather, baking spices

**Market Info:**
- MSRP: $70-80
- Released in batches throughout the year

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
        // Create modal for input
        class TastingModal extends this.app.workspace.Modal {
            constructor(app, onSubmit) {
                super(app);
                this.onSubmit = onSubmit;
            }

            onOpen() {
                const { contentEl } = this;
                contentEl.createEl("h2", { text: "New Tasting" });

                // Date input
                const dateDiv = contentEl.createDiv();
                dateDiv.createEl("label", { text: "Date (YYYY-MM-DD):" });
                const dateInput = dateDiv.createEl("input", { type: "text" });
                dateInput.value = new Date().toISOString().split('T')[0];
                dateInput.style.width = "100%";
                dateInput.style.marginBottom = "10px";

                // Taster input
                const tasterDiv = contentEl.createDiv();
                tasterDiv.createEl("label", { text: "Taster Name:" });
                const tasterInput = tasterDiv.createEl("input", { type: "text" });
                tasterInput.style.width = "100%";
                tasterInput.style.marginBottom = "10px";

                // Days from crack input
                const daysDiv = contentEl.createDiv();
                daysDiv.createEl("label", { text: "Days from crack:" });
                const daysInput = daysDiv.createEl("input", { type: "number" });
                daysInput.value = "0";
                daysInput.style.width = "100%";
                daysInput.style.marginBottom = "10px";

                // Fill level input
                const fillDiv = contentEl.createDiv();
                fillDiv.createEl("label", { text: "Fill level (%):" });
                const fillInput = fillDiv.createEl("input", { type: "number" });
                fillInput.value = "100";
                fillInput.style.width = "100%";
                fillInput.style.marginBottom = "10px";

                // Submit button
                const submitBtn = contentEl.createEl("button", { text: "Create Tasting" });
                submitBtn.style.marginTop = "10px";
                submitBtn.addEventListener("click", () => {
                    this.onSubmit({
                        date: dateInput.value,
                        taster: tasterInput.value,
                        days: daysInput.value,
                        fill: fillInput.value
                    });
                    this.close();
                });
            }

            onClose() {
                const { contentEl } = this;
                contentEl.empty();
            }
        }

        // Show modal and handle submission
        new TastingModal(this.app, async (data) => {
            try {
                if (!data.date || !data.taster) {
                    new Notice("Date and Taster Name are required!");
                    return;
                }

                // Read template
                const templatePath = "WineCellar/9_Templates/Tasting.md";
                const template = await app.vault.adapter.read(templatePath);

                // Replace template variables
                let content = template
                    .replace(/{{value:Date}}/g, data.date)
                    .replace(/{{value:TasterName}}/g, data.taster)
                    .replace(/{{value:DaysFromCrack}}/g, data.days)
                    .replace(/{{value:FillLevel}}/g, data.fill)
                    .replace(/{{value:LinkedBottle}}/g, `[[${bottleName}]]`);

                // Create file
                const fileName = `Tasting-${data.date}-${data.taster}.md`;
                const filePath = `WineCellar/${folderPath}/${fileName}`;

                await app.vault.create(filePath, content);

                // Open the new file
                const file = app.vault.getAbstractFileByPath(filePath);
                await app.workspace.getLeaf().openFile(file);

                new Notice("Tasting created successfully!");
            } catch (error) {
                console.error("Error creating tasting:", error);
                new Notice(`Error creating tasting: ${error.message}`);
            }
        }).open();
    } catch (error) {
        console.error("Error opening modal:", error);
        new Notice(`Error: ${error.message}`);
    }
});
```

## Bottle Image
BottleImage::![[Holladay Distillery - Holladay Soft Red Wheat Rickhouse Proof - 2024.jpg]]

## Label
Label::
