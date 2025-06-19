//百度案例
class News
{
  public id:number
  public name:string
  public hot:boolean
  public idColor:Color

  constructor(id: number, name: string, hot: boolean, idColor: Color) {
    this.id = id
    this.name = name
    this.hot = hot
    this.idColor = idColor
  }


}
@Entry
@Component
struct BaiduHot {

  @State array:News[]=[
    new News(1, '第十个国家公祭日', true, Color.Red),
    new News(2, '关键时刻，中央开了一个', false, Color.Orange),
    new News(3, '红斑狼疮致残致死率', false, Color.Yellow),
    new News(4, '专家：房贷利率还有下', false, Color.Gray),
  ]
  build() {
    Column({space:20})
    {
      //标题
      Text('百度搜索')
        .fontSize(40)
        .width('100%')
      //排行榜
      //列表
      Row({space:20}) //row里面元素的间隔
      {
        Button('热搜榜')
          .borderRadius(0)
        Button('北京榜')
          .borderRadius(0)
          .backgroundColor('#ccc')
          .fontColor(Color.Black)
      }
      .width('100%')
      //列表

      ForEach(this.array,(item:News)=>
      {

        Column() {
          Row() {

            Text(item.id.toString()).fontSize(30).fontColor(item.idColor)

            Text(item.name).fontSize(30)
            if(item.hot)
            {
              Text('热')
                .fontSize(18)
                .backgroundColor('#DF7741')
                .borderRadius(4)
                .fontColor(Color.White)
                .padding(3)
            }
          }
          .width('100%')
        }
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Pink)
  }
}