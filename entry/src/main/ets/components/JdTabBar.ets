import { router } from "@kit.ArkUI"

class TabBarItem{
  title: string
  router: string

  constructor(title: string, router: string) {
    this.title = title
    this.router = router
  }
}

@Entry
@Component
export struct JdTabBar {
  @Prop title: string = '京东首页'

  @State tabList: TabBarItem []=[
    new TabBarItem('首页','pages/Index'),
    new TabBarItem('分类','category'),
    new TabBarItem('消息','message'),
    new TabBarItem('购物车','pages/JdShopCar'),
    new TabBarItem('我的','pages/JdLogin')

  ]
    // ['首页','分类','消息','购物车','我的']
  build() {
    Row(){
      ForEach(this.tabList, (item:TabBarItem, index)=>{
        Column(){
          Text(item.title)
            .fontSize(20)
            .fontColor(this.title===item.title?Color.White:Color.Black)
            .onClick(()=>{
              router.replaceUrl({url:item.router})
            })
        }
      })
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.SpaceAround)
  }
}