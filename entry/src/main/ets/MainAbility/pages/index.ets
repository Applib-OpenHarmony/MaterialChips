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
import { FilterChip, ChipSet, ChooseChip, EditChip, ActionChip, InputChip } from '@ohos/materialchips'

@Entry
@Component
struct Index {
  private inputchip1: InputChip.Model = new InputChip.Model()
  private filterchip1: FilterChip.Model = new FilterChip.Model()
  private filterchip2: FilterChip.Model = new FilterChip.Model()
  private filterchip3: FilterChip.Model = new FilterChip.Model()
  private actionchip1: ActionChip.Model = new ActionChip.Model()
  private editchip: EditChip.Model = new EditChip.Model()

  aboutToAppear() {
    this.inputchip1.setTextColor('#938200').setText("New Jeresy").setImage($r('app.media.Location'))
    this.filterchip1.setActiveChipColor(Color.Blue).setText("Cricket")
    this.filterchip2.setTextSize('24vp').setActiveChipColor(Color.Red).setText("Football")
    this.filterchip3.setActiveChipColor(Color.Red).setText("Football")
    this.actionchip1.setActiveChipColor(Color.Green)
      .setTextSize('16vp')
      .setImage($r('app.media.Bike'))
      .setText("Racing")
    this.editchip.setChipColor(Color.Blue).setTextColor(Color.Red)
  }

  @State choseChip: number = -1
  private Set: ChooseChip [] = [
    new ChooseChip(1, "Op1"),
    new ChooseChip(2, "Op2"),
    new ChooseChip(3, "Op3")
  ]

  build() {
    Column() {
      Text("Input Chip").fontSize('26vp')
      Flex({ justifyContent: FlexAlign.Start }) {
        InputChip({
          model: this.inputchip1
        })
      }

      Text("Filter Chip").fontSize('26vp')
      Row() {
        FilterChip({
          model: this.filterchip1
        })
        FilterChip({
          model: this.filterchip2
        })
        FilterChip({
          model: this.filterchip3
        })
      }

      Text("Choice Chip").fontSize('26vp')
      Flex({ justifyContent: FlexAlign.Start }) {
        ChipSet({
          choice: this.Set,
          chosenChipId: $choseChip
        })
      }

      Text("Action Chip").fontSize('26vp')
      Flex({ justifyContent: FlexAlign.Start }) {
        ActionChip({
          model: this.actionchip1
        })
      }

      Text("Edit Chip").fontSize('26vp')
      EditChip({
        model: this.editchip
      })
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}