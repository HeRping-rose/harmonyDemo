// 栅格布局 GridRow GridColumn  跟随屏幕宽度 动态效果显示类似bootstrap

// 默认一行12个栅格
// 断点  xs: 480px sm: 576px md: 768px lg: 992px
// xl: 1200px xxl: 1600px 可以自定义


@Entry
@Component
struct Index {
  @State arr:string[] = [
    '1', '2', '3', '4', '5',
    '6', '7', '8', '9', '10',
  ]
  //xs 两个  大屏以上三个
  @State colors:Color[]=[
    Color.Red, Color.Blue, Color.Yellow, Color.Green, Color.Orange,
    Color.Pink, Color.Brown, Color.Gray, Color.White, Color.Black]
  build() {
    GridRow({
      breakpoints: {
        // value:['480vp', '576vp', '768vp', '992vp', '1200vp']
      }
    }){
      ForEach(this.colors, (item:string, index: number) => {
        GridCol(
          {
            span: {xs: 6, sm: 6, md: 4, lg: 2}
          }
        ){
          Text(index.toString()).fontSize(30).width('100%').height(80)
            .backgroundColor(item)
            .margin(5)
        }
      })
    }
  }
}