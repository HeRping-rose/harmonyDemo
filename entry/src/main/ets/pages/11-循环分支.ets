// 循环  ForEach()   if()    if()else()     if()else if() else
/*
 * lazyForEach() 数据懒加载
 * ContentSlot()混合开发  未学
 * */



@Entry
@Component
struct Index {
  @State colors: Color[] = [Color.Red, Color.Yellow, Color.Blue]
  build() {
    Column(){
      ForEach(this.colors, ( (item:string, index: number) => {
        Text(item.toString()+ "----" + index)
      }))
    }
  }
}
