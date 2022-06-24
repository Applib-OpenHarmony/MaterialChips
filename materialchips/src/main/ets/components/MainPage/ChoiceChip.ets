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
export class ChooseChip {
  id: number
  text: string
  constructor(id: number, text: string) {
    this.id = id
    this.text = text
  }
}

@Component
export struct ChipSet {
  @State choice: ChooseChip [] = []
  @Link ChosenChipId: number

  build() {
    Row() {
      ForEach(
        this.choice,
        (item) => {
          ChoiceChip({
            ChipId: item.id,
            text: item.text,
            ChosenChip: $ChosenChipId,
            checked: this.ChosenChipId == item.id,
            color: this.ChosenChipId == item.id ? '#DCDCDC' : '#800080'
          })
        },
        item => item.id
      )
    }
  }
}

@Component
export struct ChoiceChip {
  @State Delete: number= 1
  @State Radius: number= 0
  @State ChipId: number= -1
  private text: string | Resource = ""
  private img: string | Resource = ""
  @Link ChosenChip: number
  @State checked: boolean = false
  @State private col: string = '#800080'
  @State color: string = '#DCDCDC'

  private onClick() {
    if (!this.checked) {
      this.checked = true
      animateTo({
        duration: 200,
        onFinish: () => {
          this.Radius = 0
          this.color = this.col
        }
      }, () => {
        this.Radius = 200
      })
      this.ChosenChip = this.ChipId
    }
  }

  private Destroy() {
    animateTo({ duration: 100 }, () => {
      this.Delete = 0
    })
  }

  build() {
    Column() {
      Row() {
        Image(this.img)
          .width(this.img == "" || this.img == undefined ? 0 : this.Delete * 16)
          .height(this.img == null || this.img == undefined ? 0 : this.Delete * 16)
          .margin(this.img == "" || this.img == undefined ? 0 : this.Delete * 4)
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.col)
            .borderRadius('8vp')
            .scale({ x: this.Radius, y: this.Radius })
            .clip(true)
          Text(this.text)
            .fontSize(this.Delete * 20)
            .margin({ left: this.Delete * 12, right: this.Delete * 12, top: this.Delete * 7, bottom: this.Delete * 7 })
        }

        Image($r("app.media.cross"))
          .width(this.Delete * 16)
          .height(this.Delete * 16)
          .margin({ right: this.Delete * 16 })
          .onClick(() => this.Destroy())
      }
      .borderRadius('8vp')
      .backgroundColor(this.checked ? this.color : '#DCDCDC')
      .onClick(() => this.onClick())
      .margin(this.Delete * 8)
      .clip(true)
    }
  }
}