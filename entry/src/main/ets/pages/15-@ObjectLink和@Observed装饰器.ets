// @ObjectLink 类  装饰器  和   @Observed  配合一起使用   @Observed写在类身上
// 前提是要封装组件  一定要有组件传值 父子组件传值

//数据类型  接口或者类  建议写类
@Observed
class Person {
  name:string
  money:number
  constructor(name:string,money:number) {
    this.name = name
    this.money = money
  }
}
@Component
struct Child{
  //接收  父相子传递数据
  // @prop  单向
  // @link  不能声明item 应为item是一个对象
  // @Consume  后代消费  需要配合Provide使用

  // @Prop item:Person  //假象 money减少  子变了 父组件没有减少
  @ObjectLink item:Person  //还需要在类中写@Observerd  配合一起使用
  // item 接收的对象
  build() {
    Row({space:10}){
      Text(this.item.name)
      Text(this.item.money.toString())
      Button('spend')
        .onClick( () => {
          this.item.money -= 100
        })
    }
  }
}

@Entry
@Component
struct Index {
  @State persons:Person[]=[
    new Person('tom',1000),
    new Person('ron',5000)
  ]
  build() {
    Column(){
      Row({space:20}){
        Text('姓名')
        Text('资产')
        Text('操作')
      }

      ForEach(this.persons, (item:Person, index:number) => {
        Child({
          item:item//父向子传递数据
        })
      })

      // // ForEach(数据源 ,(参数(对象):参数类型,索引(下标):索引类型)
      // ForEach(this.persons, (item:Person, index:number) => {
      //   Row(){
      //     Text(item.name)
      //     Text(item.money.toString())
      //     Button('花钱')
      //       .onClick(() => {
      //         //嵌套数据第一层的数据修改才具有响应式
      //         this.persons[index] = new Person(item.name,item.money-=100)


      //         // item.money -= 100错误示范  要想这么做就需要组件封装 并且@ObejectLink 和@Observed混合使用
      //         console.log(item.money.toString())
      //       })
      //
      //   }
      // })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}
