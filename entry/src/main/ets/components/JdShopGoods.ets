@Preview

@Entry
@Component
export struct JdShopGoods {
  build() {
    Row(){
      Image('https://tse4-mm.cn.bing.net/th/id/OIP-C.g5Z_46KaRbplB-6BOYgVggHaHa?w=185&h=185&c=7&r=0&o=7&dpr=1.1&pid=1.7&rm=3')
        .width(100)
        .height(100)
      Column(){
        Text('商品: apple').fontSize(20)
        Text('价格:￥999.99')
          .margin(10)

        Row(){
          Text('-').backgroundColor('#ccc').width(25).textAlign(TextAlign.Center)
          Text('0').margin(10)
          Text('+').backgroundColor('#ccc').width(25).textAlign(TextAlign.Center)
          Text('删除').margin(10).backgroundColor(Color.Green).padding(5)
        }
      }
    }
    .width('100%')
    .height(130)
    .padding(10)
    .justifyContent(FlexAlign.SpaceAround)
    .border(
      { width:{bottom: 1} ,
        color: Color.Black,
        style: BorderStyle.Solid
      }
    )
  }
}