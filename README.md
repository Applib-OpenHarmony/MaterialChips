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

Input chips represent information used in fields, such as an entity or different attributes.

![inputchip.png](Images/inputchip.png)
```
Import:

import { InputChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  private inputchip1: InputChip.Model = new InputChip.Model()
  aboutToAppear() {
    this.inputchip1.setText("New Jeresy").setTextSize(24).setImage($r('app.media.Location')).setImageSize(26).setChipColor('#D3D3D3').setBorderRadius(10)
  }
  build() {
    Column() {
      Text("Input Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        InputChip({
          model: this.inputchip1
        })
      }
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}
```
### -Choice Chip
In sets that contain at least two options, choice chips represent a single selection.

![choicechip.png](Images/ChoiceChip.png)
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
Filter chips represent filters for a collection.

![filterechip.png](Images/FilterChip.png)
```
Import:

import { FilterChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  private filterchip1: FilterChip.Model = new FilterChip.Model()
  private filterchip2: FilterChip.Model = new FilterChip.Model()
  private filterchip3: FilterChip.Model = new FilterChip.Model()
  aboutToAppear() {
    this.filterchip1.setText("Op1").setTextSize(20)
    this.filterchip2.setText("Op2").setTextSize(20)
    this.filterchip3.setText("Op3").setTextSize(20)
  }
  build() {
    Column() {
      Text("Filter Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        FilterChip({
          model: this.filterchip1
        })
        FilterChip({
          model: this.filterchip2
        })
        FilterChip({
          model: this.filterchip3
        })
      }
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}
```
### -Action Chip
Action chips trigger actions related to primary content.

![actionchip.png](Images/ActionChip.png)
```
Import:

import { ActionChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  private actionchip: ActionChip.Model = new ActionChip.Model()
  aboutToAppear() {
    this.actionchip.setText("Racing").setTextSize(24).setImage($r('app.media.Bike')).setImageSize(26).setBorderRadius(10)
  }
  build() {
    Column() {
      Text("Action Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        ActionChip({
          model: this.actionchip
        })
      }
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}
```
### -Edit Chip
The content of these chips can be edited.

![editchip.png](Images/EditChip.png)
```
Import:

import { EditChip } from '@ohos/materialchips'

Usage:

@Entry
@Component
struct Index {
  private editchip: EditChip.Model = new EditChip.Model()
  aboutToAppear() {
    this.editchip.setTextSize(24).setTextColor(Color.Blue)
  }
  build() {
    Column() {
      Text("Edit Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        EditChip({
          model: this.editchip
        })
      }
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}
```
## Demo
![Animation.png](Images/Animation.gif)
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
If you find any problems during usage, you can submit an [Issue](https://github.com/Applib-OpenHarmony/Material_UI_Chips/issues) to us. Of course, we also welcome you to send us [PR](https://github.com/Applib-OpenHarmony/Material_UI_Chips/pulls).

## Open source License
This project is based on [Apache License 2.0](https://github.com/applibgroup/applibgroup/blob/main/LICENSE), please enjoy and participate in open source freely.
