
// 待办列表


@Entry
@Component
struct Index {
  build() {
    Column({space:10}){
      //标题
      Text('待办').fontSize(40).width('100%').fontColor(Color.Black).fontWeight(FontWeight.Bold)
      //输入框

      Row({space:10}){
        TextInput({placeholder:'请输入待办事项'}).fontSize(20).width('80%').backgroundColor(Color.White).layoutWeight(1).height(50)
        Button('添加').height(50).borderRadius(0)
      }

      // 列表
      Row({space:10}){
        Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)
          .select( true )
        Text('早起晨练').fontSize(20).fontColor(Color.Gray)
          .decoration({
            type: TextDecorationType.LineThrough,
            color: Color.Gray,
            style: TextDecorationStyle.SOLID
          })//删除线  装饰线
      }
      .width('100%')
      .height(60)
      .borderRadius(20)
      .backgroundColor(Color.White)
      .padding(10)

      Row({space:10}){
        Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)
          .select( false )
        Text('准备早餐').fontSize(20).fontColor(Color.Black)
      }
      .width('100%')
      .height(60)
      .borderRadius(20)
      .backgroundColor(Color.White)
      .padding(10)


      Row({space:10}){
        Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)
          .select( true )
        Text('阅读名著').fontSize(20).fontColor(Color.Gray)
      }
      .width('100%')
      .height(60)
      .borderRadius(20)
      .backgroundColor(Color.White)
      .padding(10)






    }
    .width('100%')
    .height('100%')
    .backgroundColor('#edf2f5')
    .padding(20)
  }
}
