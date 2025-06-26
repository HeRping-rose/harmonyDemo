
//布局  1.线性布局 Row Column  子元素默认在侧轴上居中对齐

/*
 * 对齐方式  主轴 : justifyContent(FlexAlign.xxx)
 *         侧轴 : alignItem()  对Row() alignItem(VerticalAlign.xxx):top,center ,bottom
 *                       对Column() alignItem(HorizontalAlign.xxx):start center end
 * */

// 弹性布局  Flex
/*

*
* 主轴 :水平方向  侧轴:  垂直方向
* direction: FlexDirection.Column  修改主轴方向Row  RowReverse ColumnReverse
*
* 2.对齐方式
* 主轴
* justifyContent: FlexAlign.xxx  start  center  end  space-around  space-between
* 侧轴
* alignItems: ItemAlign.xxx  start  center  end  stretch  baseline
*
* 换行    wrap:FlexWrap.NoWrap
*
* 单个子元素 侧轴上的对齐方式
 * */


@Entry
@Component
struct Index {
  build() {
    //线性布局
    // Column(){}

  //   弹性布局  Flex
    Flex({
      direction: FlexDirection.Row,
      justifyContent: FlexAlign.SpaceAround,// 主轴
      alignItems:ItemAlign.Center,// 侧轴
      wrap:FlexWrap.NoWrap
    }){
      Text('1')
        .width(100).height(100)
        .backgroundColor(Color.Pink)
      Text('2')
        .width(100).height(100)
        .backgroundColor(Color.Pink)
        .margin(10)
        .alignSelf(ItemAlign.End)
      Text('3')
        .width(100).height(100)
        .margin({bottom: 10})
        .backgroundColor(Color.Pink)
      // Text('4')
      //   .width(100).height(100)
      //   .backgroundColor(Color.Pink)
    }
    .width('100%')
    .height('50%')
    .backgroundColor(Color.Gray)

  }
}