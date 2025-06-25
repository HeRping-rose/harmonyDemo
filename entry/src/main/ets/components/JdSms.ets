@Component
export struct
JdSms {
  @State message: string = '获取验证码'
  @State time : number = 5
  @State isEnable: boolean = true
  @State timeID: number = 0



  build() {
    Button(this.message)
      .enabled(this.isEnable)
      .onClick(()=>{
        if(this.isEnable){
          this.isEnable=false

          this.message=this.time+'s'

          this.timeID=setInterval(()=>{
            this.time--
            if(this.time<=0){
              this.message='获取验证码'
              this.isEnable=true
              this.time=5
              clearInterval(this.timeID)
            }else {
              this.message=this.time+'s'
              this.isEnable=false
            }

//todo 发送请求到手机上获取验证码
            console.log('收到验证码了')
          },1000)
        }
      })
  }
}