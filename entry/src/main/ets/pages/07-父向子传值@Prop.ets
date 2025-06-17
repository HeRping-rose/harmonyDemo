// 父子组件通信  => 父组件向子组件传值  @Props装饰器  单向数据传递
// 被调用的组件的是子组件
// 支持所有数据类型 包括数组 对象
// String number boolean enum
//当没有传值时候  this.name为undefined   子组件可以初始化这个值  'ron'
// 父组件数据更新 子组件会重新渲染  即覆盖掉子组件@Prop数据
// 子组件数据更新 父组件不会重新渲染  子组件可以修改@Prop数据值 父组件不会重新渲染


// 子组件
@Component
struct Child {
  @Prop name:string='ron'//子组件接收父组件传递的参数name
  @Prop arr:string[]//子组件接收父组件传递的参数arr

  build() {
    Column() {
      Text('子组件'+this.name)  //当没有传值时候  this.name为undefined  可以初始化这个值  'ron'
      Text('子组件'+JSON.stringify(this.arr))
      Text('子组件'+this.arr)
    }.width(200)
    .height(100)
    .backgroundColor(Color.Green)
  }
}

//父组件
@Entry
@Component
struct Index {
  @State name:string = '张三'
  @State arr:string[] = ['张三','李四','王五']
  build() {
    Column(){
      // 中间内容
      Column(){
        Text('父组件').width('100%')
        Text('父组件'+JSON.stringify(this.arr)).width('100%')
        Child({
          name:this.name,
          arr:this.arr})//传递值  键值对  {key:value} key是传递的参数名  value是传递的参数值
      }
      .width('100%')
      .layoutWeight(1)//占满剩余空间


    }.width('100%')
    .height(300)
    .backgroundColor(Color.Gray)
  }
}