

# 昨日复习

```ba
1.harmony介绍
   分布式操作系统(万物互联)
   策略：1+8+n
   北向：app应用    南向：openHarmony 硬件
   
2.下载安装DevEco Studio 编辑器

3.ArkUI  构建页面
  内置ui组件：
    Text()  文本组件
    Row()与Column   布局组件
     Row(): 子组件水平排列        主轴水平   侧轴(交叉轴)垂直
     Column(): 子组件垂直排列     主轴垂直   侧轴(交叉轴)水平
     主轴排列：justifyContent(FlexAlign.xxx)
     侧轴排列：alignItems()       col:alignItems(HorizontalAlign)    row:alignItems(VertialAlign)
     重点关注：侧轴默认水平居中
    Image(): 内置图片 $r("app.media.xxx")    网络图片:  开启网络权限
    TextInput()
    Button()
    
    
    类似css样式方法
    字体：fontSize()  fontColor()   fontWeight()   fontStyle()   color(Color.xxx或16进制)
    盒模型：width()   height()    
    背景：backgroundColor()
    内外边距：margin(数值或{left:xxx right:xxx top：xxx  botttom})  padding(数值或{left:xxx right:xxx top：xxx  botttom})
    边框：border({width:xxxx color:xxxx,style:xxxx})
    边框圆角：borderRadius(数值或 {topLeft:xxx  topRight:xxx  bottomLeft:xxxx   bottomRight:xxxx})
    ....
     
     
    
```

作业：京东注册页面

```javascript
@Entry
@Component
struct Index {
  build() {
    Column(){
      //   导航栏
      Row(){
        Text("<").fontSize(20)
        Text("京东登录注册").fontSize(20)
        Text("")
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width("100%")
      .padding(15)
      //   手机号输入框
      TextInput({placeholder:"请输入手机号"})
        .backgroundColor(Color.White)
        .borderRadius(0)
        .border({
          width:{bottom:1},
          color:"#f4f4f4"
        }).margin(10).width("90%")
      //   验证码输入框
      Row(){
        TextInput({placeholder:"请输入收到的验证码"}) .backgroundColor(Color.White)
          .borderRadius(0)
          .margin(10)
          .width("68%")
          .backgroundColor(Color.White)
        Text("获取验证码").fontColor("#a8a8a8")
      } .border({
        width:{bottom:1},
        color:"#f4f4f4"
      })
      //   登录按钮
      Button("登 录")
        .width("90%")
        .height(50)
        .fontSize(20)
        .margin({
          top:10,
          bottom:10
        })
        .backgroundColor("#ffbdb3")
      //   登录与注册文本
      Row(){
        Text("账号密码登录").fontColor("#a8a8a8")
        Text("手机快速注册").fontColor("#a8a8a8")
      }.width("90%").justifyContent(FlexAlign.SpaceBetween)
    }

  }
}
```



# 一.复习ts中类相关的知识

## 1.类与实例

```javascript
class Person {
	// 属性声明
    name: string
    age: number

    // 构造器

    constructor(name: string, age: number) {
        this.name = name
        this.age = age
    }
    // ⽅法
    speak() {
        console.log(`我叫：${this.name}，今年${this.age}岁`)
    }

}

// Person实例

const p1 = new Person('周杰伦', 38)
```

## 2.类的继承

```javascript
class Student extends Person {

    grade: string
    // 构造器
    constructor(name: string, age: number, grade: string) {
        super(name, age)
        this.grade = grade
    }

    // 重写从⽗类继承的⽅法

    override speak() {
    	console.log(`我是学⽣，我叫：${this.name}，今年${this.age}岁，在读${this.grade}年级`)
	}
// ⼦类⾃⼰的⽅法
    study() {
    	console.log(`${this.name}正在努⼒学习中......`)
    }

}
```

## 3.属性修饰符

![image-20241028211939380](images/image-20241028211939380.png)



### 3.1 public 修饰符

```javascript
class Person {
 // name写了public修饰符，age没写修饰符，最终都是public修饰符
 public name: string
 age: number
 constructor(name: string, age: number) {
     this.name = name
     this.age = age
 }
 speak() {
 // 类的【内部】可以访问public修饰的name和age
 console.log(`我叫：${this.name}，今年${this.age}岁`)
 }
}
const p1 = new Person('张三', 18)
// 类的【外部】可以访问public修饰的属性
console.log(p1.name)


class Student extends Person {
 constructor(name: string, age: number) {
 super(name, age)
 }
 study() {
 // 【⼦类中】可以访问⽗类中public修饰的：name属性、age属性
 console.log(`${this.age}岁的${this.name}正在努⼒学习`)
 }
}

```

属性的简写形式

```javascript
//完整写法
class Person {
     public name: string;
     public age: number;
     constructor(name: string, age: number) {
         this.name = name;
         this.age = age;
     }
}

//简写形式

class Person {
 constructor(
     public name: string,
     public age: number
 ) { }
}
```

### 3.2 protected 修饰符

```javascript
class Person {
    
 	// name和age是受保护属性，不能在类外部访问，但可以在【类】与【⼦类】中访问
     constructor(protected name: string,protected age: number) {}
    
     // getDetails是受保护⽅法，不能在类外部访问，但可以在【类】与【⼦类】中访问
     protected getDetails(): string {
     	// 类中能访问受保护的name和age属性
     	return `我叫：${this.name}，年龄是：${this.age}`
     }
     // introduce是公开⽅法，类、⼦类、类外部都能使⽤
     introduce() {
     	// 类中能访问受保护的getDetails⽅法
     	console.log(this.getDetails());
     }
}

const p1 = new Person('杨超越',18)
// 可以在类外部访问introduce
p1.introduce()
// 以下代码均报错
// p1.getDetails()
// p1.name
// p1.age
```

子类

```javascript
class Student extends Person {
     constructor(name:string,age:number){
     super(name,age)
     }
     study(){
     // ⼦类中可以访问introduce
     this.introduce()
     // ⼦类中可以访问name
     console.log(`${this.name}正在努⼒学习`)
     }
}
const s1 = new Student('tom',17)
s1.introduce()

```

### 3.3 private 修饰符

```javascript
class Person {
 constructor(
 public name: string,
 public age: number,
 // IDCard属性为私有的(private)属性，只能在【类内部】使⽤
 private IDCard: string
 ) { }
 private getPrivateInfo(){
 // 类内部可以访问私有的(private)属性 —— IDCard
 	return `身份证号码为：${this.IDCard}`
 }
 getInfo() {
 // 类内部可以访问受保护的(protected)属性 —— name和age
 	return `我叫: ${this.name}, 今年刚满${this.age}岁`;
 }
 getFullInfo(){
 // 类内部可以访问公开的getInfo⽅法，也可以访问私有的getPrivateInfo⽅法
 	return this.getInfo() + '，' + this.getPrivateInfo()
 }
}
const p1 = new Person('张三',18,'110114198702034432')
console.log(p1.getFullInfo())
console.log(p1.getInfo())
// 以下代码均报错
// p1.name
// p1.age
// p1.IDCard
// p1.getPrivateInfo()
```

### 3.4 readonly 修饰符

```javascript
class Car {
 constructor(
     public readonly vin: string, //⻋辆识别码，为只读属性
     public readonly year: number,//出⼚年份，为只读属性
     public color: string,
     public sound: string
 ) { }
 // 打印⻋辆信息
 displayInfo() {
     console.log(`
     识别码：${this.vin},
     出⼚年份：${this.year},
     颜⾊：${this.color},
     ⾳响：${this.sound}
     `);
 }
}
const car = new Car('1HGCM82633A123456', 2018, '⿊⾊', 'Bose⾳响');
car.displayInfo()
// 以下代码均错误：不能修改 readonly 属性
// car.vin = '897WYE87HA8SGDD8SDGHF'; 
// car.year = 2020;
```

## 4.接口的使用

interface 是⼀种定义结构的⽅式，主要作⽤是为：类、对象、函数等规定⼀种契约，这样可以确保代码的⼀致性和类型安全，但要注意 interface 只能定义格式，不能包含任何实现 ！

### 1.在类上的使用

```javascript
// PersonInterface接⼝，⽤与限制Person类的格式
interface PersonInterface {
 name: string
 age: number
 speak(n: number): void
}
// 定义⼀个类 Person，实现 PersonInterface 接⼝
class Person implements PersonInterface {
 constructor(
 public name: string,
 public age: number
 ) { }
 // 实现接⼝中的 speak ⽅法
 speak(n: number): void {
 for (let i = 0; i < n; i++) {
 // 打印出包含名字和年龄的问候语句
 console.log(`你好，我叫${this.name}，我的年龄是${this.age}`);
 }
 }
}
// 创建⼀个 Person 类的实例 p1，传⼊名字 'tom' 和年龄 18
const p1 = new Person('tom', 18);
p1.speak(3)
```



### 2.在对象上的使用

```javascript
interface UserInterface {
 name: string
 readonly gender: string // 只读属性
 age?: number // 可选属性
 run: (n: number) => void
}
const user: UserInterface = {
 name: "张三",
 gender: '男',
 age: 18,
 run(n) {
 console.log(`奔跑了${n}⽶`)
 }
};
```

### 3.在函数上的使用

```javascript
interface CountInterface {
 (a: number, b: number): number;
}
const count: CountInterface = (x, y) => {
 return x + y
}
```



## 5.类中的装饰器

1. 装饰器本质是一种特殊的**函数**，它可以对：类、属性、方法、参数进行扩展，同时能让代码更简洁。
2. 装饰器自`2015`年在`ECMAScript-6`中被提出到现在，已将近10年。
3. 截止目前，装饰器依然是实验性特性 ，需要开发者手动调整配置，来开启装饰器支持。
4. 装饰器有 5 种：

- 类装饰器
- 属性装饰器
- 方法装饰器
- 访问器装饰器
- 参数装饰器

> 备注：虽然`TypeScript5.0`中可以直接使用`**类装饰器**`，但为了确保其他装饰器可用，现阶段使用时，仍建议使用`experimentalDecorators`配置来开启装饰器支持，而且不排除在来的版本中，官方会**进一步调整**装饰器的相关语法！
> 参考：[**《TypeScript 5.0发版公告》**](

### 1.基本语法

类装饰器是一个应用在**类声明**上的**函数**，可以为类添加额外的功能，或添加额外的逻辑。

```typescript
/* 
  Demo函数会在Person类定义时执行
  参数说明：
    ○ target参数是被装饰的类，即：Person
*/
function Demo(target: Function) {
  console.log(target)
}

// 使用装饰器
@Demo
class Person { }
```

### 2.应用举例

需求：定义一个装饰器，实现`Person`实例调用`toString`时返回`JSON.stringify`的执行结果。

```typescript
// 使用装饰器重写toString方法 + 封闭其原型对象
function CustomString(target: any) {
  // 向被装饰类的原型上添加自定义的 toString 方法
  target.prototype.toString = function () {
    return JSON.stringify(this)
  }
  // 封闭其原型对象，禁止随意操作其原型对象
  Object.seal(target.prototype)
}

// 使用 CustomString 装饰器
@CustomString
class Person {
  constructor(public name: string, public age: number) { }
  speak() {
    console.log('你好呀！')
  }
}

/* 测试代码如下 */
let p1 = new Person('张三', 18)
// 输出：{"name":"张三","age":18}
console.log(p1.toString())

```

### 3.装饰器工厂

装饰器工厂是一个返回装饰器函数的函数，可以为装饰器添加参数，可以更灵活地控制装饰器的行为。  
需求**：**定义一个`LogInfo`类装饰器工厂，实现`Person`实例可以调用到`introduce`方法，且`introduce`中输出内容的次数，由`LogInfo`接收的参数决定。

```typescript
interface Person {
  introduce: () => void
}

// 定义一个装饰器工厂 LogInfo，它接受一个参数 n，返回一个类装饰器
function LogInfo(n:number) {
  // 装饰器函数，target 是被装饰的类
  return function(target: Function){
    target.prototype.introduce = function () {
      for (let i = 0; i < n; i++) {
        console.log(`我的名字：${this.name}，我的年龄：${this.age}`)
      }
    }
  }
}

@LogInfo(5)
class Person {
  constructor(
    public name: string,
    public age: number
  ) { }
  speak() {
    console.log('你好呀！')
  }
}

let p1 = new Person('张三', 18)
// console.log(p1) // 打印的p1是：_classThis，转换的JS版本比较旧时，会出现，不必纠结
p1.speak()
p1.introduce()
```

# 

# 二. ArkTS 方舟编程语言 

## 1.@State声明响应式数据

ArkTS是HarmonyOS优选的应用高级开发语言。

ArkTS提供了声明式UI范式、状态管理支持等相应的能力，让开发者可以以更简洁、更自然的方式开发应用。

```javascript
class 类名 {
	public 属性名:类型 =  数据
	
	函数名() {}
	
	// ....
}
```

**@state声明响应式数据**

````javascript
@Entry	
@Component 
struct 组件名 {
	// 普通数据
	public 属性名:类型 =  数据
	// 响应式数据  ->  视图层build里面  this.响应式名     this.响应式名 = 数据
	@State 属性名:类型 =  数据
	
	函数名() {}
	
	// 这里面写结构、样式
	build() {
		Text(内容)
			.css属性名()
			...
			.事件类型小驼峰(处理函数 推荐写箭头函数)
			.onClick(() => {
				console.log('hello')
			})
	}
	
	// ....
}
````

3.京东详情页收藏切换功能

```javascript
@Entry
@Component
struct Index {
  @State isCollect:boolean = true
  build() {
    // 京东商品详情页
    Column() {
      //   1.图片
      Image("https://m.360buyimg.com/mobilecms/s750x750_jfs/t1/240115/26/20995/45944/6719be05Fb160b22a/9ba4781e1e8fc19f.jpg!q80.dpg.webp")
        .width("100%")
      //   2.价格
      Row() {
        Text("¥")
          .fontSize(10)
          .fontColor("#ff0f23")
          .fontWeight(FontWeight.Bold)
        Text("5??9")
          .fontSize(20)
          .fontColor("#ff0f23")
          .fontWeight(FontWeight.Bold)
        Text("登录查看价格")
          .fontSize(14)
          .backgroundColor("#f53d4c")
          .fontColor(Color.White)
          .borderRadius({
            topLeft: 10,
            topRight: 10,
            bottomRight: 10,
            bottomLeft: 0
          })
          .padding(5)
      }
      .width("100%")
      .padding(15)

      //   3.商品名称
      Text("HUAWEI Pura 70 雪域白 12GB+512GB 超高速风驰闪拍 第二...")
        .fontWeight(FontWeight.Bold)
        .padding({ left: 15, right: 15 })
      //   4.排行榜
      Row() {
        Row() {
          Image("https://img10.360buyimg.com/img/jfs/t1/20724/31/20118/5100/6386d180Ef7435661/b73a0d4e3f653a22.png")
            .width(80)
            .height(30)
          Text("手机第16名")
            .fontSize(12)
            .fontColor("#ff0f23")
        }

        Image("https://m.360buyimg.com/rank/jfs/t1/206038/6/18674/1888/61bc390aE2a46f19b/321efee30a5a8e65.png/")
          .width(15)
          .height(15)
      }
      .width("95%")
      .justifyContent(FlexAlign.SpaceBetween)
      .margin(15)
      .backgroundColor(Color.Pink)
      .borderRadius(10)

      //   5.信息
      Row() {
        Row() {
          Image('https://img11.360buyimg.com/img/jfs/t1/185923/19/38125/325/64fad71dFeef526f9/f11f072077880807.png')
            .width(20)
            .height(20)
          Text("分享").fontSize(12)
        }

        Row() {
          if(this.isCollect) {
            Image('https://img0.baidu.com/it/u=2706542993,3693220697&fm=253&fmt=auto&app=138&f=JPEG?w=280&h=285')
              .width(20)
              .height(20)
            Text("收藏").fontSize(12).fontColor(Color.Red)
          }else {
            Image('https://img11.360buyimg.com/img/jfs/t1/185923/19/38125/325/64fad71dFeef526f9/f11f072077880807.png')
              .width(20)
              .height(20)
            Text("收藏").fontSize(12)
          }
        }.onClick(()=>{
          this.isCollect = !this.isCollect
        })

        Row() {
          Image('https://img11.360buyimg.com/img/jfs/t1/185923/19/38125/325/64fad71dFeef526f9/f11f072077880807.png')
            .width(20)
            .height(20)
          Text("分享")
            .fontSize(12)
        }
      }.width("100%")
      .justifyContent(FlexAlign.SpaceEvenly)
    }
  }
}
```



## 2.重点迁移说明

- 禁止使用对象字面量限制类型   **(重点关注)**

```javascript
class Data1Type {
  a: number = 0
  b: number = 0
}

// const data1: {a:number,b:number} = {a:1,b:2}
const data1: Data1Type = { a: 1, b: 2 }
```

> 学习问：interface和class类型限制有什么区别
>
> 回答：inteface仅仅类型限制 class可以赋值初始数据（留心class得设置默认值）

- 禁止使用解构赋值

```javascript
// const {a,b} = {a:1,b:2}
const obj = {a:1,b:2}
const a = obj.a
const b = obj.b
```

- 禁用call、apply

```javascript
function fn() {
  
}
fn.apply()
```

- 禁止使用索引访问

```javascript
interface ObjType  {
  a:number
  b:number
}

const data: ObjType = {
  a:11,
  b:22
}

console.log(data['a'])
```

- 禁止使用扩展运算符(禁用的是对象的，数组可以使用)

```java
interface ObjType  {
  a?:number
  b?:number
  c?:number
  d?:number
}
const data1: ObjType = {
  a:11,
  b:22
}
const data2: ObjType = {
  a:11,
  b:22
}

const data = {...data1,...data2}
```



# 三.样式复用多态

## 1 @Styles 

https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/arkts-style-0000001473856690-V2

> 如果每个组件的样式都需要单独设置，在开发过程中会出现大量代码在进行重复样式设置，虽然可以复制粘贴，但为了代码简洁性和后续方便维护，我们推出了可以提炼公共样式进行复用的装饰器@Styles。
>
> @Styles装饰器可以将多条样式设置提炼成一个方法，直接在组件声明的位置调用。通过@Styles装饰器可以快速定义并复用自定义样式。用于快速定义并复用自定义样式

- 全局定义

```javascript
// 全局
@Styles function functionNameStyle() { 
  .width(150)
  .height(100)
  .backgroundColor(Color.Red)
}

@Entry
@Component
sturt Index {
  // 组件内局部
  @Styles functionNameStyle() { ... }

  build() {
    Text('Text')
      .functionNameStyle()
  }
}
```

- 案例

```javascript
// 提取内置组件公共样式   函数

// @Styles装饰器分为全局与局部

//全局
// @Styles function iptStyles (){
//     .backgroundColor(Color.White)
//     .borderRadius(0)
//     .border({
//       width:{bottom:1},
//       color:"#f4f4f4"
//     }).margin(10).width("90%")
// }


@Entry
@Component
struct Index {

  // 局部
  @Styles iptStyles (){
    .backgroundColor(Color.White)
    .borderRadius(0)
    .border({
      width:{bottom:1},
      color:"#f4f4f4"
    }).margin(10).width("90%")
  }


  build() {
    Column(){
      // 手机号
      TextInput({placeholder:"请输入手机号"}).iptStyles()
      // 验证码
      TextInput({placeholder:"请输入收到的验证码"}).iptStyles()

    }
  }
}

```



## 2.@Extend 

> `@Extend` 用于扩展原生组件样式，通过传参提供更灵活的样式复用

-  **仅支持全局**
-  **支持传参，传递状态自动同步，也可以传递回调函数** 

```typescript
// 全局  原生组件                     参数
//  ↓     ↓                          ↓ 
@Extend(Text) function 属性名字(data: number) { 
  .width(data)
}
```

- 案例1

```javascript
// 提取内置组件公共样式   函数
// @Styles装饰器分为全局与局部
// @Styles 不能接收参数

// @Extend  可以传参  只支持全局  只支持原生组件
@Extend(TextInput) function iptStyles (num:number){
    .backgroundColor(Color.White)
    .borderRadius(0)
    .border({
      width:{bottom:num},
      color:Color.Red
    }).margin(10).width("90%")
}

@Entry
@Component
struct Index {
  
  build() {
    Column(){
      // 手机号
      TextInput({placeholder:"请输入手机号"}).iptStyles(1)
      // 验证码
      TextInput({placeholder:"请输入收到的验证码"}).iptStyles(5)

    }
  }
}

```

- 字体变大变小案例

```javascript
// @Extend小练习

@Extend(Text) function txtStyles(count:number){
  .fontSize(count)
  .backgroundColor(Color.Black)
  .fontColor(Color.White)
}

@Entry
@Component
struct Index {

  @State count:number = 20

  build() {
    Column(){
      Text("学鸿蒙，来千锋").txtStyles(this.count)
      Text("学鸿蒙，来千锋").txtStyles(this.count)

      Button("大大大").onClick((event: ClickEvent) => {
         this.count++
      })

      Button("小小小").onClick((event: ClickEvent) => {
        this.count--
      })
    }.width("100%")
  }
}
```



## 3.样式多态

> `stateStyles()` 可以依据组件的内部状态的不同，快速设置不同样式。

- normal：正常态。
- pressed：按压态。
- focused：获焦态。                DevEco5 有bug@24.6
- disabled：不可用态。

```javascript
@Entry
@Component
struct Index {
  build() {
    Column(){
      // 可以给按钮在不同的状态下设置不同的样式 stateStyles
      // 正常态：normal
      // 按压态: pressed
      // 获焦态：focused
      // 不可用态：disabled
      Button("按钮")
        .enabled(false)
        .stateStyles({
        normal:{
          .backgroundColor(Color.Pink)
        },
        pressed:{
          .backgroundColor(Color.Red)
        },
        focused:{
          .backgroundColor(Color.Green)
        },
        disabled:{
          .backgroundColor(Color.Gray)
        }
      }).onClick(()=>{
        console.log("ok")
      })


      TextInput().stateStyles({
        focused:{
          .backgroundColor(Color.Red)
        }
      })

      TextInput().stateStyles({
        focused:{
          .backgroundColor(Color.Red)
        }
      })
    }
  }
}
```

## 4.短信倒计时案例

```javascript
@Entry
@Component
struct Index {
  // 准备 完成布局  包括禁用效果 等等之类的
  // 1 声明响应式数据
  // content=获取验证码、time=60 学习咱们用10、timer定时器 后期清楚、 disabled 是否禁用
  // 并且视图使用
  // 2 绑定点击事件
  // 4 事件处理函数中
  // - 4.1 过滤   手机号过滤、避免重复点击
  // - 4.2 立马-1 并同步页面
  // - 4.3 每隔1秒-1    并且判断   time<=1  =》先清空定时器，接着响应式数据还原，最后终止代码执行
  // - 4.4 发送服务器请求  让服务器发送短信验证码

  @State content:string = '获取验证码'
  @State isEnabled:boolean = true

  private time:number = 10
  private timer:number = 0

  build() {
    Text(this.content)
      .fontSize(40)
      .fontColor(this.isEnabled?Color.White:'#ccc')
      // .fontColor('#ccc')
      .borderRadius(30)
      .padding(20)
      // 是否可交互   true-可以 没有禁用， false-不可以  也就禁用了
      .enabled(this.isEnabled)
      .stateStyles({
        normal: {
          .backgroundColor(Color.Black)
        },
        disabled: {
          .backgroundColor(Color.Gray)
        },
      })
      .onClick(() => {
        // - 4.1 过滤   手机号过滤、避免重复点击
        if (!this.isEnabled) return
        // - 4.2 立马-1 并同步页面
        this.isEnabled = false
        this.time--
        this.content = `剩余${this.time}s`
        // - 4.3 每隔1秒-1    并且判断   time<=1  =》先清空定时器，接着响应式数据还原，最后终止代码执行
        this.timer = setInterval(() => { // 返回number 第一次1 第二次2 唯一的
          if (this.time<=1) {
            clearInterval(this.timer)
            this.content = '获取验证码'
            this.isEnabled = true
            this.time = 10
            this.timer = 0
            return
          }
          this.time--
          this.content = `剩余${this.time}s`
        }, 1000)
        // - 4.4 发送服务器请求  让服务器发送短信验证码
        console.log('请求接口')
      })
  }
}
```



# 四. HarmonyOS实战开发调试

## 1 预览+日志的方式debug

这种方式只能进行基本数据类型的打印，适合简单调试

- 原始类型，也就是非字符串需要String() 或者 .toString()
- 对象类型，需要JSON.stringify转换
- 预览器-没事，模拟器-打印必须加前缀 否则找不到xh

<img width="1506" class="ne-image ne-image-preview" alt="image.png" draggable="true" src="https://cdn.nlark.com/yuque/0/2023/png/12928539/1700654073646-ec0c8390-391c-4440-b125-e50cf1bb068e.png?x-oss-process=image%2Fformat%2Cwebp%2Fresize%2Cw_1500%2Climit_0" data-sider-select-id="4aa2a830-33c0-4a25-9b1c-36a8440cd0aa">

```
@Entry
@Component
struct Index {
  @State num:number = 111
  @State animal:{name: string,age:number}[] = [
    {name:'狗', age: 10},
    {name:'猫', age: 11},
  ]

  build() {
    Button('打印调试').onClick(() => {
      // 细节1：仅支持打印字符串
      // 细节2：所以遇到数值型就得转换   String()、toString()
      // 细节3：所有遇到对象也的转换为字符串打印  或者 json数据格式
      // 细节4：预览器-没事，模拟器-打印必须加前缀 否则找不到
      // 致命一击：看的是预览器的打印， 测试的是模拟器
      // console.log(this.num)
      console.log('qf ', String(this.num))
      console.log('qf ', (this.num).toString())
      // console.log(this.animal)
      console.log('qf ', JSON.stringify(this.animal))
    })
  }
}
```



## 2 this指向

### 原生

简单概括： 调用当前方法的对象  也就是谁调用的打印的就是谁

固定公式

```
普通函数   window
对象函数   对象本身
事件函数   事件源
定时器函数  window
箭头函数   父function中的this  父没有function就是window
自定义     call/apply/bind
构造函数   this === 实例化对象 === 公共空间/原型对象上方法中的this 
```

code

```
<button>+1</button>

<script>
const fn1 = function() {
    console.log('普通函数 window: ', this)
}
fn1()

const obj1 = {
    a:1,
    b:2,
    c: function() {},
    d() {
        console.log('对象函数 对象本身：', this)
    }
}
obj1.d()


document.querySelector('button').onclick = function() {
    console.log('事件函数：', this)
}

setTimeout(function() { // TODO: 切记别写箭头  写了就是父级this指向 
    console.log('定时器函数 window： ', this)
}, 0)


class Animal {
    a = 1
    b = 2
    
    eat() {
        console.log('构造函数/类中的 自身', this)
    }
}

const dog = new Animal()  // {a:1,b:2}
dog.eat()
</script>
```



### 鸿蒙

this 自身/组件实例   

```
@Entry
@Component
struct Index {

  // 需 求：验证鸿蒙中的this是谁，确保写项目别出问题
  // 明确1： 鸿蒙声明响应式数据参考了class语法
  // 明确2： 加@State修饰符才有影响是  =》  @State  当数据改变会重新同步到视图

  // 1 定义数据 组件大括号里面声明 {}   => 修饰符 数据名:类型 = 数据
  // 2 获取数据 this.数据名
  // 3 更新数据 this.数据名 = 数据

  // @State 响应式数据名:类型 = 数据
  // @State 状态:类型 = 数据

  // 声明/定义 响应式数据
  // 声明/定义 状态
  @State num:number = 1

  aaa = 1111
  bbbb = 2222
  cccc = 3333
  dddd = function() {}
  other() {}

  build() {
    Column() {
      Text(String(this.num))
      Button('测试响应式效果')
        .onClick(() => {
          console.log('hello')
          this.num++
          console.log('内存数据：',this.num) // 组件自身、组件实例   里面存放了 自身数据
        })

      Button('打印this').onClick(() => {
        console.log('this是谁：', this)  // 留心：对象看不到具体数据，咱们可以吧对象转换为字符串  JSON数据格式
        console.log('this是谁：', JSON.stringify(this))
        // console.log('this是谁：', this.fn)
        console.log('this是谁：', this.other)
      })
    }
  }
}
```



### this使用细节 

箭头函数调用或者箭头函数声明否则this会出现undefined情况，推荐声明统一正常写，调用加箭头

```
const obj1 = {
    a:1,
    b:2,
    c: function() {},
    d() {
        console.log(1, this)
        setTimeout(() => {
            console.log(2, this)
        }, 0)
        setTimeout(function() {
            console.log(3, this)
        }, 0)
    }
}
obj1.d()
```



```
@Entry
@Component
struct Index {

  // es6 类class语法    属性名 = 数据   只不过赋值是一个函数
  // onTest1 = () => {
  //
  // }

  // es6 类class语法   原型的写法
  // onTest2() {
  onTest2 = () => { // 父级环境中的this  因为父级是组件实例  
    console.log('hello', this)
  }

  build() {
    Column() {
      // 调用数据  this.状态名
      // 调用函数  this.函数名()    this.函数名
      // - 区别1：有小括号执行了
      // - 去背2：如果打印他们两   有小括号因为执行了所以打印的结果 没写return undefined、   没有小括号打印的是函数本身
      // Button('this调用函数的细节').onClick(() => {
      //     console.log('【不加】小括号调用：', this.onTest2)  // 函数本身
      //     console.log('【  加】小括号调用：', this.onTest2()) // 执行打印返回结果
      // })

      // Button('this调用函数的细节').onClick(this.onTest2())
      Button('this调用函数的细节').onClick(this.onTest2)  // 发现undefined
      // Button('this调用函数的细节').onClick(() => {
      //   this.onTest2()
      // })
    }
  }
}
```



## 3知识点小结

- 7.1  后期打印 console.log      细节1-仅支持打印字符串，细节2-日志查看要切换设备，细节3-模拟器/真机需要加打印前缀
- 7.3  this指向  

```
鸿蒙中的是组件自身   因此可以直接通过  this.名字  获取更新数据
.onClick(处理函数)  切记切记一定要写箭头函数 避免this指向
```




