import { router } from '@kit.ArkUI'
import { JdSms } from '../components/JdSms'
import { JdTabBar } from '../components/JdTabBar'

@Entry
@Component
struct JdLogin {

  build() {
    Column({space: 20}){
      Text('登录页')
        .fontSize(36)
      TextInput({placeholder:'请输入手机号'})
      Row(){
        TextInput({placeholder:'输入验证码'})
          .layoutWeight(1)

        // Button('获取验证码')
        JdSms()
      }
      Button('立即登录')
        .width('90%')

      Text('没有账号？立即注册')
        .fontSize(16)
        .fontColor(Color.Red)
        .onClick(()=>{
          router.replaceUrl({url:'pages/JdRegister'})
        })
      // JdTabBar()
    }
    .height('100%')
    .width('100%')
    .padding({left: 20, right: 20})
  }
}