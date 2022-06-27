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
  @State Delete: number= 1
  @State TickSize: number= 0
  @State Radius: number= 0
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
            .scale({ x: this.Radius, y: this.Radius })
            .clip(true)
          Text(this.model.getText())
            .fontSize(this.Delete * this.model.getTextSize())
            .fontColor(this.checked ? this.model.getActiveTextColor() : this.model.getTextColor())
            .margin({ left: this.Delete * 12, right: this.Delete * 12, top: this.Delete * 7, bottom: this.Delete * 7 })
        }
      }
      .borderRadius(this.model.getBorderRadius())
      .backgroundColor(this.checked ? this.model.getColor() : this.model.getChipColor())
      .margin(this.Delete * 8)
      .clip(true)
    }
  }
}
export namespace InputChip {

  class Properties {
    private img: string | Resource = ""
    private imgsize: number= 16
    private textsize: number= 20
    private textcolor: ResourceColor | string = '#000000'
    private activetextcolor: ResourceColor | string = '#000000'
    private chipcolor: ResourceColor | string = '#DCDCDC'
    private activechipcolor: ResourceColor | string = '#800080'
    private color: ResourceColor | string = this.chipcolor
    private borderradius: number = 8

    getImage(): string | Resource {
      return this.img
    }
    setImage(img: string | Resource): Properties {
      if (img != null && img != undefined) {
        this.img = img;
      } else {
        this.img = "";
      }
      return this
    }
    getImageSize(): number {
      return this.imgsize
    }

    setImageSize(imgsize: number): Properties {
      if (imgsize != null && imgsize != undefined) {
        this.imgsize = imgsize;
      } else {
        this.imgsize = 16;
      }
      return this
    }
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