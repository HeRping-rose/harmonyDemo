
//@State 加强理解
/*
 * 基本数据类型5个  number  string  boolean  null(空值)  undefined(未定义)
 *
 * 复杂数据类型  数组array[] 对象Object{}
 *
 * 对象Object{}数据类型
 * 对象字面量literal 不能直接作为类型声明 , 应该使用 接口声明 或者使用 类 进行声明
 *
 * */
// 方式一 创建对象字面量  通过声明接口 声明接口 interface
interface Person {
  name: string
  age: number
}
// 方式二 声明一个类 进行使用  用class
class MyPerson {
  public name: string
  public age: number
  constructor(name: string, age: number) {
    this.name = name
    this.age = age
  }
}
/*
 * 复杂类型具有嵌套结构
 *
 * */
interface PersonJ {
  name: string
  age: number
  friend: Friend
}
interface Friend{
  name: string
  age: number
}

@Entry
@Component
struct Index {
  @State age: number = 18
  @State name: string = "张三"
  @State person: Person = {//类型声明 用接口声明
    name: "张三",
    age: 18
  }
  @State myPerson: MyPerson = new MyPerson("张三", 18)//需要new 一个实例 然后传参
  @State personJack: PersonJ = {
    name: "jack" ,
    age: 18,
    friend:{
      name:"rose",
      age:20
    }
  }




  build() {
    Column() {
      Text(this.age.toString())
        .onClick(() => {this.age++})
        .backgroundColor(Color.Gray)

      Text(this.name.toString())

      Text('person:'+this.person.name+this.person.age)//接口声明的

      Text('myPerson:'+this.myPerson.name+this.myPerson.age)//类声明的
        .onClick(() => {
        // this.myPerson = new MyPerson("李四", 19)
          this.myPerson.age++
        })
        .backgroundColor(Color.Gray)

      Text('personJack : '+this.personJack.name+this.personJack.age+'  friend : '+this.personJack.friend.name+this.personJack.friend.age)
        .onClick(() => {
          // this.personJack.age++
          // @State 只会对引用数据类型的第一层赋予响应式数据的能力
          // 嵌套的属性不具有响应式数据能力
          // this.personJack.friend.age++//错误 页面不刷新
          // 解决问题

          // this.personJack.friend = {
          //   name:this.personJack.friend.name,
          //   age:++this.personJack.friend.age//++要前置 后置不可以用  用新对象覆盖旧的对象
          // }

          /*
          前置递增运算符 ++：
          ++ 是 JavaScript/TypeScript 中的前置递增运算符。它将操作数增加 1，并返回增加后的值。
          在 ++this.personJack.friend.age 中，它会将 age 属性的值增加 1，并返回新的值。
          */

        //   简洁一点
          let temp=this.personJack.friend
          this.personJack.friend = {
            name:temp.name,
            age:++temp.age//++要前置 后置不可以用  用新对象覆盖
//   由于需要将最新的 age 值赋给新的对象，因此必须使用 ++x（前置递增），以确保赋值的是更新后的值。如果使用 x++，会导致赋值的是旧值，从而达不到更新显示的目的。
          }

          /*
           * 表达式  返回值     实际效果  类型     行为描述
           * ++x    增加后的值  先加后用  前置递增  先值加1 然后 返回增加后的值
           * x++    增加前的值  先用后加  后置递增  先返回当前的值 然后再将值增加1
           * */

        })

    }
  }
}