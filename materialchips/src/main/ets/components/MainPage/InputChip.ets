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
  @State radius: number = 0
  @State checked: boolean = false
  @State private model: InputChip.Model = undefined

  aboutToAppear() {
    if (this.model == null || this.model == undefined) return
  }

  build() {
    if (this.model != null && this.model != undefined) {
      Column() {
        Row() {
          Image(this.model.getImage())
            .width(this.model.getImage() == "" || this.model.getImage() == undefined ? '0vp' : this.model.getImageSize())
            .height(this.model.getImage() == "" || this.model.getImage() == undefined ? '0vp' : this.model.getImageSize())
            .margin(this.model.getImage() == "" || this.model.getImage() == undefined ? '0vp' : this.model.getMarginImage())
          Stack() {
            Circle({ width: '1vp', height: '1vp' })
              .fill(this.model.getChipColor())
              .borderRadius('8vp')
              .scale({ x: this.radius, y: this.radius })
              .clip(true)
            Text(this.model.getText())
              .fontSize(this.model.getTextSize())
              .fontColor(this.model.getTextColor())
              .margin({
                left: this.model.getTextMarginLeft(),
                right: this.model.getTextMarginRight(),
                top: this.model.getTextMarginTop(),
                bottom: this.model.getTextMarginBottom()
              })
          }
        }
        .borderRadius(this.model.getBorderRadius())
        .backgroundColor(this.model.getChipColor())
        .margin(this.model.getMargin())
        .clip(true)
      }
    }
  }
}

export namespace InputChip {

  export class Model {
    private text: string | Resource = ""
    private img: string | Resource = ""
    private textSize: string = '20fp'
    private imgSize: string = '16vp'
    private textColor: ResourceColor | string = '#000000'
    private chipColor: ResourceColor | string = '#DCDCDC'
    private borderRadius: string = '8vp'
    private textMarginLeft: string = '12vp'
    private textMarginRight: string = '12vp'
    private textMarginTop: string = '7vp'
    private textMarginBottom: string = '7vp'
    private margin: string = '8vp'
    private marginImage: string = '4vp'

    getMarginImage(): string {
      return this.marginImage
    }

    setMarginImage(marginImage: string): Model {
      if (marginImage != null && marginImage != undefined) {
        this.marginImage = marginImage;
      } else {
        this.marginImage = '4vp';
      }
      return this
    }

    getMargin(): string {
      return this.margin
    }

    setMargin(margin: string): Model {
      if (margin != null && margin != undefined) {
        this.margin = margin;
      } else {
        this.margin = '8vp';
      }
      return this
    }

    getTextMarginLeft(): string {
      return this.textMarginLeft
    }

    setTextMarginLeft(textMarginLeft: string): Model {
      if (textMarginLeft != null && textMarginLeft != undefined) {
        this.textMarginLeft = textMarginLeft;
      } else {
        this.textMarginLeft = '0vp';
      }
      return this
    }

    getTextMarginRight(): string {
      return this.textMarginRight
    }

    setTextMarginRight(textMarginRight: string): Model {
      if (textMarginRight != null && textMarginRight != undefined) {
        this.textMarginRight = textMarginRight;
      } else {
        this.textMarginRight = '0vp';
      }
      return this
    }

    getTextMarginBottom(): string {
      return this.textMarginBottom
    }

    setTextMarginBottom(textMarginBottom: string): Model {
      if (textMarginBottom != null && textMarginBottom != undefined) {
        this.textMarginBottom = textMarginBottom;
      } else {
        this.textMarginBottom = '0vp';
      }
      return this
    }

    getTextMarginTop(): string {
      return this.textMarginTop
    }

    setTextMarginTop(textMarginTop: string): Model {
      if (textMarginTop != null && textMarginTop != undefined) {
        this.textMarginTop = textMarginTop;
      } else {
        this.textMarginTop = '0vp';
      }
      return this
    }

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

    getImageSize(): string {
      return this.imgSize
    }

    setImageSize(imgSize: string): Model {
      if (imgSize != null && imgSize != undefined) {
        this.imgSize = imgSize;
      } else {
        this.imgSize = '16vp';
      }
      return this
    }

    getTextSize(): string {
      return this.textSize
    }

    setTextSize(textSize: string): Model {
      if (textSize != null && textSize != undefined) {
        this.textSize = textSize;
      } else {
        this.textSize = '20fp';
      }
      return this
    }

    getBorderRadius(): string {
      return this.borderRadius
    }

    setBorderRadius(borderRadius: string): Model {
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

    setTextColor(textColor: ResourceColor | string): Model {
      this.textColor = (textColor != null && textColor != undefined) ? textColor : '#000000';
      return this
    }

    getChipColor(): ResourceColor | string {
      return this.chipColor
    }

    setChipColor(chipColor: ResourceColor | string): Model {
      this.chipColor = (chipColor != null && chipColor != undefined) ? chipColor : '#000000';
      return this
    }

    reset() {
      this.textSize = '20fp'
      this.textMarginTop = '7vp'
      this.textMarginBottom = '7vp'
      this.textMarginRight = '12vp'
      this.textMarginLeft = '12vp'
      this.margin = '8vp'
      this.imgSize = '16vp'
      this.marginImage = '4vp'
      this.borderRadius = '8vp'
      this.textColor = '#000000'
      this.chipColor = '#DCDCDC'
    }
  }
}