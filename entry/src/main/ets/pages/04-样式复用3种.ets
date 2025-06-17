//arkTs响应式数据的声明方式
// @Extend 样式复用
// 只能全局使用没有局部 可以传参  只能为 原生组件(鸿蒙自带)提供样式
//执行所需要样式的组件  当text 有fontSize样式的可以使用 .fontSize
@Extend(Text)
function IPTStyles(num : number) {
  .fontSize(20)
  .border({
    width: { left: num },
    color: '#666'
  })
    .padding({ left: 15, right: 15 })
}



// @Styles 实现样式复用  用于装饰函数 分为两种形式 局部和全局

// 缺陷:不能传参 必须是通用样式 即任意一个盒子看得见的样式 width height border padding margin
// 全局样式声明装饰器
@Styles
function TextInputStyles(){
  .margin({ bottom: 20 })
  .border({
    width: { bottom: 1 },
    color: '#666',
    style: BorderStyle.Solid
  })
  .borderRadius(0)
  .backgroundColor(Color.Transparent)
}


@Entry
@Component
struct Index {
  // (响应式) 数据的声明 装饰器@State 数据实时发生变化 视图也发生变化
  /*
   * MVVM
   * model 模型 数据 View 视图 结构
   * View Model  连接作用 连接数据与视图ArkTS做数据处理
   * */
  @State count: number = 0;

  // 局部样式声明装饰器使用
  @Styles
  TextInputVerStyles(){
    .width('100%')
    .border({
      width: { bottom: 2 },
      color: '#666',
      style: BorderStyle.Solid
    })
  }
  // build() {
  //   Column(){
  //     Text("数值:"+this.count).fontSize(50)
  //     Button("点击").onClick(()=>{
  //       this.count++;
  //     })
  //   }
  // }
  build() {
    Column({ space: 20 }) {

      //   输入框
      //   .layoutWeight 占据剩余空间的比值
      TextInput({ placeholder: '请输入手机号' })
        .TextInputStyles()

      Row() {
        TextInput({ placeholder: '请输入收到的验证码' })
          .borderRadius(0)
          .backgroundColor(Color.Transparent)
          .layoutWeight(1)

        Text('获取验证码')
          .IPTStyles(2)

      }.TextInputVerStyles()

      // @stateStyle:多态样式
      // 样式多态  :组件在不同状态的样式不同  normal pressed focused disabled selected
      Button('登录')
        .width('50%')
        // .backgroundColor(Color.Gray)
        .fontColor(Color.White)
        .fontSize(20)
        .borderRadius(10)
        // .enabled(false)
        .stateStyles({
          normal: {
            .backgroundColor(Color.Gray)
          },
          pressed: {
            .backgroundColor( Color.Red)
          },
          focused: {
            .backgroundColor(Color.Yellow)
          },
          disabled: {
            .backgroundColor(Color.Blue)
          },
          selected: {
            .backgroundColor(Color.Green)
          }

        })
    }
  }

}