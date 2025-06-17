// 封装头部导航栏组件
// 把这个组件向外导出,别人可以使用
// export  默认导出 :export default 只能有一个默认导出
// 按需导出 export  数据   可以有多个按需导出

// @Preview //预览装饰器
@Component
export  default struct Navbar {//默认导出
  build() {
    Column() {
      Row() {
        Row(){
          Text('<').fontSize(20).fontColor('#1989fa')
            .padding({ left: 5, right: 5})
          Text('返回').fontSize(20).fontColor('#1989fa')
        }
        Text('标题').fontSize(20)
        Text('按钮').fontSize(20).fontColor('#1989fa')
          .padding({ right: 10})
      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({ bottom: 20 })
    }
  }
}

// export { Navbar }  // 按需导出
