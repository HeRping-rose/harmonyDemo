@Preview

@Component
export default struct ShopNavBar {

  @Prop title:string= '京东商城'
  build() {
    Row(){
      Text('<').TextExtend()
      Text(this.title).TextExtend()
      Text('').fontColor(Color.White)
    }

    .width('100%')
    .height(50)
    .backgroundColor('#d5c0cf')
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({left:10,right:10})
  }
}


//样式封装
@Extend(Text)
function TextExtend(){
  .fontColor(Color.White).fontSize(24)
}