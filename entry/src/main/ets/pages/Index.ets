// 京东购物车案例

/*
 * 展示购物车商品列表
 *
 * 修改商品数量  商品栅除
 * 全选  反选
 * */


//导入ShopNavBar
import { ShopGoods } from '../components/ShopGoods'
import ShopNavBar from '../components/ShopNavBar'
import { ShopTabBar } from '../components/ShopTabBar'
import GoodsItem  from '../models/Goods'


@Entry
@Component
struct Index {

  @State title:string = '购物车'
  @State goodsList:GoodsItem[]=[
    new GoodsItem('海味零食','https://m.360buyimg.com/babel/jfs/t1/163882/11/37490/6621/6465e34dF9347b277/62f8a1462d39513a.jpg',10,1,true),
    new GoodsItem('果冻布丁','https://m.360buyimg.com/babel/jfs/t1/113605/35/30715/9589/6386f8fdE96e0a1a5/0ec1901933d934d3.png',20,2,false),
    new GoodsItem('美味薯片','https://m.360buyimg.com/babel/jfs/t1/183392/2/31795/9391/6386f8fdE5661856e/7b25c26f7460d29a.png',30,3,false),
    // new GoodsItem('可口坚果','https://m.360buyimg.com/babel/jfs/t1/89600/33/15817/11753/5e747e68E43e789b9/15bff8b49fba2944.jpg',20,6,true),
  ]
  @Provide isAllChecked:boolean=false

  @Provide allCount:number=0
  @Provide allPrice:number=0


  //组件生命周期  页面渲染时自动执行一次
   aboutToAppear(): void {
     // this.allCount=this.allPrice=0
     // console.log('商品数据更新了')
     this.goodsList.forEach((item:GoodsItem)=>{
       if(item.checked){
         this.allCount+=item.buyNum
         this.allPrice+=item.price*item.buyNum
       }
     })
   }

  build() {
    Column({space:10}){
      // navbar 导航栏 标题栏
      ShopNavBar({title:this.title})//传值给子组件
      //商品列表
      Column(){
        ForEach(this.goodsList, (item:GoodsItem, index:number) => {
          ShopGoods({
            item:item,//传值给子组件
            list:this.goodsList,//数组
            index:index//索引
          })
        })
      }.width('100%')
      .layoutWeight(1)

      //统计信息区域
      Row() {
        Row(){
          Checkbox()
            .select(this.isAllChecked)//绑定数据  控制是否选中
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .onClick(() => {
              //获取到当前 checkbox的状态值
              //全选  把当前 checked的值覆盖商品的状态
              // for (let i = 0; i < this.goodsList.length; i++) {
              //   this.goodsList[i].checked = checked
              // }
              this.isAllChecked = !this.isAllChecked
              this.goodsList.forEach((item:GoodsItem) => {
                item.checked = this.isAllChecked
              })

            })
          Text('全选')
            .fontColor(Color.White)
        }

        Text('已选'+this.allCount+'件,合计:'+this.allPrice).fontColor(Color.White)
      }
      .width('100%')
      .height(30)
      // .backgroundColor('#0Dd5c0cf') //一半透明度
      .backgroundColor('#d5c0cf') //一半透明度
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({left:10,right:10})

      //底部导航栏tabBar
      ShopTabBar({title:this.title})
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#d5c0cf')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}


