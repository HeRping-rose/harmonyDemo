// 页面 生命周期  创建、显示、销毁、更新 有entry的
// 生命周期钩子函数 自动执行
// 1.aboutToAppear
// 2.onPageShow
// 3.onPageHide
// 4.aboutToDisAppear
// 5.onBackPress

// 组件生命周期  钩子函数  创建->销毁
/*
 *只有创建和销毁的时候执行一次
 *1.aboutToAppear 创建  2.aboutToDisAppear销毁
 *
 * */
import { router } from '@kit.ArkUI'


@Entry
@Component
struct Index {
  //立即执行 第一步
  aboutToAppear(): void {

    // 返回的时候不执行 页面不死 所以执行一次
    console.log('1.创建了') //创建Index--> 第二步 build() 渲染完毕
  }
  onPageShow(): void {
    console.log('2.页面显示') //显示Index 页面
  //   返回的时候触发执行show 可以执行多次
  }
  onPageHide(): void {
    console.log('3.页面隐藏') //隐藏Index页面
  }
  aboutToDisAppear(): void {
    console.log('销毁中') //销毁Index页面 只有一次
  //   全局组件  销毁  全局的 事件  或者定时器什么的
  }
  onDestroy(): void {
    console.log('销毁了') //销毁Index页面
  }
  onBackPress(): boolean | void {
    console.log('返回键被点击了')
  }
  build() {
    Column(){
      Text('首页').fontSize(20)
      Button('跳转')
        .onClick(()=>{

        // router.pushUrl({url:'pages/JdIndex'})
        router.replaceUrl({url:'pages/JdIndex'}) //栈顶替换
      })

      Son()
    }
    .width('100%')
    .height('100%')
  }
}

@Component
struct Son {
  aboutToAppear(): void {
    console.log('Son组件创建了')
  }
  aboutToDisappear(): void {
    console.log('Son组件销毁了')
  }
  build() {
    Text('Son组件').fontSize(20)
  }
}