//1.封装自定义按钮  2.传递组件结构
import { router } from '@kit.ArkUI'

//3.组件传递多个UI结构  具名UI  类似 具名插槽
// 自定义  组件
// @BuilderParams  穿结构 类似vue:插槽

// 怎么传结构     组件使用时
// 怎么接收结构   尾随闭包 组件{}
@Builder function MyBuilderFunction(): void {}


@Component
struct MyButton {
  @Builder defaultContent(){
    Text('前置')//默认结构
  }
  //组件传值属性
  @Prop title: string=''
  @Prop bgColor: string='#ccc'

  //组件接收  @BuilderParams   传递过来是一个函数  接收尾随闭包传递过来的结构
  //要使用 默认结构 要赋默认值
  // 这个默认值是一个函数 且该函数要使用@Builder 声明
  @BuilderParam content:()=>void=this.defaultContent//需要一个函数 局部
  // @BuilderParam content:()=>void=MyBuilderFunction//需要一个函数--- 全局
  build() {
    Row(){
      //   图标 或者文字信息
      // Image($rawfile('search.png'))
      //   .width(22).height(22)
      //   .margin({left: 0, right: 10})
      this.content()
      //   文字
      Text(this.title).fontSize(20).fontColor(Color.White)
    }
    .padding({left: 20, right: 20})
    .height(50)
    .borderRadius(25)
    .backgroundColor(this.bgColor)
    .justifyContent(FlexAlign.Center)
  }
}

//navbar组件
@Component
struct MyNavBar {
  @Prop title: string = 'JD'
  @BuilderParam content:()=>void=this.defaultContent
  @Builder defaultContent(){Text('')}

  @BuilderParam leftContent:()=>void=this.defaultLeftContent
  @Builder defaultLeftContent(){Text('')}

  @BuilderParam rightContent:()=>void=this.defaultRightContent
  @Builder defaultRightContent(){Text('')}
  build() {
    Row() {
      // 左边
      // Text('<')
      //   .fontSize(20)
      //   .fontWeight(FontWeight.Bold)
      this.leftContent()
      //标题
      Text(this.title)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      // 右边
      // Text('')
      this.rightContent()
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceBetween)
    .height(50)
  }
}



@Entry
@Component
struct Index {
  @Builder leftBuilder(){
    Image($rawfile('back.png')).width(22).height(22)
      .margin({left: 10, right: 10})
      .onClick( () => {
        router.back()
      })

    // Text('<').fontSize(24).padding({left: 10})
  }
  @Builder rightBuilder(){
    Image($rawfile('search.png'))
        .width(22).height(22)
        .margin({left: 10, right: 10})
  }



  build() {
    Column({space: 20}){
      MyButton({title: '搜索', bgColor: '#07c160'}){
        // 尾随闭包
        Image($rawfile('search.png'))
          .width(20).height(20)
          .margin({left: 0, right: 10})
      }

      //组件封装时要接收付传递的结构 如果不穿可能会报错
      MyButton({title: '取消'}) //使用默认模版



      MyButton({title: '登录', bgColor: '#25b1ff'}){
        // Text('') //传文本 组件  尾随闭包
      }
      Button('按钮')

      MyNavBar({title: 'Index'})
      //尾随闭包只能传递一个结构
      // {
        // Image($rawfile('search.png'))
        //   .width(22).height(22)
        //   .margin({left: 0, right: 10})

        // Text('文本')
      // }

      // 组件传参 具名Ui传参   结构不确定 传多个结构
      // 与尾随闭包不可以同时使用
      MyNavBar({
        title: '首页',

        leftContent:this.leftBuilder,
        rightContent:this.rightBuilder
      })



    }
  }
}