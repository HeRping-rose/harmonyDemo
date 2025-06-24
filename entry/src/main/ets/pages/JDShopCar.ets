import { JdNavBar } from '../components/JdNavBar'
import { JdShopGoods } from '../components/JdShopGoods'
import { JdTabBar } from '../components/JdTabBar'


@Preview
@Entry
@Component
struct JDShopCar {
  @State title: string = '购物车'

  build() {
    Column(){
    //   naveBar
      JdNavBar({title:this.title})

      Column(){
        JdShopGoods()

      }.layoutWeight(1)
    //   tabbar
      JdTabBar({title:this.title})
    }
    .height('100%')
    .width('100%')
  }
}