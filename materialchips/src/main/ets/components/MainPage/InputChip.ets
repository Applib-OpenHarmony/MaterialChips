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
@Component
export struct InputChip {
  @State delete: number= 1
  @State tickSize: number= 0
  @State radius: number= 0
  @State checked: boolean = false
  @State private model: InputChip.Model = undefined
  build() {
    Column() {
      Row() {
        Image(this.model.getImage())
          .width(this.model.getImage() == "" || this.model.getImage() == undefined ? '0vp' : this.model.getImageSize())
          .height(this.model.getImage() == null || this.model.getImage() == undefined ? '0vp' : this.model.getImageSize())
          .margin(this.model.getImage() == "" || this.model.getImage() == undefined ? '0vp' : '4vp')
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.model.getActiveChipColor())
            .borderRadius('8vp')
            .scale({ x: this.radius, y: this.radius })
            .clip(true)
          Text(this.model.getText())
            .fontSize(this.delete * this.model.getTextSize())
            .fontColor(this.checked ? this.model.getActiveTextColor() : this.model.getTextColor())
            .margin({ left: this.delete * 12, right: this.delete * 12, top: this.delete * 7, bottom: this.delete * 7 })
        }
      }
      .borderRadius(this.model.getBorderRadius())
      .backgroundColor(this.checked ? this.model.getColor() : this.model.getChipColor())
      .margin(this.delete * 8)
      .clip(true)
    }
  }
}
export namespace InputChip {

  export class Model {
    private text: string | Resource = ""
    private img: string | Resource = ""
    private textSize: number= 20
    private imgSize: number= 16
    private textColor: ResourceColor | string = '#000000'
    private activeTextColor: ResourceColor | string = '#000000'
    private chipColor: ResourceColor | string = '#DCDCDC'
    private activeChipColor: ResourceColor | string = '#800080'
    private color: ResourceColor | string = this.chipColor
    private borderRadius: number = 8

    getText(): string | Resource {
      return this.text
    }
    setText(text: string | Resource): Model {
      if (text != null && text != undefined) {
        this.text = text;
      } else {
        this.text = "";
      }
      return this
    }
    getImage(): string | Resource {
      return this.img
    }
    setImage(img: string | Resource): Model {
      if (img != null && img != undefined) {
        this.img = img;
      } else {
        this.img = "";
      }
      return this
    }
    getImageSize(): number {
      return this.imgSize
    }

    setImageSize(imgSize: number): Model {
      if (imgSize != null && imgSize != undefined) {
        this.imgSize = imgSize;
      } else {
        this.imgSize = 16;
      }
      return this
    }
    getTextSize(): number {
      return this.textSize
    }

    setTextSize(textSize: number): Model {
      if (textSize != null && textSize != undefined) {
        this.textSize = textSize;
      } else {
        this.textSize = 20;
      }
      return this
    }
    getBorderRadius(): number {
      return this.borderRadius
    }

    setBorderRadius(borderRadius: number): Model {
      if (borderRadius != null && borderRadius != undefined) {
        this.borderRadius = borderRadius;
      } else {
        this.borderRadius = 8;
      }
      return this
    }

    getTextColor(): ResourceColor | string {
      return this.textColor
    }

    setTextColor(textColor: ResourceColor | string): Model {
      this.textColor = (textColor != null && textColor != undefined) ? textColor : '#000000';
      return this
    }

    getActiveTextColor(): ResourceColor | string {
      return this.activeTextColor
    }

    setActiveTextColor(activeTextColor: ResourceColor | string): Model {
      this.activeTextColor = (activeTextColor != null && activeTextColor != undefined) ? activeTextColor : '#000000';
      return this
    }
    getColor(): ResourceColor | string {
      return this.color
    }
    setColor(color: ResourceColor | string): Model {
      this.color = (color != null && color != undefined) ? color : this.chipColor;
      return this
    }
    getChipColor(): ResourceColor | string {
      return this.chipColor
    }

    setChipColor(chipColor: ResourceColor | string): Model {
      this.chipColor = (chipColor != null && chipColor != undefined) ? chipColor : '#000000';
      return this
    }

    getActiveChipColor(): ResourceColor | string {
      return this.activeChipColor
    }

    setActiveChipColor(activeChipColor: ResourceColor | string): Model {
      this.activeChipColor = (activeChipColor != null && activeChipColor != undefined) ? activeChipColor : '#000000';
      return this
    }

    reset() {
      this.textSize = 20

      this.borderRadius = 8
      this.textColor = '#000000'

      this.activeTextColor = '#000000'
      this.chipColor = '#DCDCDC'

      this.activeChipColor = '#800080'
    }
  }
}