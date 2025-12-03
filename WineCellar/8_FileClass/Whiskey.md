---
fields:
  - name: Distiller
    type: Input
    options: {}
    path: ""
    id: WhDist
  - name: WhiskeyName
    type: Input
    options: {}
    path: ""
    id: WhName
  - name: AgeStatement
    type: Input
    options: {}
    path: ""
    id: WhAge0
  - name: Year
    type: Input
    options: {}
    path: ""
    id: WhYear
  - name: Type
    type: Select
    options:
      values:
        - Bourbon
        - Rye Whiskey
        - Tennessee Whiskey
        - Single Malt
        - Blended Whiskey
        - Wheat Whiskey
        - Canadian Whisky
        - Wheated Bourbon
    path: ""
    id: WhType
  - name: MashBill
    type: Input
    options: {}
    path: ""
    id: WhMash
  - name: BarrelType
    type: Input
    options: {}
    path: ""
    id: WhBarr
  - name: Proof
    type: Number
    options:
      min: 0
      max: 200
      step: 0.1
    path: ""
    id: WhProf
  - name: Region-State
    type: Input
    options:
      template: "{{Region}} - {{State}}"
    path: ""
    id: WhRegi
  - name: BatchNumber
    type: Input
    options: {}
    path: ""
    id: WhBatc
  - name: BottleNumber
    type: Input
    options: {}
    path: ""
    id: WhBott
  - name: Price
    type: Input
    options: {}
    path: ""
    id: WhPric
  - name: PurchaseSource
    type: Input
    options: {}
    path: ""
    id: WhPSou
  - name: PurchaseLink
    type: Input
    options: {}
    path: ""
    id: WhPLin
  - name: Inventory
    type: Number
    options:
      step: 1
      min: 0
    path: ""
    id: WhInve
  - name: Buy
    type: Number
    options:
      step: 1
      min: 0
    path: ""
    id: WhBuy0
  - name: Stars
    type: Select
    options:
      values:
        - --
        - ⭐️
        - ⭐️⭐️
        - ⭐️⭐️⭐️
        - ⭐️⭐️⭐️⭐️
        - ⭐️⭐️⭐️⭐️⭐️
    path: ""
    id: WhStar
  - name: ValueForMoney
    type: Number
    options:
      min: 0
      max: 5
    path: ""
    id: WhValu
  - name: BottleOpenedDate
    type: Date
    options:
      dateFormat: "YYYY-MM-DD"
    path: ""
    id: WhOpen
  - name: BottleImage
    type: Media
    options:
      embed: false
      folders: []
      display: card
      thumbnailSize: "100"
    path: ""
    id: WhBImg
version: "3.0"
limit: 20
mapWithTag: false
icon: coffee
tagNames:
filesPaths:
bookmarksGroups:
excludes:
extends:
savedViews: []
favoriteView:
fieldsOrder:
  - WhBImg
  - WhPric
  - WhStar
  - WhValu
  - WhInve
  - WhBuy0
  - WhOpen
  - WhRegi
  - WhType
  - WhPLin
  - WhPSou
  - WhBott
  - WhBatc
  - WhProf
  - WhBarr
  - WhMash
  - WhYear
  - WhAge0
  - WhName
  - WhDist
---
