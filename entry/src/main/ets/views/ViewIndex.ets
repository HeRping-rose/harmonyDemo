// 页面路由Router

// 1. 创建页面
// 2. 配置路由  res /base/profile/main_pages.json
// 3. 配置文件   双引号 包裹 json 格式

// 快捷创建页面并且配置路由  新建Page/empty page页面

// router.pushUrl({url:'pages/Another'})  可以回退
//
// router.replaceUrl({url:'pages/Another'}) 不能回退上一个页面


import { router } from '@kit.ArkUI'


@Entry
@Component
struct ViewIndex {
  build() {
    Column(){
      Text("Hello ViewIndex").fontSize(30)
      Text("点击进入Another页")
      .width('100%')
      .fontSize(30)
      .fontColor(Color.Red)
      .textAlign(TextAlign.Center)
      .backgroundColor(Color.Yellow)
      .borderRadius(10)
      .borderWidth(2)
      .margin(10)
      .borderColor(Color.Red)
      .onClick(()=>{
        router.pushUrl({url:'pages/Another'})
        // router.pushUrl({url:'/pages/Another'})  前面先写/有提示 写完后记得删除/

        //页面栈跳转
      })
      Text("点击进入Other页")
        .width('100%')
        .fontSize(30)
        .fontColor(Color.Red)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.Yellow)
        .borderRadius(10)
        .borderWidth(2)
        .borderColor(Color.Red)
        .onClick(()=>{
          router.replaceUrl({url:'pages/Other'})
          //页面栈替换
        })
    }.width('100%')
    .height('100%')
  }
}