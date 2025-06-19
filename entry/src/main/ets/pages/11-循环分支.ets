// 循环


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
