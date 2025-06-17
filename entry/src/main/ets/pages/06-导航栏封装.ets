// 导航条封装组件

// 导入  默认导入  import  变量名 from '模块路径'   <=export default  变量名;
// 按需导入  import {} from '模块路径'   <=export  xxx;   xxx要保持一致
import Navbar from '../components/NavBar'//默认导入
import {TabBar} from '../components/TabBar'//按需导入
// import { Navbar }  from '../components/NavBar'//按需导入

// 被调用的组件的是子组件

@Entry
@Component
struct Index {
  build() {

    Column(){
      //导航栏
      Navbar()

      // 中间内容
      Column(){
        Text('')
      }
      .width('100%')
      .layoutWeight(1)//占满剩余空间

      // 底部导航栏
      TabBar()
    }.width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}