import GoodsItem from "../models/Goods"

@Component
export struct ShopGoods {
  @ObjectLink @Watch('onGoodsUpdate') item:GoodsItem
  @Link list:GoodsItem[]
  @Prop index:number
  @Consume isAllChecked: boolean

  @Consume allCount: number//商品数量
  @Consume allPrice: number//商品价格

  onGoodsUpdate(){
    this.allCount=this.allPrice=0
    // console.log('商品数据更新了')
    this.list.forEach((item:GoodsItem)=>{
      if(item.checked){
        this.allCount+=item.buyNum
        this.allPrice+=item.price*item.buyNum
      }
    })
  }
  build() {
    Row(){
      Row(){
        Checkbox()
          .select(this.item.checked)
          .shape(CheckBoxShape.ROUNDED_SQUARE)
          .margin({left:10 ,right:10})
          .onClick(()=>{
            // console.log(value.toString())
          //   把是否选中的状态赋值给商品数据
            this.item.checked=!this.item.checked
            //判断是否所有的商品都被选中了
            // every 每一个 回调函数的返回值必须为true 结果为true 否则返回false
            let status=this.list.every((item:GoodsItem)=>{
              return item.checked
            })
            // console.log(status.toString())
            this.isAllChecked=status


            if(status){

            }

          })
        Image(this.item.img).width(120)
          .height(120)
      }
      Column(){
        Text(this.item.name)
          .fontSize(24)
          .fontColor(Color.Black)
        Text('$'+this.item.price)
          .fontSize(20)
          .fontColor(Color.Red)
          .margin({top:10 , bottom:10})
        Row({space:10}){
          Button('－')
            .type(ButtonType.Normal)
            .fontColor(Color.Red)
            .fontSize(12)
            .padding(3)
            .backgroundColor('#d5c0cf')
            .onClick(() => {
              if(this.item.buyNum>1){
                //减 1 最小为1  等于0时该商品不在购物车中
                this.item.buyNum--
              }
            })

          Text(this.item.buyNum.toString())
            .fontColor(Color.Red)
            .padding(5)
            .backgroundColor(Color.Gray)
            .textAlign(TextAlign.Center)
            .border({
              width:{left:1,right:1,top:1,bottom:1},
              color: Color.Gray,
              style: BorderStyle.Solid,
              radius:2
            })
          Button('＋').fontColor(Color.Red)
            .type(ButtonType.Normal)
            .fontColor(Color.Red)
            .fontSize(12)
            .padding(3)
            .backgroundColor('#d5c0cf')
            .onClick(() => {
              this.item.buyNum++
            })
          Button('删除').fontColor(Color.Red)
            .fontColor(Color.Red)
            .type(ButtonType.Normal)
            .fontColor(Color.Black)
            .fontSize(14)
            .backgroundColor(Color.White)
            .onClick(() => {
              //删除数组中的一组数据 数组.splice(下标,删除掉数量)
              // this.item.buyNum=0
              this.list.splice(this.index,1)
              this.onGoodsUpdate()
            })
        }.margin({left:20})
      }

    }.width('100%')
    .height(160)
    .backgroundColor('#d5c0cf')
    .border({
      width:{bottom:3} ,
      color: Color.Gray,
      style: BorderStyle.Solid
    })
    .justifyContent(FlexAlign.SpaceBetween)


  }
}