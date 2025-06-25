import GoodsItem from "../models/JdGoods"

@Component
export  struct JdGoods {
  @Prop goods:GoodsItem
  build() {
    Row(){
      // Image($rawfile('apple.png'))
      Image(this.goods.goods_img)
      .width(100)
      .height(100)
      Column(){
        Text(''+this.goods.goods_name).fontSize(16)
        Row(){
          Text('￥' +this.goods.shop_price)
            .margin(5)
            .width(100)

          Button('加入购物车')
            .fontSize(16)
            .margin({top:5,bottom:5})
        }
        .width('100%')
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