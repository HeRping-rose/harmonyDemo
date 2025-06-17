// 京东登录注册页

/*
 * 短信倒计时模型  1.文字信息 content 获取验证码 ->还剩多少秒->获取验证码
 * 2. 是否可用 isDisabled 倒计时过程中不可以用
 * 3. 倒计时时间 time 60 ->0
 * 4. 时间timerID  setInterval(函数 ,间隔的ms):定时器(每隔一段时间运行)   清除定时器clearInterval()
 * 延时器let timerID=setTimeout(函数()=>{ },延迟的ms)定义一个返回值  清除延时器clearTimeout(timerID)
 *
 * */
@Entry
@Component
struct Index {
  @State isDisabled:boolean = false//禁用
  @State time:number = 10//倒计时时间
  @State timerID:number = 0//定时器ID
  @State content:string = '获取验证码'//获取验证码
  build() {
    // space: 组件之间的间隔
    Column({space:20}){
      // 1.标题
      Row(){
        Text('<').fontSize(20)
        Text('京东登录注册').fontSize(20)
        Text('')
      }.width('100%')
      .height(45)
      // .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({bottom:20})
      //   2,输入框
      //   .layoutWeight 占据剩余空间的比值

      TextInput({placeholder:'请输入手机号'})
        .margin({bottom:20})
        .border({
          width:{bottom:1},
          color:'#666',
          style:BorderStyle.Solid
        })
        .borderRadius(0)
        .backgroundColor(Color.Transparent)

      Row(){
        TextInput({placeholder:'请输入收到的验证码'})

          .borderRadius(0)
          .backgroundColor(Color.Transparent)
          .layoutWeight(1)
          .border({
            width:{right:1},
            color:'#666'
          })

        Button(this.content)//获取验证码
          .backgroundColor(Color.Transparent)
          .fontColor(Color.Red)
          .borderRadius(0)
          .padding({left:15,right:15})
            // .onClick(()=>{
            //   //点击之后禁用
            //   this.isDisabled = true;
            //   if(this.isDisabled){
            //     // 开始倒计时
            //     this.timerID=setInterval(()=>{
            //       if(this.time>0){
            //         this.time--;
            //         this.content = `还剩${this.time}秒`;//${}模版字符串 反引号  字符串拼接
            //         return
            //       }else if(this.time==0){
            //         this.isDisabled = false;
            //         this.time = 10;
            //         this.content = '获取验证码';
            //         clearInterval(this.timerID);//清除定时器
            //       }
            //     },1000)
            //   }
            // })
          .onClick(()=>{
            this.isDisabled = true;//禁用
            this.timerID=setInterval(()=>{// 开始倒计时
              if(this.time<=0){
                clearInterval(this.timerID);//清除定时器
                this.isDisabled = false;
                this.content = '获取验证码';
                this.time = 10;
                return
              }
              this.time--;
              this.content = `还剩${this.time}秒`;//${}模版字符串 反引号  字符串拼接
            },1000)
          })
      }.width('100%')
      .border({
        width:{bottom:1},
        color:'#666',
        style:BorderStyle.Solid
      })

      // 3.按钮

      Button('同意协议并登录')
        .width('100%')
        .border({
          radius:2
        })
        .backgroundColor('#ff8b95')

      Row(){
        Text('账号密码登录').fontColor('#ccc')
        Text('手机快速注册').fontColor('#ccc')
      }.width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row(){
        Text('----')
        Text('同意协议并选择其他登录方式')
        // .width('100%')
        // .textAlign(TextAlign.Center)
        Text('----')
      }.margin({top:60})

      Row(){
        Image($r('app.media.iconQQ')).height(50)
        Image($r('app.media.iconWX')).height(50)
      }.width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

      Row(){
        Checkbox({name:'checkbox'})
          .shape(CheckBoxShape.ROUNDED_SQUARE)
        Text('我已阅读并同意 《京东用户服务协议》 《用户隐私政策》 未注册的手机号将自动注册为京东账号')
          .fontSize(12)
      }

    }.width('100%')
    .height('100%')
    // .backgroundColor(Color.Gray)
    .padding(10)


  }
}