import { router } from '@kit.ArkUI';

@Entry
@Component
struct Another {
  @State message: string = 'view Another111';

  build() {
    RelativeContainer() {
      Text(this.message)
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
      Text('View回退1111')
        .onClick(()=>{
          router.back()
        })

    }
    .height('100%')
    .width('100%')
  }
}