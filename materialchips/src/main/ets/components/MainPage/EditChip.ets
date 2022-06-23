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
  @State Dest: number= 0
  @State Sub: number= 1
  @State Tic: number= 0
  @State Rad: number= 0
  @State ChipId: number= -1
  @State text: string = ''
  @State checked: boolean = false
  @State private col: string = '#DCDCDC'
  @State color: string = '#DCDCDC'
  @State num: number = 0

  private onClick() {
    animateTo({
      duration: 100,
      onFinish: () => {
        this.Rad = 0
        this.color = this.col
      }
    }, () => {
      this.Rad = 200
      this.Dest = 0
      this.Sub = 1
    })
  }

  private Destroy() {
    this.color = '#DCDCDC'
    animateTo({ duration: 100 }, () => {
      this.Dest = 0
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
          .height(40 * this.Sub)
          .fontSize(30 * this.Sub)
          .fontWeight(FontWeight.Bold)
          .fontFamily("cursive")
          .fontStyle(FontStyle.Italic)
          .fontColor(Color.Red)
          .onChange((value: string) => {
            this.text = value
          })
          .onSubmit((enterKey) => {
            this.Dest = 1
            this.Sub = 0
          })
          .onEditChanged((isEditing) => {
          })
        Row() {
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
        .backgroundColor('#DCDCDC')
        .onClick(() => this.onClick())
        .margin(this.Dest * 8)
        .clip(true)
      }
    }
  }
}