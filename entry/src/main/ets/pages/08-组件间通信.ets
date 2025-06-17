// 父子组件通信  <=> 父组件双向子组件传值  @Link装饰器
// 被调用的组件的是子组件
// 支持所有数据类型 包括数组 对象
// String number boolean enum

/*
* 1.父子组件单向通信 @Prop
* 2.@Link 父子之间双向通信
* 3.@Provide 提供数据给后代子组件 @Consume 接收数据 后代组件间通信 双向通信
*
*/



// 子组件
@Component
struct Child {
  @Prop name:string='ron'//子组件接收父组件传递的参数name
  @Prop arr:string[]//子组件接收父组件传递的参数arr

  @Link count:number //不能设置默认值
  build() {
    Column() {
      Text('子组件'+this.name)  //当没有传值时候  this.name为undefined  可以初始化这个值  'ron'
      Text('子组件'+JSON.stringify(this.arr))
      Text('子组件'+this.arr)

      Text('子组件减一:'+this.count)
        .onClick(()=>{
          this.count--;
        })
        .border( {width:1,color:'#666',style:BorderStyle.Solid})

        Sun()
    }.width(200)
    .height(300)
    .backgroundColor(Color.Green)
  }
}

// 后代子组件
@Component
struct Sun {
  // @Consume money:number // @Consume 取别名
  @Consume('money') qian:number //不可以初始化


  build() {
    Column() {
      Text('孙组件:'+this.qian)
        .onClick(()=>{
          this.qian-=10;
        })
        .width('100')
        .height('100')
        .backgroundColor(Color.Pink)
        .border( {width:2,color:'#666',style:BorderStyle.Solid})
    }
  }
}

//父组件
@Entry
@Component
struct Index {
  @State name:string = '张三'
  @State arr:string[] = ['张三','李四','王五']
  @State count:number = 0
  @Provide money:number = 100//提供数据给后代子组件
  build() {
    Column(){
      // 中间内容
      Column(){
        Text('父组件').width('100%')
        Text('父组件'+JSON.stringify(this.arr)).width('100%')
        Child({
          name:this.name,
          arr:this.arr,
          count:this.count})//传递值  键值对  {key:value} key是传递的参数名  value是传递的参数值

        Text('父组件加一:'+this.count)
          .onClick(()=>{
            this.count++;
          }).border( {width:1,color:'#666',style:BorderStyle.Solid})
        Text('父组件:'+this.money)
          .onClick(()=>{
            this.money+=10;
          })
          .border( {width:1,color:'#666',style:BorderStyle.Solid})


      }
      .width('100%')
      .layoutWeight(1)//占满剩余空间


    }.width('100%')
    .height(500)
    .backgroundColor(Color.Gray)
  }
}