import { router } from '@kit.ArkUI';

interface Params {
  content: string;
}

@Entry
@Component
struct Another {
  @State message: string = 'Another';
  @State content: string = '';

  aboutToAppear(): void {
    console.log(JSON.stringify((router.getParams() as Params).content))
    this.content = (router.getParams() as Params).content;
  }

  build() {
    RelativeContainer() {
      Text(this.content)
        .id('AnotherHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          // this.message = 'Welcome';
          router.replaceUrl({ url:'pages/Other'})// 跳转页面Other
        })
      Text('回退')
        .onClick(()=>{
          router.back()
        })
      Text('接收参数')
        .onClick(()=>{
          router.getParams()//返回是一个对象
          // console.log(JSON.stringify(router.getParams()))
          // console.log(JSON.stringify(router.getParams()))
          //类型断言
          console.log(JSON.stringify((router.getParams() as Params).content))



        })

    }
    .height('100%')
    .width('100%')
  }
}