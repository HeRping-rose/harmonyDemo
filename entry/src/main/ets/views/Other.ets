import { router } from '@kit.ArkUI'

@Entry
@Component
struct Other {
  build() {
    Column() {
      Text('Other1111')
      Text('回退11111')
        .onClick(()=>{
          router.back()
        })
    }
  }
}