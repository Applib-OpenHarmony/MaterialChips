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
  @State Delete: number= 0
  @State InputTextScale: number= 1
  @State TickSize: number= 0
  @State Radius: number= 0
  @State text: string = ''
  @State checked: boolean = false
  @State private model: EditChip.Model = undefined
  private onClick() {
    animateTo({
      duration: 100,
      onFinish: () => {
        this.Radius = 0
      }
    }, () => {
      this.Radius = 200
      this.Delete = 0
      this.InputTextScale = 1
    })
  }

  private Destroy() {
    animateTo({ duration: 100 }, () => {
      this.Delete = 0
    })
  }

  build() {
    Column() {
      Stack({ alignContent: Alignment.Start }) {
        TextInput({ placeholder: 'Text' })
          .type(InputType.Normal)
          .placeholderColor(Color.Blue)
          .placeholderFont({ size: 40, weight: FontWeight.Normal, style: FontStyle.Normal })
          .enterKeyType(EnterKeyType.Next)
          .height(40 * this.InputTextScale)
          .fontSize(30 * this.InputTextScale)
          .fontWeight(FontWeight.Bold)
          .fontFamily("cursive")
          .fontStyle(FontStyle.Italic)
          .fontColor(Color.Red)
          .onChange((value: string) => {
            this.text = value
          })
          .onSubmit((enterKey) => {
            this.Delete = 1
            this.InputTextScale = 0
          })
          .onEditChanged((isEditing) => {
          })
        Row() {
          Stack() {
            Circle({ width: '1vp', height: '1vp' })
              .fill(this.model.getChipColor())
              .borderRadius('8vp')
              .scale({ x: this.Radius, y: this.Radius })
              .clip(true)
            Text(this.text)
              .fontSize(this.Delete * 20)
              .fontColor(this.model.getTextColor())
              .margin({ left: this.Delete * 12, right: this.Delete * 12, top: this.Delete * 7, bottom: this.Delete * 7 })
          }

          Image($r("app.media.cross"))
            .width(this.Delete * 16)
            .height(this.Delete * 16)
            .margin({ right: this.Delete * 16 })
            .onClick(() => this.Destroy())
        }
        .borderRadius('8vp')
        .backgroundColor(this.model.getChipColor())
        .onClick(() => this.onClick())
        .margin(this.Delete * 8)
        .clip(true)
      }
    }
  }
}
export namespace EditChip {

  class Properties {
    private textsize: number= 20
    private textcolor: ResourceColor | string = '#000000'
    private chipcolor: ResourceColor | string = '#DCDCDC'
    private color: ResourceColor | string = this.chipcolor
    private borderradius: number = 8


    getTextSize(): number {
      return this.textsize
    }

    setTextSize(textsize: number): Properties {
      if (textsize != null && textsize != undefined) {
        this.textsize = textsize;
      } else {
        this.textsize = 20;
      }
      return this
    }
    getBorderRadius(): number {
      return this.borderradius
    }

    setBorderRadius(borderradius: number): Properties {
      if (borderradius != null && borderradius != undefined) {
        this.borderradius = borderradius;
      } else {
        this.borderradius = 8;
      }
      return this
    }

    getTextColor(): ResourceColor | string {
      return this.textcolor
    }

    setTextColor(textcolor: ResourceColor | string): Properties {
      this.textcolor = (textcolor != null && textcolor != undefined) ? textcolor : '#000000';
      return this
    }

    getColor(): ResourceColor | string {
      return this.color
    }
    setColor(color: ResourceColor | string): Properties {
      this.color = (color != null && color != undefined) ? color : this.chipcolor;
      return this
    }
    getChipColor(): ResourceColor | string {
      return this.chipcolor
    }

    setChipColor(chipcolor: ResourceColor | string): Properties {
      this.chipcolor = (chipcolor != null && chipcolor != undefined) ? chipcolor : '#000000';
      return this
    }

    reset() {
      this.textsize = 20

      this.borderradius = 8
      this.textcolor = '#000000'
      this.chipcolor = '#DCDCDC'

    }
  }

  export class Model extends Properties {
    constructor() {
      super()
    }
  }
}