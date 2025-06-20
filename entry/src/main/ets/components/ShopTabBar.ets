
@Component
struct ShopTabBar {
  @Prop title:string='首页'
  @State TabList:string[] = [
    '首页',
    '分类',
    '购物车',
    '我的'
  ]

  build() {
    Row(){
      ForEach(this.TabList, (item:string) => {
        if(item===this.title){
          Text(item)
            .fontColor(Color.Red)
            .fontSize(22)
        }else {
          Text(item)
            .fontColor(Color.White)
            .fontSize(22)
            .onClick(()=>{
              this.title=item
            })
        }

      })


    }.width('100%')
    .height(50)
    .backgroundColor('#d5c0cf')
    .justifyContent(FlexAlign.SpaceAround)
  }
}
export {ShopTabBar}