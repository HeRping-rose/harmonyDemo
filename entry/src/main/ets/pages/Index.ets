@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('ronnie')
        .fontSize(35)
        .fontColor('#0000ff')
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)
      Text('ronnie')
        .fontSize(35)
        .fontColor('#0000ff')
        .fontStyle(FontStyle.Italic)
        .textAlign(TextAlign.Start)
        .fontWeight(FontWeight.Bold)

      Row() {
        Text('ronnie')
          .fontSize(35)
          .fontColor('#0000ff')
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .margin(10)

        Text('ronnie')
          .fontSize(35)
          .fontColor('#0000ff')
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 20 })
      }
      .border({
        color: "#cccccc",
        width: {
          right: 8,
          left: 8,
        },
        style: BorderStyle.Dashed
      })
      .padding({
        left: 20,
        right: 20
      })

      Row() {
        // 方式一 在线图片  线上图片显示在真机或者模拟器中需要配置权限
        Image('https://avatars.githubusercontent.com/u/103038543?v=4')
          .width(100)
          .height(100)
        //方式二 本地图片
        Image($r('app.media.jjy'))
          .width(100)
          .height(100)
        //本地图片 rawfile
        Image($rawfile('jjy.png'))
          .width(100)
          .height(100)
      }
      .margin({top:10})

      TextInput()
        .backgroundColor("#ffffff")
        .border({
          color:'#00ff00',
          width:4,
          style:BorderStyle.Solid
        })
        .width('80%')
        .borderRadius(10)
        .margin({top:8})

      Button('btn')
        .width(20)
        .width('50%')
        .backgroundColor("#ffffff")
        .borderRadius(10)
        .onClick(()=>{

        })

    }
    .height('100%')
    .width('100%')
    .backgroundColor('#2e134a')

  }
}

/*
 * .ets-->ArkTS <--ts的超集<--js超集
 * 页面:pages
 * @Entry :入口 一个页面只能有一个入口
 * @Comment :一个页面可以有多个组件
 * struct 组件名 { }  相当于class
 * struct结构体中必须有一个build(){}用于构造页面结构
 *
 * 快速生成页面结构体  entry +tab  comp+tab 快速生成组件
 *
 *
 * 内置组件:文本组件 ---显示文本消息的组件  Text(文本信息)
 *
 * 主轴:垂直向下方向 侧轴 :水平向右方向
 *
 * 对齐方式
 * 子元素在主轴对齐方式 justifyContent()
 * FlexAlign :  Start默认 Center End SpaceBetween SpaceEvenly SpaceAround
 * 子元素在侧轴对齐方式 alignItems()
 * column alignItems(HorizentalAlign.xxxx)
 * Row:alignItems(VerticalAlign.xxx)
 * */
