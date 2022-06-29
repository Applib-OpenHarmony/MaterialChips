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
export struct EditChip {
  @State radius: number = 0
  @State text: string = ''
  @State checked: boolean = false
  @State private model: EditChip.Model = undefined

  aboutToAppear() {
    if (this.model == null || this.model == undefined) return
  }

  private onClick() {
    animateTo({
      duration: 100,
      onFinish: () => {
        this.radius = 0
      }
    }, () => {
      this.radius = 200
      this.model.setTextSize('0fp')
      this.model.setTextMarginLeft('0vp')
      this.model.setTextMarginTop('0vp')
      this.model.setTextMarginBottom('0vp')
      this.model.setTextMarginRight('0vp')
      this.model.setMargin('0vp')
      this.model.setHeightTextScale('40vp')
      this.model.setFontTextScale('30fp')
      this.model.setCancelChip('0vp')
    })
  }

  private destroy() {
    animateTo({ duration: 100 }, () => {
      this.model.setTextSize('0vp')
      this.model.setTextMarginLeft('0vp')
      this.model.setTextMarginTop('0vp')
      this.model.setTextMarginBottom('0vp')
      this.model.setTextMarginRight('0vp')
      this.model.setMargin('0vp')
      this.model.setCancelChip('0vp')
    })
  }

  build() {
    if (this.model != null && this.model != undefined) {
      Column() {
        Stack({ alignContent: Alignment.Start }) {
          TextInput({ placeholder: 'Text' })
            .type(InputType.Normal)
            .placeholderColor(Color.Blue)
            .placeholderFont({ size: '40vp', weight: FontWeight.Normal, style: FontStyle.Normal })
            .enterKeyType(EnterKeyType.Next)
            .height(this.model.getHeightTextScale())
            .fontSize(this.model.getFontTextScale())
            .fontWeight(FontWeight.Bold)
            .fontFamily("cursive")
            .fontStyle(FontStyle.Italic)
            .fontColor(Color.Red)
            .onChange((value: string) => {
              this.text = value
            })
            .onSubmit((enterKey) => {
              this.model.setTextSize('20fp')
              this.model.setTextMarginLeft('12vp')
              this.model.setTextMarginTop('7vp')
              this.model.setTextMarginBottom('7vp')
              this.model.setTextMarginRight('12vp')
              this.model.setMargin('8vp')
              this.model.setCancelChip('16vp')
              this.model.setHeightTextScale('0vp')
              this.model.setFontTextScale('0fp')
            })
            .onEditChanged((isEditing) => {
            })
          Row() {
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

            Image($r("app.media.cross"))
              .width(this.model.getCancelChip())
              .height(this.model.getCancelChip())
              .margin({ right: this.model.getCancelChip() })
              .onClick(() => this.destroy())
          }
          .borderRadius(this.model.getBorderRadius())
          .backgroundColor(this.model.getChipColor())
          .onClick(() => this.onClick())
          .margin(this.model.getMargin())
          .clip(true)
        }
      }
    }
  }
}

export namespace EditChip {

  export class Model {
    private heightTextScale: string = '40vp'
    private text: string | Resource = ""
    private fontTextScale: string = '30fp'
    private textSize: string = '20fp'
    private textMarginLeft: string = '0vp'
    private textMarginRight: string = '0vp'
    private textMarginTop: string = '0vp'
    private textMarginBottom: string = '0vp'
    private textColor: ResourceColor | string = '#000000'
    private chipColor: ResourceColor | string = '#DCDCDC'
    private cancelChip: string = '0vp'
    private margin: string = '0vp'
    private borderRadius: string = '8vp'

    getMargin(): string {
      return this.margin
    }

    setMargin(margin: string): Model {
      if (margin != null && margin != undefined) {
        this.margin = margin;
      } else {
        this.margin = '0vp';
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

    getTextSize(): string {
      return this.textSize
    }

    getCancelChip(): string {
      return this.cancelChip
    }

    setCancelChip(cancelChip: string): Model {
      if (cancelChip != null && cancelChip != undefined) {
        this.cancelChip = cancelChip;
      } else {
        this.cancelChip = '0vp';
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

    setTextSize(textSize: string): Model {
      if (textSize != null && textSize != undefined) {
        this.textSize = textSize;
      } else {
        this.textSize = '20fp';
      }
      return this
    }

    getHeightTextScale(): string {
      return this.heightTextScale
    }

    setHeightTextScale(heightTextScale: string): Model {
      if (heightTextScale != null && heightTextScale != undefined) {
        this.heightTextScale = heightTextScale;
      } else {
        this.heightTextScale = '40vp';
      }
      return this
    }

    getFontTextScale(): string {
      return this.fontTextScale
    }

    setFontTextScale(fontTextScale: string): Model {
      if (fontTextScale != null && fontTextScale != undefined) {
        this.fontTextScale = fontTextScale;
      } else {
        this.fontTextScale = '20fp';
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
        this.borderRadius = '8fp';
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

      this.borderRadius = '8vp'
      this.textColor = '#000000'
      this.chipColor = '#DCDCDC'

    }
  }
}