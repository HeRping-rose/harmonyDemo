// 网格Grid 布局  类似于  table布局 二维行列 单元格
// Grid 布局的容器，其子元素会自动按照一定规则进行布局。
// Grid 容器的子元素会按照一定规则进行布局，默认情况下，子元素会按照一行显示，如果子元素数量超出一行，则会自动换行。
// GridItem 是 Grid 布局容器的子元素，GridItem 的子元素
// 合并单元格，可以使用 GridItem 的 span 属性来指定合并的单元格数量。
// 设置行 列 模板，可以使用 Grid 的 rowsTemplate 和 columnsTemplate 属性来指定行和列的模板。以及比例

//单元格 合并   span 原则 ：  span 值必须小于等于行数或者列数
// 左上原则 在左或者上的单元格上  删除掉要合并的单元格
//左右合并 列合并  ColumnStart(数值) / ColumnEnd(数值)





@Entry
@Component
struct Index {
  @State nums:number[] = [1,2,3,4,5,6,7,8,9,10,11,12]
  @State box:Array<string|number> = [
    '0',
    'CE','C','/','*',
    '7','8','9','-',
    '4','5','6','+',
    '1', '2', '3', '=',
    '0', '.'
  ]

  build() {
    Column()
    {
      Text('Grid')
        .fontSize(20)
        .fontColor(Color.Red)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Gray)
        .padding(10)
        .margin(10)
        .width('90%')
        .height(50)
        .borderRadius(10)
        .borderWidth(2)
        .borderColor(Color.Red)
        .borderStyle(BorderStyle.Dotted)
        .borderStyle(BorderStyle.Dashed)

      Grid(){
        ForEach(this.box, (item:string|number, index: number) => {
          if(index === 0){
            GridItem(){
              Text(item.toString())
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Green)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .fontSize(20)
                .fontColor(Color.Black)
                .textAlign(TextAlign.End)
            }
            .columnStart(1)
            .columnEnd(4)
          }else if(index === 16){
            GridItem(){
              Text(item.toString())
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Green)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .fontSize(20)
                .fontColor(Color.White)
            }.rowStart(5).rowEnd(6)
          }else if(index === 17){
            GridItem(){
              Text(item.toString())
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Green)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .fontSize(20)
                .fontColor(Color.White)
            }.columnStart(5).columnEnd(6)
          }else {
            GridItem(){
              Text(item.toString())
                .width('100%')
                .height('100%')
                .backgroundColor(Color.Green)
                .textAlign(TextAlign.Center)
                .borderRadius(10)
                .fontSize(20)
                .fontColor(Color.White)
            }
          }
        })
        // ForEach(this.nums, (item:number, index) => {
        //   GridItem(){
        //     Text(item.toString())
        //       .width('100%')
        //       .height('100%')
        //       .backgroundColor(Color.Green)
        //       .textAlign(TextAlign.Center)
        //       .fontSize(20)
        //       .fontColor(Color.White)
        //   }
        // })
        // GridItem(){
        //   Text('0')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.End)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // .columnStart(2)
        // .columnEnd(5)
        // // .rowStart(2)
        // // .rowEnd(3)
        // GridItem(){
        //   Text('CE')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // // .columnStart(2)//数值  之间的差值  合并多少个
        // // .columnEnd(3)
        // GridItem(){
        //   Text('C')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('/')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('*')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('7')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('8')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // // .columnStart(2)
        // // .columnEnd(4)
        // GridItem(){
        //   Text('9')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('－')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('4')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('5')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('6')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // // .columnStart(2)
        // // .columnEnd(4)
        // GridItem(){
        //   Text('+')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('1')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('2')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('3')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // GridItem(){
        //   Text('=')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // .rowStart(2)
        // .rowEnd(3)
        // GridItem(){
        //   Text('0')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
        // .columnStart(2)
        // .columnEnd(3)
        // GridItem(){
        //   Text('.')
        //     .width('100%')
        //     .height('100%')
        //     .backgroundColor(Color.Green)
        //     .textAlign(TextAlign.Center)
        //     .fontSize(20)
        //     .fontColor(Color.White)
        // }
      }.width('100%')
      .height('100%')
      .backgroundColor(Color.Gray)
      .rowsTemplate('1.5fr 1fr 1fr 1fr 1fr 1fr 1fr')//行模板 1fr 表示一行 1表示占比
      .columnsTemplate('1fr 1fr 1fr 1fr')//列模板
      .rowsGap(10)//行间距 gap
      .columnsGap(10)//列间距
    }
  }
}