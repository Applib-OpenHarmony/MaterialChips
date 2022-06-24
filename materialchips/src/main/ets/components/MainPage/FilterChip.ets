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
  @State ChipId: number= -1
  private textsize: number= 20
  private imagesize: number= 16
  @State private textcolor: string = '#000000'
  @State private activetextcolor: string = '#000000'
  @State private chipcolor: string = '#DCDCDC'
  private text: string | Resource = ""
  private img: string | Resource = ""
  @State checked: boolean = false
  @State private activatecolor: string = '#800080'
  @State color: string = this.chipcolor
  @State borderradius: number = 8

  private onClick() {
    if (!this.checked) {
      this.checked = true
      animateTo({
        duration: 100,
        onFinish: () => {
          this.Radius = 0
          this.color = this.activatecolor
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
      this.color = this.chipcolor
      this.checked = false
    }
  }

  private Destroy() {
    this.color = this.chipcolor
    animateTo({ duration: 100 }, () => {
      this.Delete = 0
    })
  }

  build() {
    Column() {
      Row() {
        Image(this.img)
          .width(this.img == "" || this.img == undefined ? 0 : this.Delete * this.imagesize)
          .height(this.img == null || this.img == undefined ? 0 : this.Delete * this.imagesize)
          .margin(this.img == "" || this.img == undefined ? 0 : this.Delete * 4)
        Image($r("app.media.Tick"))
          .width(this.TickSize * 18 * this.Delete)
          .height(this.TickSize * this.Delete * 18)
          .scale({ x: this.TickSize, y: this.TickSize })
          .margin({ left: this.TickSize * this.Delete * 8, top: this.TickSize * this.Delete * 7, bottom: this.TickSize * this.Delete * 7 })
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.activatecolor)
            .borderRadius('8vp')
            .scale({ x: this.Radius, y: this.Radius })
            .clip(true)
          Text(this.text)
            .fontSize(this.Delete * this.textsize)
            .fontColor(this.checked ? this.activetextcolor : this.textcolor)
            .margin({ left: this.Delete * 12, right: this.Delete * 12, top: this.Delete * 7, bottom: this.Delete * 7 })
        }

        Image($r("app.media.cross"))
          .width(this.Delete * 16)
          .height(this.Delete * 16)
          .margin({ right: this.Delete * 16 })
          .onClick(() => this.Destroy())
      }
      .borderRadius(this.borderradius)
      .backgroundColor(this.chipcolor)
      .backgroundColor(this.checked ? this.color : this.chipcolor)
      .onClick(() => this.onClick())
      .margin(this.Delete * 8)
      .clip(true)
    }
  }
}