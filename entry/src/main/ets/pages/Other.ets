import { router } from '@kit.ArkUI'
import { userinfoStorage } from '../utils/Storage'


// 页面声明周期



@Entry(userinfoStorage)
@Component
struct Other {
  // @State nickname: string = userinfoStorage.get('nickname') as string
  // @State avatar: string = userinfoStorage.get('nickname') as string
  // @State token: string = userinfoStorage.get('nickname') as string


  // //获取参数
  @LocalStorageProp('nickname') nickname: string = ''
  @LocalStorageProp('avatar') avatar: string = ''
  @LocalStorageProp('token') token: string = ''

  build() {
    Column({space: 10}) {
      Text('Other页面').width('100%')
      Text('回退')//回退不可用
        .onClick(()=>{
          router.back()
        })
        .backgroundColor(Color.Red)



      // Text('昵称:'+userinfoStorage.get('nickname'))
      // Text('昵称:'+userinfoStorage.get('avatar'))
      // Text('昵称:'+userinfoStorage.get('token'))


      // @LocalStorageProp 语法获取参数
      Text(this.nickname+'')
      Text(this.avatar+'')
      Text(this.token+'')


    }
  }
}