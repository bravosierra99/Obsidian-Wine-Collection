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
