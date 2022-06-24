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
export struct ActionChip {
  @State Radius: number= 0
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
    }
    else {
      this.color = this.chipcolor
      this.checked = false
    }
  }

  build() {
    Column() {
      Row() {
        Image(this.img)
          .width(this.img == "" || this.img == undefined ? 0 : this.imagesize)
          .height(this.img == null || this.img == undefined ? 0 : this.imagesize)
          .margin(this.img == "" || this.img == undefined ? 0 : 4)
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.activatecolor)
            .borderRadius('8vp')
            .scale({ x: this.Radius, y: this.Radius })
            .clip(true)
          Text(this.text)
            .fontSize(this.textsize)
            .fontColor(this.checked ? this.activetextcolor : this.textcolor)
            .margin({ left: 12, right: 12, top: 7, bottom: 7 })
        }
      }
      .borderRadius(this.borderradius)
      .backgroundColor(this.chipcolor)
      .backgroundColor(this.checked ? this.color : this.chipcolor)
      .onClick(() => this.onClick())
      .margin(8)
      .clip(true)
    }
  }
}