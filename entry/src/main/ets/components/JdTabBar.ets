@Entry
@Component
export struct JdTabBar {
  @Prop title: string = '京东首页'

  @State tabList: string[] =
    ['首页','分类','消息','购物车','我的']
  build() {
    Row(){
      ForEach(this.tabList, (item:string, index)=>{
        Column(){
          Text(item)
            .fontSize(20)
            .fontColor(this.title===item?Color.White:Color.Black)
        }
      })
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.SpaceAround)
  }
}