// 双向同步系统组件 $$

// @Watch  侦听器

@Entry
@Component
struct Index {
  // @State phone:string = ''
  // @Watch 侦听器  侦听数据变化 执行业务能力
  // 语法 @Watch('函数名称')  数据:类型   当数据发生变化时  执行函数
  @State @Watch('OnPhoneChange') phone:string = ''
  build() {
    Column({space:10}){

      // 方式二:  $$this.phone  数据双向绑定  双向同步  类似v-model
      TextInput({ placeholder: '请输入内容' ,text:$$this.phone})
        .width('100%')
        // 方式一 :Onchange ()
        // .onChange((value: string) => {
        //   console.log(value)
        //   this.phone=value
        // })
      Text(this.phone)
        .id('phone')
        .border({
        width: 1,
        color: Color.Black,
        style: BorderStyle.Solid,
      })

    }
  }
  // 数据变化时执行
  OnPhoneChange(value:string){
    console.log('phone变化:'+value.toString())
  }
}


