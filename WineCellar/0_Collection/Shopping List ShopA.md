
### Rebuy
```dataview
table link(Label,"100") as Label, Winemaker, Variety, Vintage, Country-Region, Price, Buy 
from "1_Wines"
where PurchaseSource = "Wein Bauer" and Buy > 0 and Label
sort Country-Region asc, ValueForMoney desc
```

### New wine
```dataview
table link(Label,"100") as Label, Winemaker, Variety, Vintage, Country-Region, Price, Buy 
from "1_Wines"
where PurchaseSource = "Wein Bauer" and Buy > 0 and !Label
sort Country-Region asc, ValueForMoney desc
```