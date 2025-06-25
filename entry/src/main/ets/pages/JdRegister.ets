import { router } from '@kit.ArkUI'
import { JdSms } from '../components/JdSms'

@Entry
@Component
struct JdRegister {

  build() {
    Column({space: 20}){
      Text('注册页')
        .fontSize(36)
      TextInput({placeholder:'请输入手机号'})
      Row(){
        TextInput({placeholder:'输入验证码'})
          .layoutWeight(1)

        // Button('获取验证码')
        JdSms()
      }
      Button('立即注册')
        .width('90%')

      Text('已有账号？立即登录')
        .fontSize(16)
        .fontColor(Color.Red)
        .onClick(()=>{
          router.replaceUrl({url:'pages/JdLogin'})
        })
    }
    .height('100%')
    .width('100%')
    .padding({left: 20, right: 20})
  }
}