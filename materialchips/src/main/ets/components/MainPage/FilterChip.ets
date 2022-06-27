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
export struct FilterChip {
  @State Delete: number= 1
  @State TickSize: number= 0
  @State Radius: number= 0
  @State checked: boolean = false
  @State private model: FilterChip.Model = undefined
  private onClick() {
    if (!this.checked) {
      this.checked = true
      animateTo({
        duration: 100,
        onFinish: () => {
          this.Radius = 0
          this.model.setColor(this.model.getActiveChipColor())
        }
      }, () => {
        this.Radius = 200
      })
      animateTo({ duration: 100 }, () => {
        this.TickSize = 1
      })
    }
    else {
      animateTo({ duration: 100 }, () => {
        this.TickSize = 0
      })
      this.model.setColor(this.model.getChipColor())
      this.checked = false
    }
  }

  private Destroy() {
    this.model.setChipColor(this.model.getChipColor())
    animateTo({ duration: 100 }, () => {
      this.Delete = 0
    })
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.Tick"))
          .width(this.TickSize * 18 * this.Delete)
          .height(this.TickSize * this.Delete * 18)
          .scale({ x: this.TickSize, y: this.TickSize })
          .margin({ left: this.TickSize * this.Delete * 8, top: this.TickSize * this.Delete * 7, bottom: this.TickSize * this.Delete * 7 })
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.model.getActiveChipColor())
            .borderRadius('8vp')
            .scale({ x: this.Radius, y: this.Radius })
            .clip(true)
          Text(this.model.getText())
            .fontSize(this.Delete * this.model.getTextSize())
            .fontColor(this.checked ? this.model.getActiveTextColor() : this.model.getTextColor())
            .margin({ left: this.Delete * 12, right: this.Delete * 12, top: this.Delete * 7, bottom: this.Delete * 7 })
        }

        Image($r("app.media.cross"))
          .width(this.Delete * 16)
          .height(this.Delete * 16)
          .margin({ right: this.Delete * 16 })
          .onClick(() => this.Destroy())
      }
      .borderRadius(this.model.getBorderRadius())
      .backgroundColor(this.checked ? this.model.getColor() : this.model.getChipColor())
      .onClick(() => this.onClick())
      .margin(this.Delete * 8)
      .clip(true)
    }
  }
}
export namespace FilterChip {

  class Properties {
    private textsize: number= 20
    private textcolor: ResourceColor | string = '#000000'
    private activetextcolor: ResourceColor | string = '#000000'
    private chipcolor: ResourceColor | string = '#DCDCDC'
    private activechipcolor: ResourceColor | string = '#800080'
    private borderradius: number = 8
    private color: ResourceColor | string = this.chipcolor

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

    getActiveTextColor(): ResourceColor | string {
      return this.activetextcolor
    }

    setActiveTextColor(activetextcolor: ResourceColor | string): Properties {
      this.activetextcolor = (activetextcolor != null && activetextcolor != undefined) ? activetextcolor : '#000000';
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

    getActiveChipColor(): ResourceColor | string {
      return this.activechipcolor
    }

    setActiveChipColor(activechipcolor: ResourceColor | string): Properties {
      this.activechipcolor = (activechipcolor != null && activechipcolor != undefined) ? activechipcolor : '#000000';
      return this
    }

    reset() {
      this.textsize = 20

      this.borderradius = 8
      this.textcolor = '#000000'

      this.activetextcolor = '#000000'
      this.chipcolor = '#DCDCDC'

      this.activechipcolor = '#800080'
    }
  }

  export class Model extends Properties {
    private text: string | Resource = undefined
    constructor(text: string | Resource) {
      super()
      this.text = text
    }

    getText(): string | Resource {
      return this.text
    }
  }
}