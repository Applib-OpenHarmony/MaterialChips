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
import { FilterChip, ChipSet, ChoiceChip, EditChip, ActionChip, InputChip } from '@ohos/materialchips'

@Entry
@Component
struct Index {
  private input: InputChip.Model = new InputChip.Model()
  private filter1: FilterChip.Model = new FilterChip.Model()
  private filter2: FilterChip.Model = new FilterChip.Model()
  private filter3: FilterChip.Model = new FilterChip.Model()
  private action: ActionChip.Model = new ActionChip.Model()
  private edit: EditChip.Model = new EditChip.Model()
  private choice: ChipSet.Model = new ChipSet.Model()
  @State choseChip: number = -1
  private Set: ChipSet [] = [
    new ChipSet(1, "Op1").setBorderRadius('0vp'),
    new ChipSet(2, "Op2").setTextColor(Color.Red),
    new ChipSet(3, "Op3").setActiveTextColor(Color.Green).setImage($r('app.media.Location'))
  ]
  aboutToAppear() {
    this.input.setTextColor('#938200').setText("New Jeresy").setImage($r('app.media.Location'))
    this.filter1.setActiveChipColor(Color.Blue).setText("Cricket").setImage($r('app.media.Location'))
    this.filter2.setTextSize('24fp').setActiveChipColor(Color.Red).setText("Football")
    this.filter3.setActiveChipColor(Color.Red).setText("Basketball")
    this.action.setActiveChipColor(Color.Green)
      .setTextSize('16fp')
      .setImage($r('app.media.Bike'))
      .setText("Racing").setTextColor(Color.Red)
    this.edit.setChipColor(Color.Blue).setTextColor(Color.Red)
    this.choice.setItems(this.Set)
  }

  build() {
    Column() {
      Text("Input Chip").fontSize('26fp')
      Flex({ justifyContent: FlexAlign.Start }) {
        InputChip({
          model: this.input
        })
      }

      Text("Filter Chip").fontSize('26fp')
      Row() {
        FilterChip({
          model: this.filter1
        })
        FilterChip({
          model: this.filter2
        })
        FilterChip({
          model: this.filter3
        })
      }

      Text("Choice Chip").fontSize('26fp')
      Flex({ justifyContent: FlexAlign.Start }) {
        ChoiceChip({
          choice: this.Set,
          chosenChipId: $choseChip,
          model: this.choice
        })
      }

      Text("Action Chip").fontSize('26fp')
      Flex({ justifyContent: FlexAlign.Start }) {
        ActionChip({
          model: this.action
        })
      }

      Text("Edit Chip").fontSize('26fp')
      EditChip({
        model: this.edit
      })
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}