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
  @State pagenum:number= 0  //1改为0
  @State pagesize:number=10 //
  @State goodsList:GoodsItem[]=[]//为空
  @State GoodCount:number=-1//商品数量  -1=>24

  // aboutToAppear(): void {
  //   this.getJdGoodList()
  // }


  // 异步请求获取数据
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


      // ...扩展运算符 语法
      /*
       * arr =[1,2,3]  ...就是[]
       * ...arr->1,2,3
       * arr1 =[1,2,3]    ...arr1->1,2,3
       * arr2 =[4,5,6]    ...arr2->4,5,6
       * newArr=[...arr1,...arr2]
       * newArr=[1,2,3,4,5,6]
       * */
      // this.goodsList=res.data.list
      this.goodsList=[...this.goodsList, ...res.data.list as GoodsItem[] ]//数组扩展

      this.GoodCount=res.data.total

    })
  }

  // 首页
  build() {
    Column(){
      //   navbar
      JdNavBar({title: this.title})
      //   主题区域
      // Column(){
      //   ForEach(this.goodsList, (item:GoodsItem, index)=>{
      //     JdGoods({goods:item})
      //   })
      //   // JdGoods()
      // }.layoutWeight(1)
      List(){
        //当数据为空时，会触发onReachStart
        ForEach(this.goodsList, (item:GoodsItem, index)=>{
          ListItem(){
            JdGoods({goods:item})
          }
        })
      }.layoutWeight(1)
      .width('100%')
      .scrollBar(BarState.Off)
      .onReachEnd(()=>{
        // 临界值判断 当商品数量小于10时，则不加载下一页数据
        // 数组长度等于商品数量时，则不加载下一页数据
        if(this.goodsList.length===this.GoodCount){
          // this.GoodCount=-1  ->24
          //this.goodsList.length=0 ->10->20>24
          return
        }

        // 滚动到底部加载下一页数据 发送网络请求加载数据
        this.pagenum++ //页码加1
        this.getJdGoodList()//获取数据
        // this.goodsList.push(new GoodsItem('1','1',1,1,true))
        console.log('滚动到底部了'+this.pagenum)

      })

      // Axios()

      //   tabBar
      JdTabBar({title: this.title})
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)

  }
}