# Step-by-step Approach
## Start with a new vault
The best way is to start with a new vault. I named it **"WineCellar“**, which is much more appealing than "WineFridge“. After you created it go to Settings (or Preferences at MacOS) &rarr; Options: Community plugins &rarr; Turn on community plugins &rarr; Browse and install and enable the six **plugins** Dataview, Metadata Menu, Quick Add, Paste image rename, Minimal Theme Settings, and Style Settings.

Then install the Minimal **theme**: Settings &rarr; Options: Appearance &rarr; Themes &rarr; Manage. Search for "Minimal“ and click on "install and use“. 

Let’s make some **folders** to start with (I use numbers at the beginning to have a proper sorting):
- 0_Collection
- 1_Wines
- 8_FileClass
- 9_Templates

Now we have to change some **settings**:
- Options: **Editor** &rarr; Display: readable line length &rarr; OFF
- Options: **Files and links** &rarr; Default location for new attachments &rarr; In subfolder under current folder
- Options: **Files and links** &rarr; Automatically update internal links &rarr; ON
- Options: **Files and links** &rarr; Subfolder name &rarr; labels
- Options: **Appearance** &rarr; Advanced: Windows frame style &rarr; Obsidian frame
- Options: **Core plugins**: Turn off Canvas, Daily notes, Graph view, Sync (if you saved your vault in an iCloud folder)
- Core plugins: **Templates** &rarr; Template folder location &rarr; 9_Templates
- Community plugins: **Dataview** &rarr; Enable JavaScript queries &rarr; ON
- Community plugins: **Dataview** &rarr; Enable inline JavaScript queries &rarr; ON
- Community plugins: **Dataview** &rarr; View: Display result count &rarr; OFF
- Community plugins: **Dataview** &rarr; View: Refresh Interval &rarr; 500
- Community plugins: **Dataview** &rarr; Tables: Primary column name &rarr; Wine
- Community plugins: **Metadata Menu** &rarr; Global settings: Excluded folders &rarr; Enter "9_Templates“ and press save
- Community plugins: **Metadata Menu** &rarr; FileClass settings: Class File path &rarr; 8_FileClass (and Save)
- Community plugins: **Metadata Menu** &rarr; FileClass settings: Default icon &rarr; wine (and Save)
- Community plugins: **Paste image rename** &rarr; Handle all attachments &rarr; ON
- Community plugins: **Style Settings** &rarr; Minimal &rarr; Dataview &rarr; Trim Dataview columns &rarr; OFF
- Community plugins: **Style Settings** &rarr; Minimal &rarr; Properties &rarr; Hide property heading &rarr; ON
- Community plugins: **Style Settings** &rarr; Minimal &rarr; Tables &rarr; Row lines &rarr; ON
- Community plugins: **Style Settings** &rarr; Minimal &rarr; Tables &rarr; Highlight active row &rarr; ON

## Template
The next step is to create our **template** for the tasting notes. Mark the folder "9_Templates“, right-click on the name and select "New note“. Name it "Tasting note“ and copy this text into this note:

```
---
fileClass: Wine
Name: "{{value:Winemaker}} - {{value:WineName}} - {{value:Vintage}}"
Winemaker: "{{value:Winemaker}}"
WineName: "{{value:WineName}}"
Vintage: "{{value:Vintage}}"
Type: 
Variety: 
Country-Region: 
Vineyard: 
Style: 
Price: 
PurchaseSource: 
PurchaseLink: 
Stars: --
ValueForMoney: 
Points: 
Buy: 0
Inventory: 0
---

## Tasting note
...

## Label
Label:: 
```

You can add more fields or more headlines, but it is a good starting point.

## FileClass

Now we are ready to set up our "FileClass“ for Metadata Menu. Next to the "8_FileClass“ you should see a "+“ sign, coming from Metadata Menu. 

![FileClass-Plus](https://github.com/user-attachments/assets/11a88b3b-b8ea-4fd5-b21d-2ff3c378f408)

Click on it and a window pops up, asking you for a fileClass name. Enter "Wine“ and save it. Now a new note was created in the "8_FileClass“ folder named "Wine“ with a wine glass symbol next to it. Whenever you click on this wine glass next to this note, you will see the fileClass details. You have to click on "FileClass fields“.

![FileClassFields](https://github.com/user-attachments/assets/0a8c70e1-d2e8-40b3-8247-d882f8278b25)

With the "plus“ symbol we can now create all the fields we need. Let’s enter _Winemaker_ as "Field Name“ and press the save button. Go on with all other pure text fields (_WineName_, _Vintage_, _Variety_, _Vineyard_, _Style_, _Price_, _Points_, _PurchaseSource_, and _PurchaseLink_). 

The "_Type_“ field is a select field. So press "plus“, type "Type“ and click on "Choose a type“ and select "Select“. At the bottom of the window you can click on "Add a value“. In the new field type "Red wine“. The add the next value "White wine“, next value "Rose wine“, and "Champagne“. You can add other types later. Now save this field. 

"_Country-Region_“ is a normal "Input“ field, but add "{{Country}} - {{Region}}“ in the Template field. "_Buy_“ and "_Inventory_“ are fields of type "Number“. For both enter "1“ in the "Step (optional)“ field and "0“ at "Min value (optional)“. 

"_ValueForMoney_“ is a field I use with values from 0 to 5, so I add this field as type "Number“ with a minimum value of "0“ and a max value of "5“. The next field is "_Stars_“. Choose the type "Select“ and add 6 values ("--" (for non rated), "⭐️“, "⭐️⭐️“, "⭐️⭐️⭐️“, "⭐️⭐️⭐️⭐️“, "⭐️⭐️⭐️⭐️⭐️“). The last field is "_Label_“ of type "Media“.

So we have our basic settings, the template, and the fields defined. 

## QuickAdd
Now we can use our **QuickAdd** template. Go to settings &rarr; Community plugins: QuickAdd. Enter "9_Templates“ in the "Template Folder Path“ and activate "Show icon in sidebar“. 

Then type "Wine“ in the field on top of the QuickAdd settings window, check if "Template“ is chosen, and click on "Add Choice“.

Now click on the lightning icon and then on the gear icon in the new line above (with "Wine“) to configure your template. Enter "9_Template/Tasting note“ for "Template Path“, activate "File Name Format“ and type "{{VALUE:Winemaker}} - {{VALUE:WineName}} - {{VALUE:Vintage}}“ in the field. Activate "Create in folder“, enter "1_Wines“ in the folder field, and click on "Add“. Set "Open“ to ON and close this window (with the "X“ on top of the window). If the QuickAdd icon doesn’t show up in the sidebar, restart Obsidian.

## First check
Now it is time for a first check. Click on the QuickAdd icon in the sidebar and choose "Wine“. A window shows up to enter the _winemaker_’s name, e.g. "Alvaro Palacios“, then the _name_ of the wine, e.g. "Finca Dofí Priorat“, and the _vintage_, e.g. "2016“. And voilà: your first wine tasting note is there. If you like you can fill in the missing fields. For "_Country-Region_“ click on the pen symbol and a window pops up. Now you can enter the country ("Spain“) and the Region ("Catalunya“) and see the result "Spain - Catalunya“. When you have created more wine tasting notes you can just type in the field first letters and you can choose from the already entered values.

For _stars_ click on the chevron and select e.g. 5 stars. To test the following views set _type_ to "Red wine“, _inventory_ to 1, _buy_ to 1 and _PurchaseSource_ to "ShopA“.

With drag and drop paste your _label_ picture. On a Mac you can drag it from your photos app and drop it in your note directly after "Label::“. When you release the mouse button a window pops up asking you whether you want to rename the picture to "Alvaro Palacios - Finca Dofí Priorat - 2016.jpeg“. Confirm by clicking on "Rename“. And that’s it. 

For the labels I use "The Unlabeler“ app, because I want to have nice, flat, undistorted labels. Without the app you can just crop the image of the bottle to see (nearly) just the label, but it is still not nice:

<img width="370" height="518" alt="grafik" src="https://github.com/user-attachments/assets/87cac3f0-3178-423c-94c4-fa4bee04afa0" />
.
<br/><br/>

With the app your label will look like this:

<img width="370" height="430" alt="grafik" src="https://github.com/user-attachments/assets/6debfd2c-6173-449c-b10c-8e0637f6214f" />
.  
<br/><br/>

Additionally you can add a star rating, which is very nice for the card view, which we will set up in a moment.

<img width="370" height="473" alt="grafik" src="https://github.com/user-attachments/assets/834025d7-556a-4558-a7cf-43d0070567a7" />
.  
<br/><br/>

Your wine folder should now look like this:

![WineFolder_with_first_note](https://github.com/user-attachments/assets/aa672924-eebf-407d-be76-9485c6edf8d9)

## Collections
### All wines
The last step is to create some notes to see your collection in different ways. Make four empty notes in the folder "0_Collection“ with the titles "All wines“, "Cards“, "Fridge“, "Shopping List ShopA“, and "Shopping List ShopB“ (and replace "ShopA“ and "ShopB“ with your favorite wine shop).

Open now the note "All wines“ and copy this code into your note: 

````
# White wines
```dataviewjs
const {fieldModifier: f} = this.app.plugins.plugins["metadata-menu"].api;

const pages = dv.pages('"1_Wines"')
	.filter(p => p.Type === "White wine")
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine","Winemaker", "Name", "Variety", "Vintage", "Country-Region", "Stars", "Value for Money", "Inventory", "Purchase Source", "Price", "Buy"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	p.Winemaker,
	p.WineName,
	p.Variety,
	p.Vintage,
	p["Country-Region"],
	await f(dv, p, "Stars", {options: {showAddField: true}}),
	p.ValueForMoney,
	await f(dv, p, "Inventory", {options: {alwaysOn: true, showAddField: true}}),
	p.PurchaseSource,
	p.Price,
	await f(dv, p, "Buy", {options: {alwaysOn: true, showAddField: true}})
	])
))
```

---
# Red wines
```dataviewjs
const {fieldModifier: f} = this.app.plugins.plugins["metadata-menu"].api;

const pages = dv.pages('"1_Wines"')
	.filter(p => p.Type === "Red wine")
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine","Winemaker", "Name", "Variety", "Vintage", "Country-Region", "Stars", "Value for Money", "Inventory", "Purchase Source", "Price", "Buy"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	p.Winemaker,
	p.WineName,
	p.Variety,
	p.Vintage,
	p["Country-Region"],
	await f(dv, p, "Stars", {options: {showAddField: true}}),
	p.ValueForMoney,
	await f(dv, p, "Inventory", {options: {alwaysOn: true, showAddField: true}}),
	p.PurchaseSource,
	p.Price,
	await f(dv, p, "Buy", {options: {alwaysOn: true, showAddField: true}})
	])
))
```
````

This will create two tables (for white and red wine each) and list the wines, sorted descending by _ValueForMoney_. In the reading view you should see the red wine of our first tasting note.

![RedWineList](https://github.com/user-attachments/assets/ff02f726-e4ec-4513-9a53-a25c6bae5698)

### Cards
Let’s set up the next view. Open the "Cards“ note and copy this code into the note:

````
---
cssclasses:
  - cards
  - cards-1-1
  - hide-properties
---

# White wines
```dataviewjs
const {fieldModifier: f} = this.app.plugins.plugins["metadata-menu"].api;

const pages = dv.pages('"1_Wines"')
	.filter(p => p.Type === "White wine")
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	])
))
```


---
# Red wines
```dataviewjs
const {fieldModifier: f} = this.app.plugins.plugins["metadata-menu"].api;

const pages = dv.pages('"1_Wines"')
	.filter(p => p.Type === "Red wine")
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	])
))
```
````

At the moment you still see the properties part above the cards. To hide it you have to add a little CSS snippet. Go to settings &rarr; Options: appearance &rarr; **CSS snippets** and click on the folder icon. Add a file there with the name "hide-properties.css", containing this text:

```
.hide-properties {
    --metadata-display-reading: none;
}
```

Reload the snippets and activate the "hide-properties" snippet.

### Fridge
The next note is the "Fridge“. Here you can see every wine which is currently in your wine fridge - so the "_Inventory_“ is larger than 0.

Copy this code into this note:
````
# White wines
```dataviewjs
const {fieldModifier: f} = this.app.plugins.plugins["metadata-menu"].api;

const pages = dv.pages('"1_Wines"')
	.filter(p => p.Type === "White wine" && p.Inventory > 0)
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine","Winemaker", "Name", "Variety", "Vintage", "Country-Region", "Stars", "Value for Money", "Inventory", "Purchase Source", "Price"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	p.Winemaker,
	p.WineName,
	p.Variety,
	p.Vintage,
	p["Country-Region"],
	await f(dv, p, "Stars", {options: {showAddField: true}}),
	p.ValueForMoney,
	await f(dv, p, "Inventory", {options: {alwaysOn: true, showAddField: true}}),
	p.PurchaseSource,
	p.Price,
	])
))
```

---
# Red wines
```dataviewjs
const {fieldModifier: f} = this.app.plugins.plugins["metadata-menu"].api;

const pages = dv.pages('"1_Wines"')
	.filter(p => p.Type === "Red wine" && p.Inventory > 0)
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine","Winemaker", "Name", "Variety", "Vintage", "Country-Region", "Stars", "Value for Money", "Inventory", "Purchase Source", "Price"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	p.Winemaker,
	p.WineName,
	p.Variety,
	p.Vintage,
	p["Country-Region"],
	await f(dv, p, "Stars", {options: {showAddField: true}}),
	p.ValueForMoney,
	await f(dv, p, "Inventory", {options: {alwaysOn: true, showAddField: true}}),
	p.PurchaseSource,
	p.Price,
	])
))
```
````

### Shopping List
And last but not least the shopping list. If have around 3 wine shops where I often buy wine. To fill my shopping list I increase the value of "Buy“. Every wine with a value for "_Buy_“ of more than 0 and the right shop name ("_PurchaseSource_“) will arise in this shopping list. When I want to buy a new wine in that shop, I already set up the tasting note. The _label_ tag is still empty, so this is my filter in the shopping list to distinguish between "Rebuy“ and "New wine“.

Here is my code for "Shopping List ShopA“ (replace "ShopA“ with the right shop name):

````
### Rebuy
```dataview
table Label, Winemaker, Variety, Vintage, Country-Region, Price, Buy 
from "1_Wines"
where PurchaseSource = "ShopA" and Buy > 0 and Label
sort Country-Region asc, ValueForMoney desc
```

### New wine
```dataview
table Label, Winemaker, Variety, Vintage, Country-Region, Price, Buy 
from "1_Wines"
where PurchaseSource = "ShopA" and Buy > 0 and !Label
sort Country-Region asc, ValueForMoney desc
```
````

## Final remarks
If you want interactive tables click on the wine glass symbol next to the Wine fileClass and on "Table View“ in the heading of the fileClass note. Here you can set up different filters, arrange the order of your fields in the table and save it as a view. I don’t like how the tables look like so I use my own notes with predefined settings.

**Now you are ready to go and adapt and fill your "Wine Cellar" vault. Have fun!**






