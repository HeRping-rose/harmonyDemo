
@Preview
@Component
export struct JdNavBar {
  @Prop title: string = 'jdIndex'
  build() {
    Row(){
      Text('<')
        .fontSize(30)
        .padding({left: 10})
      Text(this.title)
        .fontSize(30)
        .padding({right: 10})
      Text('')
        .fontSize(30)
    }
    .width('100%')
    .height(50)
    .backgroundColor(Color.Red)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}