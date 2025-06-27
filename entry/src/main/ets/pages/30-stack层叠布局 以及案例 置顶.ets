// 层叠布局 Stack
// import { Stack } from '@kit.ArkTS'

//修改子元素层级

// 修改子元素 位置  子元素 默认是在父容器水平居中
// Stack({alignContent: Alignment.Top}) 默认center

// 单独设置 子元素位置
// .offset() 偏移值// offset({x: 100, y: 100}) 偏移值  值是一个对象
//.translate



@Entry
@Component
struct Index {
  @State arr:string[] = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
  ]
  private scroller:Scroller =new Scroller()
  build() {

    Stack({
      alignContent: Alignment.Top
    }){
      Column(){
        List({
          space: 10,
          scroller:this.scroller
        }){
          ForEach(this.arr, (item:string, index) => {
            ListItem(){
              Text(item).height(200).width(100).fontSize(30)
                // .backgroundColor(Color.Grey)
                .textAlign(TextAlign.Center)
            }
            .width('100%')
          })
        }.scrollBar(BarState.Off)



        Image($rawfile('jjy.png'))
      }
      .backgroundImage($rawfile('jjy.png'))
      .backgroundImageSize({height:'100%'})
      .backgroundImagePosition(Alignment.Center)
      .width('100%')
      .height('100%')
      .backgroundColor(Color.Gray)

      // Row(){
        Image($rawfile('back.png'))
          .width(30).height(30)
          // .backgroundColor(Color.Green)
          .offset({x:'-45%', y:0})
          .translate({x:-2, y:0})
        Image($rawfile('menu.png'))
          .height(30)
          // .backgroundColor(Color.Green)
          .offset({x:'45%', y:0})
          .translate({x:2, y:0})
        Image($rawfile('sticky.png'))
          .width(40).height(40)
          // .backgroundColor(Color.White)
          .offset({x:'40%', y:'88%'})
          .onClick(() => {
            this.scroller.scrollTo({xOffset:0, yOffset:0,animation:true})
          })//置顶 滚动

      // }
      // .width('100%')
      // .justifyContent(FlexAlign.SpaceBetween)

    }
  }
}