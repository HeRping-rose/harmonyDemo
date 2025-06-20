// 双向同步系统组件 $$

// @Watch  侦听器

// 案例  数据筛选
@Entry
@Component
struct Index {
  // @State phone:string = ''
  // @Watch 侦听器  侦听数据变化 执行业务能力
  // 语法 @Watch('函数名称')  数据:类型   当数据发生变化时  执行函数
  @State @Watch('OnPhoneChange') phone:string = ''

  // @State list:Array<string> = ['张三','张三1','张三2','张三3','张三4','张三5','张三6','张三7','张三8','张三9','张三10']
  @State @Watch('OnPhoneChange') Stars:string[] = [
    '1张三',
    '张三1',
    '张三2',
    '李三3',
    '李三4',
    '王三9',
    '王三10'
  ]
  @State name:string = ''
  @State result:string[] = []
  build() {
    Column({space:10}){

      // 方式二:  $$this.phone  数据双向绑定  双向同步  类似v-model
      TextInput({ placeholder: '请输入关键词' ,text:$$this.phone})
        .width('100%')
        // 方式一 :Onchange ()
        // .onChange((value: string) => {
        //   console.log(value)
        //   this.phone=value
        // })

        // //方式一
        // .onChange((value: string) => {
        //   this.result = this.Stars.filter((item:string) => {
        //     return item.includes(value)
        //   })
        // })

      ForEach(this.result, (item: string, index: number) => {
        Text(item)
          .id('phone')
          .border({
            width: 1,
            color: Color.Black,
            style: BorderStyle.Solid,
          })
      })
      // Text(this.phone)
      //   .id('phone')
      //   .border({
      //   width: 1,
      //   color: Color.Black,
      //   style: BorderStyle.Solid,
      // })

    }
  }
  // 数据变化时执行
  OnPhoneChange(value:string){
    // console.log('phone变化:'+value.toString())
    this.result = this.Stars.filter((item:string) => {
      return item.includes(this.phone)
    })

  }
}


