/*
 * Copyright (C) 2022 Application Library Engineering Group
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
export class ChipSet {
  private id: number
  private text: string
  constructor(id: number, text: string) {
    this.id = id
    this.text = text
  }

  private img: string | Resource = ""
  private textColor: ResourceColor | string = '#000000'
  private activeTextColor: ResourceColor | string = '#000000'
  private chipColor: ResourceColor | string = '#DCDCDC'
  private activeChipColor: ResourceColor | string = '#800080'
  private color: ResourceColor | string = this.chipColor
  private borderRadius: string = '8vp'

  getImage(): string | Resource {
    return this.img
  }

  setImage(img: string | Resource): ChipSet {
    if (img != null && img != undefined) {
      this.img = img;
    } else {
      this.img = "";
    }
    return this
  }

  getBorderRadius(): string {
    return this.borderRadius
  }

  setBorderRadius(borderRadius: string): ChipSet {
    if (borderRadius != null && borderRadius != undefined) {
      this.borderRadius = borderRadius;
    } else {
      this.borderRadius = '8vp';
    }
    return this
  }

  getTextColor(): ResourceColor | string {
    return this.textColor
  }

  setTextColor(textColor: ResourceColor | string): ChipSet {
    this.textColor = (textColor != null && textColor != undefined) ? textColor : '#000000';
    return this
  }

  getActiveTextColor(): ResourceColor | string {
    return this.activeTextColor
  }

  setActiveTextColor(activeTextColor: ResourceColor | string): ChipSet {
    this.activeTextColor = (activeTextColor != null && activeTextColor != undefined) ? activeTextColor : '#000000';
    return this
  }

  getColor(): ResourceColor | string {
    return this.color
  }

  setColor(color: ResourceColor | string): ChipSet {
    this.color = (color != null && color != undefined) ? color : this.chipColor;
    return this
  }

  getChipColor(): ResourceColor | string {
    return this.chipColor
  }

  setChipColor(chipColor: ResourceColor | string): ChipSet {
    this.chipColor = (chipColor != null && chipColor != undefined) ? chipColor : '#000000';
    return this
  }

  getActiveChipColor(): ResourceColor | string {
    return this.activeChipColor
  }

  setActiveChipColor(activeChipColor: ResourceColor | string): ChipSet {
    this.activeChipColor = (activeChipColor != null && activeChipColor != undefined) ? activeChipColor : '#000000';
    return this
  }

  reset() {
    this.borderRadius = '8vp'
    this.textColor = '#000000'
    this.activeTextColor = '#000000'
    this.chipColor = '#DCDCDC'
    this.activeChipColor = '#800080'
    this.color = this.chipColor
  }
}

export namespace ChipSet {

  export class Model {
    private items: ChipSet [] = []
    setItems(items: ChipSet []): Model {
      this.items = (items != null && items != undefined) ? items : []
      return this
    }
  }
}

@Component
export struct ChoiceChip {
  @State choice: ChipSet [] = []
  @Link chosenChipId: number
  @State private model: ChipSet.Model = undefined

  aboutToAppear() {
    if (this.model == null || this.model == undefined) return
  }

  build() {
    if (this.model != null && this.model != undefined) {
      Row() {
        ForEach(
          this.choice,
          (item) => {
            ChooseChip({
              chipId: item.id,
              text: item.text,
              chosenChip: $chosenChipId,
              checked: this.chosenChipId == item.id,
              col: item.getActiveChipColor(),
              color: this.chosenChipId == item.id ? item.getChipColor() : item.getActiveChipColor(),
              img: item.getImage(),
              textColor: item.getTextColor(),
              activeTextColor: item.getActiveTextColor(),
              borderRadius: item.getBorderRadius()
            })
          },
          item => item.id
        )
      }
    }
  }
}

@Component
export struct ChooseChip {
  @State radius: number = 0
  @State chipId: number = -1
  private text: string | Resource = ""
  private img: string | Resource = ""
  @Link chosenChip: number
  @State checked: boolean = false
  @State private col: string = '#800080'
  @State color: string = '#DCDCDC'
  private imgSize: string = '16vp'
  private marginLeft: string = '12vp'
  private marginRight: string = '12vp'
  private marginTop: string = '7vp'
  private marginBottom: string = '7vp'
  private textSize: string = '20fp'
  private cancelChip: string = '16vp'
  private margin: string = '8vp'
  private marginImage: string = '4vp'
  private textColor: string = '#000000'
  private activeTextColor: string = '#000000'
  private borderRadius: string = '8vp'

  private onClick() {
    if (!this.checked) {
      this.checked = true
      animateTo({
        duration: 200,
        onFinish: () => {
          this.radius = 0
          this.color = this.col
        }
      }, () => {
        this.radius = 200
      })
      this.chosenChip = this.chipId
    }
  }

  private destroy() {
    animateTo({
      duration: 100,
      onFinish: () => {
        this.radius = 0
      }
    }, () => {
      this.radius = 0.1
      this.textSize = '0fp'
      this.imgSize = '0vp'
      this.marginLeft = '0vp'
      this.marginRight = '0vp'
      this.marginTop = '0vp'
      this.marginBottom = '0vp'
      this.cancelChip = '0vp'
      this.margin = '0vp'
      this.marginImage = '0vp'
    })
  }

  build() {
    Column() {
      Row() {
        Image(this.img)
          .width(this.img == "" || this.img == undefined ? '0vp' : this.imgSize)
          .height(this.img == "" || this.img == undefined ? '0vp' : this.imgSize)
          .margin(this.img == "" || this.img == undefined ? '0vp' : this.marginImage)
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.col)
            .borderRadius('8vp')
            .scale({ x: this.radius, y: this.radius })
            .clip(true)
          Text(this.text)
            .fontSize(this.textSize)
            .fontColor(this.checked ? this.activeTextColor : this.textColor)
            .margin({
              left: this.marginLeft,
              right: this.marginRight,
              top: this.marginTop,
              bottom: this.marginBottom
            })
        }

        Image($r("app.media.cross"))
          .width(this.cancelChip)
          .height(this.cancelChip)
          .margin({ right: this.cancelChip })
          .onClick(() => this.destroy())
      }
      .borderRadius(this.borderRadius)
      .backgroundColor(this.checked ? this.color : '#DCDCDC')
      .onClick(() => this.onClick())
      .margin(this.margin)
      .clip(true)
    }
  }
}