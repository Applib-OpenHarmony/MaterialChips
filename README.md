# Material_Chip
一Chips library for OpenHarmony
## Adding Dependencies
Add the following dependency in entry/package.json

```
"dependencies": {
    "@ohos/materialchips": "file:./materialchips"
  }
```
## Usage Instructions

### -Input Chip
![inputchip.png](images/inputchip.png)
```
Import:

import { InputChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        InputChip({
          text: "New Jersey",
          textsize: 24,
          img: $r('app.media.Location'),
          imagesize: 26,
          chipcolor: '#D3D3D3',
          bradius: 10
        })
      }
    }
    .width('100%')
  }
}
```
### -Choice Chip
![choicechip.png](images/ChoiceChip.png)
```
Import:

import { ChipSet, ChooseChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  @State ChoseChip: number = -1
  private Set: ChooseChip [] = [
    new ChooseChip(1, "Op1"),
    new ChooseChip(2, "Op2"),
    new ChooseChip(3, "Op3")
  ]
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        ChipSet({
          choice: this.Set,
          ChosenChipId: $ChoseChip
        })
      }
    }
    .width('100%')
  }
}
```
### -Filter Chip
![filterechip.png](images/FilterChip.png)
```
Import:

import { FilterChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        FilterChip({
          text: "Op1",
          textsize: 20
        })
        
        FilterChip({
          text: "Op2",
          textsize: 20
        })
        
        FilterChip({
          text: "Op3",
          textsize: 20
        })
      }
    }
    .width('100%')
  }
}
```
### -Action Chip
![actionchip.png](images/ActionChip.png)
```
Import:

import { ActionChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.Start }) {
        ActionChip({
          text: "Racing",
          textsize: 24,
          img: $r('app.media.Bike'),
          imagesize: 26,
          bradius: 10
        })
      }
    }
    .width('100%')
  }
}
```
### -Edit Chip
![editchip.png](images/EditChip.png)
```
Import:

import { EditChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  build() {
    Column() {
      EditChip({})
    }
    .width('100%')
  }
}
```
## Compatibility
Supports OpenHarmony API version 8
## Directory
```
|---- MaterialChip
|     |---- entry  # sample app usage
|     |---- materialchips  # Chips library
|           |----src 
|             |----main 
|               |----ets
|                   |----components
|                       |----MainPage
|                           |---- ActionChip.ets  # Action Chip
|                           |---- ChoiceChip.ets  # Choice Chip
|                           |---- EditChip.ets  # Edit Chip
|                           |---- FilterChip.ets  # Filter Chip
|                           |---- InputChip.ets  # Input Chip
|     |---- README.MD  # installation and usage
```
## Code Contribution
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/Material_UI_Chips
/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/Material_UI_FAB/pulls).

## Open source License
This project is based on [Apache License 2.0](https://github.com/Applib-OpenHarmony/Material_UI_Chips
/blob/main/LICENSE), please enjoy and participate in open source freely.
