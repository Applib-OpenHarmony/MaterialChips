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
  @Link chosenChipId: number

  build() {
    Row() {
      ForEach(
        this.choice,
        (item) => {
          ChoiceChip({
            chipId: item.id,
            text: item.text,
            chosenChip: $chosenChipId,
            checked: this.chosenChipId == item.id,
            color: this.chosenChipId == item.id ? '#DCDCDC' : '#800080'
          })
        },
        item => item.id
      )
    }
  }
}

@Component
export struct ChoiceChip {
  @State radius: number = 0
  @State chipId: number = -1
  private text: string | Resource = ""
  @Link chosenChip: number
  @State checked: boolean = false
  @State private col: string = '#800080'
  @State color: string = '#DCDCDC'
  private textSize: string = '20fp'
  private marginLeft: string = '12vp'
  private marginRight: string = '12vp'
  private marginBottom: string = '7vp'
  private marginTop: string = '7vp'
  private cancelChip: string = '16vp'
  private margin: string = '8vp'

  private onClick() {
    if (!this.checked) {
      this.checked = true
      animateTo({
        duration: 200,
        onFinish: () => {
          this.radius = 0
          this.color = this.col
        }
      }, () => {
        this.radius = 200
      })
      this.chosenChip = this.chipId
    }
  }

  private destroy() {
    animateTo({ duration: 100 }, () => {
      this.textSize = '0fp'
      this.marginLeft = '0vp'
      this.marginRight = '0vp'
      this.marginBottom = '0vp'
      this.marginTop = '0vp'
      this.cancelChip = '0vp'
      this.margin = '0vp'
    })
  }

  build() {
    Column() {
      Row() {
        Stack() {
          Circle({ width: '1vp', height: '1vp' })
            .fill(this.col)
            .borderRadius('8vp')
            .scale({ x: this.radius, y: this.radius })
            .clip(true)
          Text(this.text)
            .fontSize(this.textSize)
            .margin({
              left: this.marginLeft,
              right: this.marginRight,
              top: this.marginTop,
              bottom: this.marginBottom
            })
        }

        Image($r("app.media.cross"))
          .width(this.cancelChip)
          .height(this.cancelChip)
          .margin({ right: this.cancelChip })
          .onClick(() => this.destroy())
      }
      .borderRadius('8vp')
      .backgroundColor(this.checked ? this.color : '#DCDCDC')
      .onClick(() => this.onClick())
      .margin(this.margin)
      .clip(true)
    }
  }
}