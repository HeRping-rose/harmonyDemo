# 昨日复习

```
1. ts中类的复习
   1.1类中属性修饰符：public(类，子类，外部)  protected(类，子类)   privite(类)   readonly （只读）  static
   1.2类中接口的使用：类名 impletement 接口   
   
   	   ts中声明接口： interface 接口
   	   harmony中声明对象类型接口： class 类 =>  接口 与 类
   	 
   1.3ts中装饰器：可以用在类，属性名，方法前 本质函数
    	
    	@装饰器
    	class 类名 {}
    	
2. @State 声明响应式数据

3. 封装重复样式属性方法
   @Styles function xxx(){}     封装公共样式属性，不能传参
   @Extend(内置组件) function xxx(){}     可以传参
   样式多态：stateStyles({
   	   normal:{}
   	   pressed:{}
   	   focused:{}
   	   disabled:{}
   })
   
```



# 一. 组件化编程 

## 1 组件化开发思想

以前：每个页面对应一个.html文件，如果出现页面字体图标或者文字需要更改，工作量略大   

<img src="http://tmp00002.learv.com/90394d44f9ffbd2633ded82eca8ae963.jpg" width="500" /> 

鸿蒙倡导组件化开发思想，将页面划分成一个个小的模块，也就是小的页面/组件，然后通过导入拼凑的方式组成一个完整的网页，

从而便于后期维护

<img src="http://tmp00002.learv.com/2e89e792f70d73c08ddd3e7248aab826.jpg" width="600"  /> 



## 2 组件简介

它是鸿蒙开发中非常重要的一个思想，让我们通过独立的、或可复用的组件来构建网站，从而提高代码复用性，便于后期维护

 简单来说，其实就是HTML升级后的思想，增加到导出导入    



## 3 UI组件库/框架

是什么：一堆提前封装好的，项目开发常见的公共组件（指公共布局界面）  

能干嘛：1-统一开发规范、页面布局 2-减少代码冗余，便于后期维护

有哪些：https://ohpm.openharmony.cn/#/cn/home   



## 4 封装导航栏NavBar组件

components/NavBar.ets      写内容样式并导出

```javascript

//公共样式
@Extend(Text) function txtStyles(){
    .fontSize(24)  //fontSize不属于公共属性
    .fontColor(Color.White)
}

@Component
export default struct NavBar {
  build() {
    Row(){
      Text("左边").txtStyles()
      Text("标题").txtStyles()
      Text("右边").txtStyles()
    }.width("100%")
    .height(50)
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

Index.ets 中导入

```javascript
import NavBar from '../components/NavBar'

@Entry
@Component
struct Index {
  build() {
    Column(){
      NavBar()
      Text("文本内容")
    }.width("100%")
    .height('100%')
  }
}
```



## 5 组件关系

### 层级思想

被调用的组件必定是子组件  

<img src="http://tmp00002.learv.com/24e6aa021c7572d71129e14756871d1b.jpg" height="400"/>    



### 封装思想 

```
vue中封装组件： 页面级组件=>路由     标签级组件=> 标签形式使用
```

实战中，组件封装至少分为 `公共组件`  和  `逻辑/页面组件`  这二个类别  

公共组件价值：增加代码【复用性】，便于后期维护  

> 一次定义 多次使用，减少代码冗余、便于后期维护 或者 提高代码的复用性等，例如NavBar导航栏、TabBar标签栏、弹框Dialog

逻辑/页面组件价值：增加代码【可读性】，便于后期维护     

<img src="http://tmp00002.learv.com/3f28037b05e06bfa5e6a27f95614bd69.jpg" height="400"/>    



### 封装移动端底部栏/标签栏

components/TabBar.ets

```javascript
@Component
export default struct TabBar {
  build() {
    Row() {
      Column() {
        Image("https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/81741/30/12345/4140/5d9c4b13E726f0a1e/82c582e7c375e4b3.png")
      }.width("25%")

      Column() {
        Image("https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/81741/30/12345/4140/5d9c4b13E726f0a1e/82c582e7c375e4b3.png")
          .width("100%")
          .height("100%")
      }.width("25%")

      Column() {
        Image("https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/81741/30/12345/4140/5d9c4b13E726f0a1e/82c582e7c375e4b3.png")
          .width("100%")
          .height("100%")
      }.width("25%")

      Column() {
        Image("https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/81741/30/12345/4140/5d9c4b13E726f0a1e/82c582e7c375e4b3.png")
          .width("100%")
          .height("100%")
      }.width("25%")
    }.width("100%")
    .height(70)

    // .backgroundColor(Color.Black)
  }
}
```

Index.ets

```javascript
import NavBar from '../components/NavBar'
import TabBar from '../components/TabBar'

@Entry
@Component
struct Index {
  build() {
    Column() {
      NavBar()
      Column() {
        Text("文本内容")
      }.layoutWeight(1) //自适应缩放
      .backgroundColor(Color.Pink)
      .width("100%")

      TabBar()
    }.width("100%")
    .height('100%')
  }
}
```

# 二 组件状态共享

## 1 场景

不同父调用NavBar子组件所显示的内容不一样，父得传递数据给子  也就是组件通信

场景1

<img src="http://tmp00002.learv.com/132d640320342bc16d01b71869cc1eb3.jpg" height="300" /> 



场景2

<img src="http://tmp00002.learv.com/9164ab6bf63b0043ee20909499e07676.jpg" height="300"/>     



## 2 父子单向@Prop

```javascript
//以前Vue开发时
准备：src/components/NavBar.vue子组件   父组件导入调用   <NavBar />
步骤1：调用组件写属性  <NavBar title="首页/分类页/我的"/>
步骤2：组件内部获取   
	props: ['title']   					 
	props: {										
		title: String
	}
	defineProps(['title'])
	defineProps({
		title: String
	})
步骤3：使用    {{ title }}
```

**harmony中实现父向子传值的方式**

> 传递：组件名(  {  名字: 数据, ....,    }   )      组件函数中传递对象
>
> 接收：@Prop 名字:string = ‘默认值’
>
> 使用： this.名字
>

```javascript
//Index.ets
import NavBar from '../components/NavBar'
import TabBar from '../components/TabBar'

@Entry
@Component
struct Index {
  build() {
    Column() {
+      NavBar({
+        title: "京东商城"
+      })
      Column() {
        Text("文本内容")
      }.layoutWeight(1) //自适应缩放
      .backgroundColor(Color.Pink)
      .width("100%")

      TabBar()
    }.width("100%")
    .height('100%')
  }
}


//NavBar.ets
//公共样式
@Extend(Text)
function txtStyles() {
  .fontSize(24) //fontSize不属于公共属性
  .fontColor(Color.White)
}

@Component
export default struct NavBar {
+  @Prop title: string = "hello"

  build() {
    Row() {
      Text("左边").txtStyles()
+     Text(this.title).txtStyles()
      Text("右边").txtStyles()
    }.width("100%")
    .height(50)
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

**注意事项**

- 支持类型 `string、number、boolean、enum` 类型，星河版也支持数组或对象
- 子组件可以初始化默认值

- 子组件可修改 `Prop` 数据值，但不同步到父组件，父组件更新后覆盖子组件 `Prop` 数据

```javascript
@Component
struct Son {
  @Prop count: number

  build() {
    Column() {
      Text("子组件:" + this.count)

      Button("+1").onClick((event: ClickEvent) => {
        this.count++
      })

    }.border({
      width: 3,
      color: Color.Blue
    }).padding(20)
  }
}


@Entry
@Component
struct Index {
  @State count: number = 0

  build() {
    Column() {
      Text("父组件:" + this.count)
      Button("+1").onClick((event: ClickEvent) => {
        this.count++
      })
      Son({ count: this.count })
    }.width("100%")
    .height(400)
    .border({
      width: 5,
      color: Color.Red
    })
  }
}
```



## 3 父子双向@Link

- 子组件中被@Link装饰的变量/状态与其父组件中对应的数据源建立双向数据绑定（子可以修改父的数据，并且父同步）
- 步骤1：父组件传值的时候需要 `this.` 改成 `$`，不改也可以
- 步骤2：子组件 `@Link` 修饰数据   不能设置默认值

```javascript
@Component
struct Son {
-  @Link count: number

  build() {
    Column() {
      Text("子组件:" + this.count)

      Button("+1").onClick((event: ClickEvent) => {
        this.count++
      })

    }.border({
      width: 3,
      color: Color.Blue
    }).padding(20)
  }
}


@Entry
@Component
struct Index {
  @State count: number = 0

  build() {
    Column() {
      Text("父组件:" + this.count)
      Button("+1").onClick((event: ClickEvent) => {
        this.count++
      })
-      Son({ count: $count })
    }.width("100%")
    .height(400)
    .border({
      width: 5,
      color: Color.Red
    })
  }
}
```



## 4 后代@Provide与@Consume

vue: 依赖注入   祖先组件：provide     后代组件：inject

@Provide和@Consume，应用于与后代组件的双向数据同步，应用于状态数据在多个层级之间传递的场景。不同于上文提到的父子组件之间通过命名参数机制传递，@Provide和@Consume摆脱参数传递机制的束缚，实现跨层级传递。

其中@Provide装饰的变量是在祖先节点中，可以理解为被“提供”给后代的状态变量。@Consume装饰的变量是在后代组件中，去“消费（绑定）”祖先节点提供的变量。

> @Provide  name: string = 'hello'      // 属性-站在原生js 类角度      状态  响应式加了@State
>
> @Consume  name: string
>
> 或者
>
> @Provide name: string = 'hello'
>
> @Consume('key') 新名字: string
>



```javascript
class ObjType {
  a: number = 0
  b: number = 0
}


@Component
struct Sun {
  @Consume("count") countABC: number
  @Consume obj: ObjType

  build() {
    Column() {
      Text("孙组件" + this.countABC + "对象:" + JSON.stringify(this.obj))
      Button("+1").onClick((event: ClickEvent) => {
        this.countABC++
      })
      Button("对象a+1").onClick((event: ClickEvent) => {
        this.obj.a++
      })
    }.border({
      width: 3,
      color: Color.Green
    }).padding(20)
  }
}


@Component
struct Son {
  build() {
    Column() {
      Sun()

    }.border({
      width: 3,
      color: Color.Blue
    }).padding(20)
  }
}



@Entry
@Component
struct Index {
  @Provide count: number = 0
  @Provide obj: ObjType = { a: 1, b: 2 }

  build() {
    Column() {
      Text("父组件:" + this.count + "对象:" + JSON.stringify(this.obj))
      Button("+1").onClick((event: ClickEvent) => {
        this.count++
      })
      Button("对象a+1").onClick((event: ClickEvent) => {
        this.obj.a++
      })
      Son()
    }.width("100%")
    .height(400)
    .border({
      width: 5,
      color: Color.Red
    })
  }
}
```



## 5 知识点小总结

| 修饰符   | 支持                                              | 默认值 | 响应式 | 双向 | **场景**   |
| -------- | ------------------------------------------------- | ------ | ------ | ---- | ---------- |
| 不写     | number/string/boolean/对象类型                    | 可以   | /      | /    | 不推荐     |
| @Prop    | 以前：仅支持 number/string/boolean 、现在：都支持 | 可以   | 有     | /    | 父传子单向 |
| @Link    | 都支持                                            | 没有   | 有     | 有   | 子修改父   |
| @Consume | 都支持                                            | 没有   | 有     | 有   | 多层级     |



# 三. 组件状态@State加强

## 1.基本数据类型

```javascript
@Entry
@Component
struct Index {

  @State num: number = 1


  build() {
    Column() {
      Text('num：' + this.num).fontSize(30)
      Button('+1').onClick(() => this.num++)
    }
  }
}
```



## 2.引用类型

> @State只会对**引用数据类型的第一层赋予响应式数据的能力，嵌套的属性不具备响应式**

- 铺垫案例

```javascript
class Date2Type {
  a: number = 0
  b: number = 0
}

class Child {
  name: string = ''
  age: number = 0
}

class Data3Type {
  name: string = ''
  age: number = 0
  child: Child = { name: '', age: 0 }
}


@Entry
@Component
struct Index {
  @State data1: number = 0
  @State data2: Date2Type = { a: 1, b: 2 }
  @State data3: Data3Type = {
    name: 'jack',
    age: 40,
    child: {
      name: 'jack的儿子',
      age: 12
    }
  }

  build() {
    Column() {
      Text("数值:" + this.data1)
      Button("+1").onClick((event: ClickEvent) => {
        this.data1++
      })

      Text("---------------------------")
      Text("对象:" + JSON.stringify(this.data2))
      Button("+1").onClick((event: ClickEvent) => {
        this.data2.a++
        this.data2.b++
      })

      Text("---------------------------")
      Text("嵌套对象:" + JSON.stringify(this.data3))
      Button("修改").onClick((event: ClickEvent) => {
        // this.data3.age++
        //this.data3.child.age++
        this.data3.child = {
          name: this.data3.child.name,
          age: ++this.data3.child.age
        }
      })
    }.width("100%")

  }
}
```



- 实战案例：类型使用值得学习

```javascript
class Goods {
  id:number
  title:string
  price:number

  constructor(id:number,title:string,price:number) {
    this.id = id
    this.title = title
    this.price = price
  }
}

@Entry
@Component
struct Index {

  // 实战1
  @State goods: Goods[] = [
    // {id:1,title:'商品1',price:1},
    // {id:2,title:'商品2',price:2},
    // {id:3,title:'商品3',price:3},
    new Goods(1, '商品1', 1),
    new Goods(2, '商品2', 2),
    new Goods(3, '商品2', 3),
  ]

  // 实战2
  build() {
    Column() {
      Text('第二个商品的price属性：' + this.goods[1].price)
      Button('更改').onClick(() => {
        // this.goods[1].price++
        const item = this.goods[1]
        this.goods[1] = new Goods(item.id, item.title, item.price+1)
      })
    }
  }
}
```





# 四,判断循环

## 1. 判断

ArkTS提供了渲染控制的能力。条件渲染可根据应用的不同状态，使用if、else和else if渲染对应状态下的UI内容。



```javascript
@Entry
@Component
struct LearnIf {
  @State isShow: boolean = false

  build() {
    Column() {
      Button(this.isShow ? '消失' : '显示').onClick(() => {
        this.isShow = !this.isShow
      })
      if (this.isShow) {
        Text('哈哈我出现了')
      }
    }
  }
}
```





## 2. 循环

为啥要有循环 =》 服务器返回数据  一般都是 数组里面是一个个对象  咱们需要通过循环挨个展示 

ForEach接口基于数组类型数据来进行循环渲染，需要与容器组件配合使用，且接口返回的组件应当是允许包含在ForEach父容器组件中的子组件



```javascript
//以前：数组.forEach( (item,i)=>{} )
//Harmony: ForEach(  数组,  (item,i)=>{  布局代码内置组件或者自定义组件  },  ㊙️ )


ForEach(
  arr: Array,
  itemGenerator: (item: any, index?: number) => void,
  keyGenerator?: (item: any, index?: number) => string
)
```



### 2.1基本使用

循环tabbar.ets中的图标

```javascript
class TabType {
  src: string = ''
}

// harmony中循环语法
// ForEeach(数据源,(item,index)=>{})

@Component
export default struct TabBar {
  @State Tabs: TabType[] = [
    {
      src: "https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/81741/30/12345/4140/5d9c4b13E726f0a1e/82c582e7c375e4b3.png"
    },
    {
      src: "https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/56507/6/12787/3168/5d9c4b12Ef363dd8d/4af32f42575509d8.png"
    },
    {
      src: "https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/64954/4/12406/3529/5d9c4b12Ee7a82735/f2fe0a88bf344736.png"
    },
    {
      src: "https://img12.360buyimg.com/img/s130x100_jfs/t1/203343/14/10880/3097/61641568E184a8e0b/4522f6ec5bb9b10b.png"
    },
  ]

  build() {
    Row() {
      ForEach(this.Tabs, (item: TabType, index: number) => {
        Column() {
          Image(item.src)
            .height("100%")
        }.width("25%")
      })
    }.width("100%")
    .height(50)
  }
}
```







## 3.案例：百度热搜

<img src="http://tmp00002.learv.com/2f5f20d5fcf3d0bbf1929bbce7da9883.jpg"  width="300"/>  

```
@Entry
@Component
struct Index {

  @State news: any[] = [
    {id:1, title: '第十个国家公祭日', hot: true},
    {id:2, title: '关键时刻 中央开了一', hot: false},
    {id:3, title: '红斑狼疮致残致死率', hot: true},
    {id:4, title: '专家：房贷利率还有下', hot: false},
  ]

  // fontColor = 数据
  // fontColor = function() {}
  fontColor = (id)  => {
    let color = '#9396a0'
    if (id==1) color = '#FE2D46'
    if (id==2) color = '#F60'
    if (id==3) color = '#FAA90E'
    return color
  }

  build() {
    Column({space: 20}) {
      // 标题
      Row() {
        Text('百度搜索')
          .fontSize(45)
          .fontWeight(FontWeight.Bold)
      }
        .width('100%')
      // 筛选按钮
      Row() {
        Button('热搜榜')
          .type(ButtonType.Normal)
        Button('北京榜')
          .type(ButtonType.Normal)
          .margin({left:20})
          .fontColor('#000')
          .backgroundColor('#f5f6fa')
      }
        .width('100%')
      // 搜索列表
      ForEach(
        this.news,
        (item: any) => {
          Row() {
            Text(String(item.id))
              .fontSize(30)
              .fontColor(this.fontColor(item.id))
              .fontWeight(FontWeight.Bold)
            Text(item.title)
              .fontSize(30)
              .padding({left:5})
            if (item.hot) {
              Text('热')
                .fontColor('#fff')
                .backgroundColor('#e0773e')
                .padding(4)
                .borderRadius(5)
            }
          }
          .width('100%')

        }
      )
    }
      .padding(20)
  }
}
```



## 4.案例：鸿蒙计算器

```
# 计算器思路

一、布局
    Column
        Row结果 
        Row四个文字按钮   每个文字w75/h75/圆角
        ...
    也可以进一步完善 文字按钮定义成数组，循环展示

二、声明状态 num1/fuhao/num2/result  => 并视图展示所有装填

三、绑定点击事件 onResult

四、处理函数中线保存num1、再保存fuhao、接着num2、最后AC、= 

if (data === '=') {
    let sum:number = 0
    switch (this.fuhao) {
        ....
    }
    this.result = String(sum)
    return
}
if (data === 'AC') {
    this.num1 = this.num2 = this.fuhao = this.result = ''
    return
}
// if (data==='+' || data==='-') {
if (['+','-','x','÷'].includes(data)) {
    this.fuhao = data
    return
}
if (this.fuhao) {
    this.num2 += data
} else {
    this.num1 += data
}
```



<img src="http://tmp00002.learv.com/65e5476ac65e105b0d3c4873bfa41776.jpg"  width="200"/>    

```
1列5行
Column  w100% h100% bg#000 padding30
		结果展示 Row  w100%  h40%
				Text 233  w100%  textAigin居中  fontSize 80  color #fff
	
  	第一行 Row  w100% h15% 
  			Text 数字  w75 h75 bg#333  font-size30 color #fff   圆角75   textAigin居中
  			Text 数字  w75 h75 bg#333  font-size30 color #fff   圆角75   textAigin居中
  			Text 数字  w75 h75 bg#333  font-size30 color #fff   圆角75   textAigin居中
  	
  	...
       
  	第四行 Row  w100% h15% 
  			Text 数字  w75 h75 bg#333  font-size30 color #fff   圆角75   textAigin居中
  			Text 数字  w75 h75 bg#333  font-size30 color #fff   圆角75   textAigin居中
  			Text 数字  w75 h75 bg#333  font-size30 color #fff   圆角75   textAigin居中
    	
	  模型 total = 0   视图渲染    后续得下次上课讲解  
```



1、完成了 每个数字点击保存到 num1

2、完成了 每个符号点击保存

3、完成的AC清空

4、缺  每个数字点击 判断 符号选没选  没选-保存到num1中 选了-保存到num2

5、 计算结果

````javascript
@Extend(Text) function textStyle(active: boolean) {
  .fontSize(30).fontColor('#fff').textAlign(TextAlign.Center)
  .width(75).height(75)
  .backgroundColor(active ? '#daaa60': '#333')
  .borderRadius(75)
}

@Entry
@Component
struct Index {

  // 1 布局
  // 2 声明状态  4个  =》 视图去用一下
  // 3 绑定事件 交给一个函数处理 onResult
  // 4 先处理数字、处理符号、处理第二个数字、AC、=

  @State num1:string = ''
  @State fuhao:string = ''
  @State num2:string = ''
  @State result:string = ''

  onResult(data:string) {
    if (data === '=') {
      let sum:number = 0
      switch (this.fuhao) {
        case '+':
          sum = Number(this.num1) + Number(this.num2)
          break;
        case '-':
          sum = Number(this.num1) - Number(this.num2)
          break;
        case 'x':
          sum = Number(this.num1) * Number(this.num2)
          break;
        case '÷':
          sum = Number(this.num1) / Number(this.num2)
          break;

        default:
          break;
      }
      this.result = String(sum)
      return
    }
    if (data === 'AC') {
      this.num1 = this.num2 = this.fuhao = this.result = ''
      return
    }
    // if (data==='+' || data==='-') {
    if (['+','-','x','÷'].includes(data)) {
      this.fuhao = data
      return
    }
    if (this.fuhao) {
      this.num2 += data
    } else {
      this.num1 += data
    }
  }

  // button: string|number[] = [7,8,9,'+']
  // button: Array<string|number> = [7,8,9,'+']
  // button: Array<string|number> = [4,5,6,'-']
  // button: Array<string|number> = [1,2,3,'x']
  // button: Array<string|number> = [0,'AC','=','÷']

  // button: Array<原始类型>
  // button: Array<引用类型>
  button: Array<Array<string|number>> = [
    [7,8,9,'+'],
    [4,5,6,'-'],
    [1,2,3,'x'],
    [0,'AC','=','÷']
  ]

  build() {
    Column() {
      // 结果布局
      Column() {
        Text(`${this.num1}${this.fuhao}${this.num2}`).fontSize(80).fontColor(Color.White).width('100%').textAlign(TextAlign.End)
        Text(this.result).fontSize(80).fontColor(Color.White).width('100%').textAlign(TextAlign.End)
      }.width('100%').height('40%')
      // 结果布局 end

      // 计算器页面
      // Row() {
      //   Text('7').textStyle()
      //   Text('8').textStyle()
      //   Text('9').textStyle()
      //   Text('+').textStyle()
      // }.width('100%').height('15%')
      // 行
      ForEach(this.button, (item: Array<string|number>) => {
        Row() {
          ForEach(item, (item2: string|number, i2:number) => {
            // Text(String(item2)).textStyle()
            Text(item2.toString())
              .textStyle(i2===3)
              .onClick(() => this.onResult(item2.toString()))
              .stateStyles({
                pressed: {
                  .backgroundColor('#ccc')
                }
              })
          })
        }.width('100%').height('15%')
      })
      // 计算器页面 end
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Black)
    .padding(30)
  }
}
````



## 5.案例：待办列表

```
# 待办思路

一、布局
    Column
        Text待办标题
        Row
            TextInput
            Button
        Row  待办列表
            Checkbox
            Text 


二、声明状态、待办列表循环展示（记得加类型）

  @State todos: TodoType[] = [
    new TodoType('早起晨练', true),
    new TodoType('准备早餐', false),
    new TodoType('阅读名著', true),
    new TodoType('学习ArkTs', false),
    new TodoType('看剧轻松', false),
  ]

三、追加数据

- 3.1 声明content状态
- 3.2 给TextInput绑定值改变事件  保存content中
- 3.3 给Button绑定点击事件 push数据

四、给Checkbox绑定改变事件

Checkbox().select(item.finished).width(30).onChange((value:boolean) => {
    // item.finished = value
    // this.todos[i].finished = value    修改一维没有响应式效果
    // console.log(item.title, item.finished)
this.todos[i] = new TodoType(item.title, value)
})



```



> ![1574907594314](images/778b0338d5647d8a63c1fba676b00647.jpg)  

```javascript
class Todo {
  title: string
  finished: boolean

  constructor(title: string, finished: boolean) {
    this.title = title
    this.finished = finished
  }
}


@Entry
@Component
struct Index {
  @State todos: Todo[] = [
    new Todo('早起晨练', true),
    new Todo('准备早餐', false),
    new Todo('阅读名著', true),
    new Todo('学习ArkTs', false),
    new Todo('看剧轻松', false),
  ]
  @State task: string = ''

  build() {
    Column({ space: 15 }) {
      // 1.标题
      Text("待办")
        .width("100%")
        .fontSize(40)
        .fontWeight(700)
      // 2.输入框与按钮
      Row() {
        TextInput({ placeholder: "请输入内容", text: this.task })
          .backgroundColor(Color.White)
          .layoutWeight(1)
          .margin({ right: 10 })
          .borderRadius(5)
          .placeholderColor("#bebebe")
          .placeholderFont({ size: 20 })
          .onChange((value) => {
            this.task = value
          })

        Button("添加")
          .type(ButtonType.Normal)
          .onClick(() => {
            this.todos.push(new Todo(this.task, false))
            this.task = ''
          })
      }

      // 3.列表
      ForEach(this.todos, (item: Todo, index: number) => {
        Row() {
          Checkbox()
            .shape(CheckBoxShape.ROUNDED_SQUARE)
            .select(item.finished)
            .onChange((value) => {
              this.todos[index] = new Todo(item.title, value)
            })
          Text(item.title)
            .fontSize(28)
            .fontWeight(700)
            .margin({ left: 10 })
            .decoration({
              type: item.finished ?
              TextDecorationType.LineThrough : TextDecorationType.None,
              color: "#bebebe"
            })
            .fontColor(item.finished ? "#bebebe" : Color.Black)

        }
        .width("100%")
        .backgroundColor(Color.White)
        .padding(10)
        .borderRadius(5)
      })


    }.width("100%")
    .height("100%")
    .backgroundColor("#edf2f5")
    .padding(10)

  }
}
```



