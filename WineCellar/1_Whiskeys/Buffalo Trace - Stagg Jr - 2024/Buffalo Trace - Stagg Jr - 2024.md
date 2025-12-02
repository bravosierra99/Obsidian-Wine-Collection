---
fileClass: Whiskey
Name: Buffalo Trace - Stagg Jr - 2024
Distiller: Buffalo Trace
WhiskeyName: Stagg Jr Batch 24D
AgeStatement: 7-9 years
Year: "2024"
Type: Bourbon
MashBill: ~89.5% Corn, ~7% Rye, ~3.5% Malted Barley (BT Mashbill #1)
BarrelType: New Charred Oak
Proof: 127.4
Region-State: Frankfort, Kentucky
BatchNumber: 24D
BottleNumber:
Price: "150"
PurchaseSource: Geoff
PurchaseLink:
Inventory: 0
Buy: 0
Stars: --
ValueForMoney:
BottleOpenedDate:
BottleImage:
---
**
## Bottle Information

### Product Details

**About This Bourbon:**
Stagg Jr is Buffalo Trace's barrel proof offering that pays homage to George T. Stagg, the legendary BTAC release. Batch 24D marks an unprecedented fourth release in 2024, breaking from the traditional two releases per year. This batch was released in fall 2024/early 2025.

**Mash Bill:** Buffalo Trace Mashbill #1 (~89.5% Corn, ~7% Rye, ~3.5% Malted Barley)

**Production Notes:**
- Aged 7-9 years (estimated)
- Bottled at barrel proof (uncut, unfiltered)
- Uses the same mashbill as George T. Stagg, Eagle Rare, and E.H. Taylor Jr.
- Produced at Buffalo Trace Distillery in Frankfort, Kentucky
- Batch 24D: 4th release of 2024 at 127.4 proof

**Typical Flavor Profile (per reviews):**
Hot with alcohol, oak, and spice. Reviews note this batch is "mediocre as far as Stagg Jrs go" but still worth MSRP. Hits the palate hot with lingering oak and spice through the finish.

**Market Info:**
- MSRP: $70
- Batch 24D was an unanticipated fourth release
- Mixed reviews from bourbon enthusiasts
- Worth MSRP but not secondary prices according to reviewers

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

// Create container
const container = dv.container;

// Create button
const button = dv.el('button', 'Add New Tasting');
button.style.padding = '8px 16px';
button.style.backgroundColor = '#4CAF50';
button.style.color = 'white';
button.style.border = 'none';
button.style.borderRadius = '4px';
button.style.cursor = 'pointer';
button.style.fontSize = '14px';
button.style.marginBottom = '10px';

// Create form (hidden by default)
const form = container.createEl('div');
form.style.display = 'none';
form.style.padding = '15px';
form.style.border = '1px solid #ccc';
form.style.borderRadius = '4px';
form.style.marginTop = '10px';
form.style.backgroundColor = 'var(--background-primary)';

form.innerHTML = `
    <h3>New Tasting</h3>
    <div style="margin-bottom: 10px;">
        <label style="display: block; margin-bottom: 5px;">Date (YYYY-MM-DD):</label>
        <input type="text" id="tasting-date" value="${new Date().toISOString().split('T')[0]}" style="width: 100%; padding: 5px;">
    </div>
    <div style="margin-bottom: 10px;">
        <label style="display: block; margin-bottom: 5px;">Taster Name:</label>
        <input type="text" id="tasting-taster" style="width: 100%; padding: 5px;">
    </div>
    <div style="margin-bottom: 10px;">
        <label style="display: block; margin-bottom: 5px;">Days from crack:</label>
        <input type="number" id="tasting-days" value="0" style="width: 100%; padding: 5px;">
    </div>
    <div style="margin-bottom: 10px;">
        <label style="display: block; margin-bottom: 5px;">Fill level (%):</label>
        <input type="number" id="tasting-fill" value="100" style="width: 100%; padding: 5px;">
    </div>
    <button id="create-tasting-btn" style="padding: 8px 16px; background-color: #4CAF50; color: white; border: none; border-radius: 4px; cursor: pointer; margin-right: 10px;">Create</button>
    <button id="cancel-tasting-btn" style="padding: 8px 16px; background-color: #ccc; color: black; border: none; border-radius: 4px; cursor: pointer;">Cancel</button>
`;

// Toggle form visibility
button.addEventListener('click', () => {
    form.style.display = form.style.display === 'none' ? 'block' : 'none';
});

// Cancel button
form.querySelector('#cancel-tasting-btn').addEventListener('click', () => {
    form.style.display = 'none';
});

// Create button
form.querySelector('#create-tasting-btn').addEventListener('click', async () => {
    try {
        const date = form.querySelector('#tasting-date').value;
        const taster = form.querySelector('#tasting-taster').value;
        const days = form.querySelector('#tasting-days').value;
        const fill = form.querySelector('#tasting-fill').value;

        if (!date || !taster) {
            new Notice("Date and Taster Name are required!");
            return;
        }

        // Read template
        const templatePath = "9_Templates/Tasting.md";
        const template = await app.vault.adapter.read(templatePath);

        // Replace template variables
        let content = template
            .replace(/{{value:Date}}/g, date)
            .replace(/{{value:TasterName}}/g, taster)
            .replace(/{{value:DaysFromCrack}}/g, days)
            .replace(/{{value:FillLevel}}/g, fill)
            .replace(/{{value:LinkedBottle}}/g, `[[${bottleName}]]`);

        // Create file
        const fileName = `Tasting-${date}-${taster}.md`;
        const filePath = `${folderPath}/${fileName}`;

        await app.vault.create(filePath, content);

        // Open the new file
        const file = app.vault.getAbstractFileByPath(filePath);
        await app.workspace.getLeaf().openFile(file);

        new Notice("Tasting created successfully!");

        // Hide and reset form
        form.style.display = 'none';
        form.querySelector('#tasting-date').value = new Date().toISOString().split('T')[0];
        form.querySelector('#tasting-taster').value = '';
        form.querySelector('#tasting-days').value = '0';
        form.querySelector('#tasting-fill').value = '100';
    } catch (error) {
        console.error("Error creating tasting:", error);
        new Notice(`Error: ${error.message}`);
    }
});
```

## Bottle Image
BottleImage::![[Buffalo Trace - Stagg Jr - 2024.webp]]

## Label
Label::
