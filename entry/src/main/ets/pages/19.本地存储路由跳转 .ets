// 页面路由Router

// 1. 创建页面
// 2. 配置路由  res /base/profile/main_pages.json
// 3. 配置文件   双引号 包裹 json 格式

// 快捷创建页面并且配置路由  新建Page/empty page页面

// router.pushUrl({url:'pages/Another'})  可以回退
//
// router.replaceUrl({url:'pages/Another'}) 不能回退上一个页面

// 路由跳转传参
// 1. 传递参数:  router.pushUrl|replaceUrl({url:'pages/Another',params:{id:1,name:'张三'}})
// params:{id:1,name:'张三'}}  里面是一个参数对象{参数1:值1,参数2:值2,....}

// 2.接收参数:  router.getParams() 获取的是一个对象{参数1:值1,参数2:值2,....}


import { promptAction, router } from '@kit.ArkUI'
import { userinfoStorage } from '../utils/Storage'


@Entry(userinfoStorage)//绑定数据userinfoStorage  参数绑定
@Component
struct Index {
  @LocalStorageLink('nickname') nickname: string = ''// 存取数据  默认为空
  @LocalStorageLink('avatar') avatar: string = ''
  @LocalStorageLink('token') token: string = ''
  build() {
    Column(){
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
        router.pushUrl({
          url:'pages/Another',
          params:{
            id:1,
            name:'张三',
            content:'content'
          }
        })
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


      Button('登录').onClick((event: ClickEvent) => {
        /* 1.发送网络请求实现登录
         * 2.提示登录成功  模拟服务器返回数据
         * 3.跳转页面Other{nickName:'ron' ,....}
         将数据存储到Storage中  为了在其他页面使用
         * */

        // 存储
        // userinfoStorage.set('nickname', '用户名')
        // userinfoStorage.set('avatar', '头像')
        // userinfoStorage.set('token', 'adsfadsfdsafdsf')
        // // 提示
        // promptAction.showToast({
        //   message: '登录成功'
        // })
        // // 跳转
        // router.replaceUrl({
        //   url: 'pages/Other'
        // }, router.RouterMode.Single)


        // 存储
        this.nickname = 'ron'
        this.avatar = '头像'
        this.token = 'asdfafasdfadsf'
        // 提示
        promptAction.showToast({
          message: '登录成功'
        })
        // 跳转
        router.replaceUrl({
          url: 'pages/Other'
        }, router.RouterMode.Single)

      })



    }.width('100%')
    .height('100%')
  }
}