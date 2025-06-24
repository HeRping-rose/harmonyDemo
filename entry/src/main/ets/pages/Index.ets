import { JdGoods } from '../components/JdGoods'
import { JdNavBar } from '../components/JdNavBar'
import { JdTabBar } from '../components/JdTabBar'


@Entry
@Component
struct Index {
  @State title: string = '首页'

  // 首页
  build() {
    Column(){
    //   navbar
      JdNavBar({title: this.title})
    //   主题区域
      Column(){
        JdGoods()
        JdGoods()
        JdGoods()
      }.layoutWeight(1)
    //   tabBar
      JdTabBar({title: this.title})
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)

  }
}