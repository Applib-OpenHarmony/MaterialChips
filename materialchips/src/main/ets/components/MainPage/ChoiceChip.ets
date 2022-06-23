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
  @State Dest: number= 1
  @State Rad: number= 0
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
          this.Rad = 0
          this.color = this.col
        }
      }, () => {
        this.Rad = 200
      })
      this.ChosenChip = this.ChipId
    }
  }

  private Destroy() {
    animateTo({ duration: 100 }, () => {
      this.Dest = 0
    })
  }

  build() {
    Column() {
      Row() {
        Image(this.img)
          .width(this.img == "" || this.img == undefined ? 0 : this.Dest * 16)
          .height(this.img == null || this.img == undefined ? 0 : this.Dest * 16)
          .margin(this.img == "" || this.img == undefined ? 0 : this.Dest * 4)
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.col)
            .borderRadius('8vp')
            .scale({ x: this.Rad, y: this.Rad })
            .clip(true)
          Text(this.text)
            .fontSize(this.Dest * 20)
            .margin({ left: this.Dest * 12, right: this.Dest * 12, top: this.Dest * 7, bottom: this.Dest * 7 })
        }

        Image($r("app.media.cross"))
          .width(this.Dest * 16)
          .height(this.Dest * 16)
          .margin({ right: this.Dest * 16 })
          .onClick(() => this.Destroy())
      }
      .borderRadius('8vp')
      .backgroundColor(this.checked ? this.color : '#DCDCDC')
      .onClick(() => this.onClick())
      .margin(this.Dest * 8)
      .clip(true)
    }
  }
}