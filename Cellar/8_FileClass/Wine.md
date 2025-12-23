---
fields:
  - name: Winemaker
    type: Input
    options: {}
    path: ""
    id: PqN89j
  - name: WineName
    type: Input
    options: {}
    path: ""
    id: fHnIQy
  - name: Vintage
    type: Input
    options: {}
    path: ""
    id: 5moUof
  - name: Variety
    type: Input
    options: {}
    path: ""
    id: kbu8fg
  - name: Vineyard
    type: Input
    options: {}
    path: ""
    id: 7n4YyY
  - name: ABV
    type: Input
    options: {}
    path: ""
    id: ABV001
  - name: Style
    type: Input
    options: {}
    path: ""
    id: GDdFGl
  - name: PurchaseSource
    type: Input
    options: {}
    path: ""
    id: 45xq1T
  - name: PurchaseLink
    type: Input
    options: {}
    path: ""
    id: jMLIqj
  - name: Type
    type: Select
    options:
      sourceType: ValuesList
      valuesList:
        "1": Red wine
        "2": White wine
        "3": Rose wine
        "4": Champagne
    path: ""
    id: yi4Ej9
  - name: Country-Region
    type: Input
    options:
      template: "{{Country}} - {{Region}}"
    path: ""
    id: 9yrAMy
  - name: Buy
    type: Number
    options:
      step: 1
      min: 0
    path: ""
    id: CnQron
  - name: Inventory
    type: Number
    options:
      step: 1
      min: 0
    path: ""
    id: EKHZxd
  - name: ValueForMoney
    type: Number
    options:
      min: 0
      max: 5
    path: ""
    id: xrSEif
  - name: Points
    type: Input
    options: {}
    path: ""
    id: T0TAd0
  - name: Stars
    type: Select
    options:
      sourceType: ValuesList
      valuesList:
        "1": --
        "2": ⭐️
        "3": ⭐️⭐️
        "4": ⭐️⭐️⭐️
        "5": ⭐️⭐️⭐️⭐️
        "6": ⭐️⭐️⭐️⭐️⭐️
    path: ""
    id: DZ1o6Z
  - name: Price
    type: Input
    options: {}
    path: ""
    id: Lgeucy
  - name: Label
    type: Media
    options:
      embed: false
      folders: []
      display: card
      thumbnailSize: "100"
    path: ""
    id: pvZCsM
version: "2.37"
limit: 20
mapWithTag: false
icon: wine
tagNames:
filesPaths:
bookmarksGroups:
excludes:
extends:
savedViews: []
favoriteView:
fieldsOrder:
  - pvZCsM
  - Lgeucy
  - DZ1o6Z
  - T0TAd0
  - xrSEif
  - EKHZxd
  - CnQron
  - 9yrAMy
  - yi4Ej9
  - jMLIqj
  - 45xq1T
  - GDdFGl
  - 7n4YyY
  - ABV001
  - kbu8fg
  - 5moUof
  - fHnIQy
  - PqN89j
---

%% #CLAUDE_REQ: When adding/modifying fields here, verify coherence with: %%
%% #CLAUDE_REQ: - BottleMetadata model (automation/core/models.py) %%
%% #CLAUDE_REQ: - Templates (automation/templates/wine.md.j2 and 9_Templates/Tasting Note.md) %%
%% #CLAUDE_REQ: - Generator context (automation/generators/obsidian.py _prepare_context) %%
%% #CLAUDE_REQ: - Vault reader (automation/utils/vault_reader.py) %%
%% #CLAUDE_REQ: - Field name mapping (automation/web/routes/management.py field_name_map) %%
