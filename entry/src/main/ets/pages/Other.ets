import { router } from '@kit.ArkUI'


// 页面声明周期



@Entry
@Component
struct Other {


  build() {
    Column() {
      Text('Other')
      Text('回退')
        .onClick(()=>{
          router.back()
        })
    }
  }
}