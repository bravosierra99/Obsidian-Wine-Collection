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
	.filter(p => p.Type === "White wine" && p.Label)
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
	.filter(p => p.Type === "Red wine" && p.Label)
	.sort((a, b) => (b["ValueForMoney"] ?? 0) - (a["ValueForMoney"] ?? 0)); // Descending

dv.table(["Label","Wine"],
await Promise.all(pages.map(async p => [
	p.Label,
	p.file.link, 
	])
))
