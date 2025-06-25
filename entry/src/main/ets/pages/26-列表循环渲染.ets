//列表渲染  上拉加载  下拉刷新  滚动浏览

// 滚动列表

// List 的子组件 ->ListItem


// list常见属性 和方法
// scrollBar(BarState.Off)//滚动条
// onReachEnd():当滚动列表滚动到底部时触发  分页 翻页



@Entry
@Component
struct Index {

  @State arr:string[]=[
    '1','2','3','4','5'
    ,'6','7','8','9','10'
    ,'11','12','13','14','15'
    ,'16','17','18','19','20','21'
    ,'22','23','24','25','26'
  ]

  build() {
      List({space: 20}){
        ForEach(this.arr, (item:string) => {
          ListItem(){
            Text(item)
              .fontSize(36)
              .width('100%')
              .height(40)
              .textAlign(TextAlign.Center)
              .backgroundColor(Color.Pink)
          }
        })
      }
      .scrollBar(BarState.Off)//滚动条 关闭显示
      .scrollBarColor(Color.Gray)//滚动条颜色
      .scrollBarWidth(5)//滚动条宽度
      .onReachStart(() =>{
        console.log('滚动到顶部了')
        this.arr.unshift(this.arr.length+1+'')
      })
      .onReachEnd(()=>{
        console.log('滚动到底部了')
        this.arr.push(this.arr.length+1+'')
      })


      // ForEach(this.arr, (item:string) => {
      //
      //   Text(item)
      //     .fontSize(36)
      //     .width('100%')
      //     .height(40)
      //     .textAlign(TextAlign.Center)
      //     .backgroundColor(Color.Pink)
      // })

    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}
