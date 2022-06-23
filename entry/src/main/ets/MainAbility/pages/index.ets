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
  @State ChoseChip: number = -1
  private Set: ChooseChip [] = [
    new ChooseChip(1, "Op1"),
    new ChooseChip(2, "Op2"),
    new ChooseChip(3, "Op3")
  ]
  build() {
    Column() {
      Text("Input Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        InputChip({
          text: "New Jersey",
          textsize: 24,
          img: $r('app.media.Location'),
          imagesize: 26,
          chipcolor: '#D3D3D3',
          bradius: 10
        })
      }
      Text("Choice Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        ChipSet({
          choice: this.Set,
          ChosenChipId: $ChoseChip
        })
      }
      Text("Filter Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        FilterChip({
          text: "Op1"
        })
        FilterChip({
          text: "Op2",
          img: $r('app.media.Map')
        })
        FilterChip({
          text: "Op3"
        })
      }
      Text("Action Chip").fontSize('26vp')
      Flex({justifyContent: FlexAlign.Start}) {
        ActionChip({
          text: "Racing",
          textsize: 24,
          img: $r('app.media.Bike'),
          imagesize: 26,
          bradius: 10
        })
      }
      Text("Edit Chip").fontSize('26vp')
      EditChip({})
    }.alignItems(HorizontalAlign.Start)
    .width('100%')
  }
}