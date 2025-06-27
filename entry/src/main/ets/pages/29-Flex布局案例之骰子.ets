

// Flex 布局 骰子案例
@Entry
@Component
struct Index {
  build() {
    Flex(
      {
        direction: FlexDirection.ColumnReverse,
        justifyContent: FlexAlign.SpaceBetween,
        alignItems: ItemAlign.Auto,
        wrap:FlexWrap.NoWrap
      }
    ){
      Row(){
        // 6点
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.SpaceBetween,
        }){
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            // .alignSelf(ItemAlign.End)
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            // .alignSelf(ItemAlign.Center)
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          Row(){

          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }.width(100)
        .height(100)
        .padding(10)
        .backgroundColor(Color.Green)
        .borderRadius(20)

        // 5点
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.SpaceBetween,
        }){
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            // .alignSelf(ItemAlign.End)
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            // .alignSelf(ItemAlign.Center)
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
          }.width('100%')
          .justifyContent(FlexAlign.Center)
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Blue)
              .borderRadius('50%')
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }.width(100)
        .height(100)
        .padding(10)
        .backgroundColor(Color.Green)
        .borderRadius(20)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        // 4点
        Flex({
          direction: FlexDirection.Column,
          justifyContent: FlexAlign.SpaceBetween,
        }){
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Red)
              .borderRadius('50%')
            // .alignSelf(ItemAlign.End)
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Red)
              .borderRadius('50%')
            // .alignSelf(ItemAlign.Center)
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
          Row(){
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Red)
              .borderRadius('50%')
            Text('')
              .width(20)
              .height(20)
              .backgroundColor(Color.Red)
              .borderRadius('50%')
          }.width('100%')
          .justifyContent(FlexAlign.SpaceBetween)
        }.width(100)
        .height(100)
        .padding(10)
        .backgroundColor(Color.Green)
        .borderRadius(20)

        // 3点
        Flex({
          justifyContent: FlexAlign.SpaceBetween,
        }){
          Text('')
            .width(20)
            .height(20)
            .backgroundColor(Color.Blue)
            .borderRadius('50%')
            .alignSelf(ItemAlign.End)
          Text('')
            .width(20)
            .height(20)
            .backgroundColor(Color.Blue)
            .borderRadius('50%')
            .alignSelf(ItemAlign.Center)
          Text('')
            .width(20)
            .height(20)
            .backgroundColor(Color.Blue)
            .borderRadius('50%')
        }.width(100)
        .height(100)
        .padding(10)
        .backgroundColor(Color.Green)
        .borderRadius(20)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        // 2点
        Flex({
          justifyContent: FlexAlign.SpaceBetween,
        }){
          Text('')
            .width(20)
            .height(20)
            .backgroundColor(Color.Blue)
            .borderRadius('50%')
            .alignSelf(ItemAlign.End)
          Text('')
            .width(20)
            .height(20)
            .backgroundColor(Color.Blue)
            .borderRadius('50%')

        }.width(100)
        .height(100)
        .padding(10)
        .backgroundColor(Color.Green)
        .borderRadius(20)

        // 1点
        Flex({
          justifyContent: FlexAlign.Center,
          alignItems: ItemAlign.Center
        }){
          Text('')
            .width(20)
            .height(20)
            .backgroundColor(Color.Red)
            .borderRadius('50%')
        }.width(100)
        .height(100)
        .backgroundColor(Color.Green)
        .borderRadius(20)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)


    }
    .padding(5)
    .margin(5)
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)

  }
}