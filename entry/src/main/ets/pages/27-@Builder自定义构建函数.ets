// 自定义构建函数  @Builder装饰器 轻量化UI结构  UI范式组件扩展

import { router } from '@kit.ArkUI'
import { JdSms } from '../components/JdSms'

//封装页面的结构  以输入框举例

// 方式一  使用组件
// @Component
// struct TextIpt {
//   build() {
//       TextInput({placeholder:'输入验证码'})
//   }
// }

// 方式二  封装UI结构   @Builder 轻量化UI结构 增加代码可读性
// 常用@Builder封装组件  公共ui
// @Builder
// function TextIpt() {
//   TextInput({placeholder:'输入验证码'})
// }

interface Params{
  count: number
}

// @Builder 注意事项
// 参数是基本类型 修改数据时自定义构建函数不会跟着变
//使用引用类型 (对象或者数组)  修改数据时 自定义构建函数才会跟着变化 传递参数为数组或者对象
@Builder
function  txt(params:Params){
  Text('值'+params.count).fontSize(24)
}

@Entry
@Component
struct Index {
  @State count:number=0
  // 局部
  @Builder
  //传递参数
   TextIpt(num:number) {
      TextInput({placeholder:num?'输入验证码':'输入手机号'}) //0:false=>'输入手机号'  1: true 非0=>'输入验证码'
        .layoutWeight(num)
    }

    // @Builder
    // txt(){
    //   Text('值'+this.count).fontSize(24)
    // }

  build() {
    Column({space: 20}){
      Text('登录页')
        .fontSize(36)

      // TextInput({placeholder:'请输入手机号'})
      // TextIpt() //全局
      this.TextIpt(0)//传递参数 0

      Row(){
        // TextInput({placeholder:'输入验证码'})

        // TextIpt()//全局使用 定义时候需要function参数自定义构建函数
        this.TextIpt(1)//局部使用需要使用this.指定  传递参数为1
          // .layoutWeight(1) //主轴方向剩余空间分配给该组件

        // Button('获取验证码')
        JdSms()
      }

      Button('立即登录').width('90%')

      Text('没有账号？立即注册').fontSize(16).fontColor(Color.Red)
        .onClick(()=>{
          router.replaceUrl({url:'pages/JdRegister'})
        })

      // this.txt(this.count)
      // txt(this.count)// 数值不会跟着变化  当处于全局构建函数中时  参数不会跟着变化
      txt({count:this.count})

      Button('+')
        .onClick(()=>{
          // this.count++
          this.count++//实际参数变了 但是页面没有刷新
          // console.log(this.count.toString())
        })
    }
    .height('100%')
    .width('100%')
    .padding({left: 20, right: 20})
  }
}