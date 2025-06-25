import { JdGoods } from '../components/JdGoods'
import { JdNavBar } from '../components/JdNavBar'
import { JdTabBar } from '../components/JdTabBar'
import { Axios } from './24-axios使用'

// 第三方工具 axios发送请求  对原生代码封装
// 安装ohpm  安装 axios  ohpm i @ohos/axios
import request from '../utils/request'
import { AxiosResponse, AxiosResponseTransformer } from '@ohos/axios'
import GoodsItem from '../models/JdGoods'

// interface Goodsitem{} //封装商品数据类型 模型

@Entry
@Component
struct Index {
  @State title: string = '首页'
  @State pagenum:number=1
  @State pagesize:number=10
  @State goodsList:GoodsItem[]=[]

  aboutToAppear(): void {
    this.getJdGoodList()
  }

  getJdGoodList(){
    //发送网络请求获取goods数据
    request({
      method: 'get',
      // url: '/goods/index?pagenum=1&pagesize=10',//地址
      url: '/goods/index',//地址
      params: {
        pagenum:this.pagenum,
        pagesize:this.pagesize
      }//get传参
    }).then((res:AxiosResponse) => {
      // console.log(JSON.stringify(res))
      // AlertDialog.show({message:JSON.stringify(res.data,null,2)})
      this.goodsList=res.data.list
    })
  }

  // 首页
  build() {
    Column(){
      //   navbar
      JdNavBar({title: this.title})
      //   主题区域
      Column(){
        ForEach(this.goodsList, (item:GoodsItem, index)=>{
          JdGoods({goods:item})
        })
        // JdGoods()
      }.layoutWeight(1)

      // Axios()

    //   tabBar
      JdTabBar({title: this.title})
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)

  }
}