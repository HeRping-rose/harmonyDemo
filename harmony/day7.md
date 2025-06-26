# 一、自定义构建函数

公共组件 - 大量   多个页面使用  增加代码复用     例如：TabBar  NavBar

逻辑组件 - 大量   仅自己使用  增加代码可读性

封装布局代码/build里面的代码  - 少量代码   （让build可读性更高）



## @Builder

> ArkUI还提供了一种更**轻量的UI元素复用机制** `@Builder`，可以将重复使用的UI元素抽象成一个方法，在 `build` 方法里调用。

项目开发中可以使用 `@Builder` 更轻量，`TabBar底部导航` 增加UI层代码可读性

<img src="http://tmp00002.learv.com/dbb767e098fcbfb3a5722ae4a85206bb.jpg" style="zoom:26%;float:left"/>  





















> 推荐名字用大驼峰  毕竟是封装组件

- 组件内部定义

```javascript
@Builder MyBuilderFunction(text:string) {  公共UI  }

build() {
	this.MyBuilderFunction('你好')
}
```

- 全局定义

```javascript
@Builder function yBuilderFunction(text:string) {  公共UI  }

build() {
	MyBuilderFunction('你好')
}
```

案例语法说明

````javascript
@Entry
@Component
struct Login {

  build() {
    Column({space:20}) {
      Text("登录页").fontSize(50)

      TextInput({placeholder:"请输入手机号"})

      Row(){
        TextInput({placeholder:"请输入手机号"}).layoutWeight(1)
        Button("输入验证码")
      }

      Button("登录").width("100%")
    }.width("100%").height("100%").padding(10)
  }
}
````

改造

```javascript

// 全局的
// @Builder function IptBuilder(number:number){
//   TextInput({placeholder:["请输入手机号","请输入验证码"][number]})
//     .layoutWeight(number)
// }

@Entry
@Component
struct Login {

  @Builder IptBuilder(number:number){
  TextInput({placeholder:["请输入手机号","请输入验证码"][number]})
    .layoutWeight(number)
  }

  build() {
    Column({space:20}) {
      Text("登录页").fontSize(50)

      this.IptBuilder(0)

      Row(){
        this.IptBuilder(1)
        Button("输入验证码")
      }

      Button("登录").width("100%")
    }.width("100%").height("100%").padding(10)
  }
}
```



## @Builder引用传递

调用@Builder装饰的函数默认按值传递。当传递的参数为状态变量时，状态变量的改变**不会引起@Builder方法内的UI刷新**。所以当使用状态变量的时候，推荐使用按引用传递。



- 引用传递定义

```
@Builder MyBuilderFunction(params: {text:string}) {  公共UI  }

build() {
	this.MyBuilderFunction( {text:this.state数据} )
}
```



- demo

```
@Entry
@Component
struct Index {
  // @Builder MyBuilderFunction(num:number) {
  //   Text('num：'+ num).fontSize(40)
  // }
  @Builder MyBuilderFunction(params:{num:number}) {
    Text('params.num：'+ params.num).fontSize(40)
  }

  @State num:number = 6

  build() {
    Column() {
      // this.MyBuilderFunction(this.num)
      this.MyBuilderFunction({num:this.num})

      Button('num++').onClick(() => {
        this.num++
      })
    }
  }
}
```

小结：

- 什么是@Builder函数：    用来复用UI层代码，增加代码可读性（封装build里面的代码的）
- @Builder和公共组件、逻辑组件对比怎么选

````
build代码  多个页面/组件 使用，例如tabBar、navBar   =》 公共组件来封装
build代码非常多，可读性差    =》  通过@Builder、逻辑组件来封装    怎么选

-  非常多或者有服务器请求  直接逻辑组件     
-  还好也没有服务器请求    @Builder     后面写多了你就明白了
````

- @Builder传参 ：支持的直接写就行 （留心：特殊场景下你要传递@State数据 一定要写对象格式）





## @BuilderParam 传递UI结构

针对于自定义公共组件，例如按钮、移动端导航栏站门实战除了要传递普通文本，还需要传递超文本Text、Image就需要通过`@BuilderParam`来实现



### 尾随闭包

- 语法

```javascript
@Component
struct QfButton {
  content: string
  @BuilderParam DefaultContent: () => void 

  build() {
      Row() {

        this.DefaultContent()
      	if (this.content) {
      		Text(this.content)
      	}     	
      }
  }
}


QfButton({content: '内容1'}) {
  内容2
}

// 在调用组件时，组件名称紧跟一个大括号“{}”形成尾随闭包场景（ CustomComponent(){}   ）
```



- 封装按钮公用组件

````javascript
//----------封装组件-----------------------------------------
@Component
export default struct QfButton {

  @Prop content:string = '按钮'
  // @BuilderParam  函数名:类型
  @BuilderParam DefaultContent: () => void
  build() {
    Row(){
      this.DefaultContent()
      Text(this.content) .fontColor(Color.White)
    } .width(100)
    .height(50)
    .backgroundColor(Color.Green)
    .borderRadius(25)
    .justifyContent(FlexAlign.Center)
  }
}

//-----------调用组件-----------------------------------------

import QfButton from '../components/QfButton'

@Entry
@Component
struct Page2 {
  build() {
    Column(){
      QfButton({content:'登录'}){
        Image('https://img0.baidu.com/it/u=2198412204,797257106&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500')
          .width(20)
          .height(20)
      }

      QfButton({content:'登录'}){}    //注意这里不写{}报错


    }
  }
}
````



### 尾随闭包初始化组件

````javascript
//----------封装组件-----------------------------------------
@Component
export default struct QfButton {

  @State content:string = '按钮'
  // @BuilderParam  函数名:类型
  //@BuilderParam DefaultContent: () => void = 函数(这个函数必须用@Builder修饰)
  @BuilderParam DefaultContent: () => void = this.DefaultContentInit
       
  @Builder DefaultContentInit(){
      //...
  }
        
  build() {
    Row(){
      this.DefaultContent()
      Text(this.content) .fontColor(Color.White)
    } .width(100)
    .height(50)
    .backgroundColor(Color.Green)
    .borderRadius(25)
    .justifyContent(FlexAlign.Center)
  }
}

//-----------调用组件-----------------------------------------

import QfButton from '../components/QfButton'

@Entry
@Component
struct Page2 {
  build() {
    Column(){
      QfButton({content:'登录'}){
        Image('https://img0.baidu.com/it/u=2198412204,797257106&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500')
          .width(20)
          .height(20)
      }

      QfButton({content:'登录'})     //如果这里不写{},要设置默认值

    }
  }
}
````

### 具名-多个UI

````javascript
//-------------以前的NavBar组件-------------------------
@Component
export default struct NavBar {

  @Prop title:string = "京东商城"
  @Prop left:string = ""
  @Prop right:string = ""


  build() {
    Row(){
      Text(this.left).fontColor(Color.White).fontSize(30)
      Text(this.title).fontColor(Color.White).fontSize(30)
      Text(this.right).fontColor(Color.White).fontSize(30)
    }
    .width("100%")
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.Black)
    .padding({
      left:10,
      right:10
    })
  }
}

//调用 
import NavBar from '../components/NavBar'
@Entry
@Component
struct Page2 {
  build() {
    Column(){
      NavBar()
    }

  }
}



//------------------------改造---------------------------------
@Component
export default struct NavBar {

  @Prop title:string = "京东商城"

  @Builder LeftBuilderParamInit(){ Text('') }
  @BuilderParam leftBuilderParam :()=>void = this.LeftBuilderParamInit

  @Builder RightBuilderParamInit(){ Text('') }
  @BuilderParam rightBuilderParam :()=>void = this.RightBuilderParamInit


  build() {
    Row(){
      this.leftBuilderParam()
      Text(this.title).fontColor(Color.White).fontSize(30)
      this.rightBuilderParam()
    }
    .width("100%")
    .height(60)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.Black)
    .padding({
      left:10,
      right:10
    })
  }
}


//调用
import NavBar from '../components/NavBar'

@Entry
@Component
struct Page2 {

  @Builder leftBuilderParam(){
    Text("<").fontColor(Color.White)
  }

  @Builder rightBuilderParam(){
    Image("https://img0.baidu.com/it/u=2373439078,310138119&fm=253&fmt=auto&app=138&f=JPEG?w=260&h=280").width(30).height(30)
  }

  build() {
    Column(){
      NavBar({
        leftBuilderParam:this.leftBuilderParam,
        title:'首页',
        rightBuilderParam:this.rightBuilderParam
      })
    }

  }
}

````



知识点总结



什么是@BuilderParams     传递内容（类似插槽），面试官-调用组件的时候可以写{}  然后通过@BuilderParams来接收

语法使用

- 尾随闭包   传递超文本

```
1、传递  组件名() {   内容  }
2、接收  @BuilderParam 名字: () => void
3、使用  this.名字()
```

- 默认值 

```
1、传递  组件名() {   内容  }
2、接收  @BuilderParam 名字: () => void =  this.名字InitBuilder        @Builder  名字InitBuilder() {}
3、使用  this.名字()
```

- 具名   多个超文本

```
1、传递  
	组件名({
			数据1：'你好'
			数据2： this.content
			数据3： this.contentBuilder            @Builder  名字InitBuilder() {}
			数据4： this.contentBuilder            @Builder  名字InitBuilder() {}
			数据5： this.contentBuilder            @Builder  名字InitBuilder() {}
	})
2、接收  
	@BuilderParam 名字: () => void =  this.名字InitBuilder        @Builder  名字InitBuilder() {}
	@BuilderParam 名字: () => void =  this.名字InitBuilder        @Builder  名字InitBuilder() {}
	@BuilderParam 名字: () => void =  this.名字InitBuilder        @Builder  名字InitBuilder() {}
3、使用  this.名字()
```



# 二、线性布局 Row/Column

线性布局（LinearLayout）是开发中最常用的布局，通过线性容器[Row]()和[Column]()构建。线性布局是其他布局的基础，其子元素在线性方向上（水平方向和垂直方向）依次排列。线性布局的排列方向由所选容器组件决定，Column容器内子元素按照垂直方向排列，Row容器内子元素按照水平方向排列。根据不同的排列方向，开发者可选择使用Row或Column容器创建线性布局。



## 子元素排列

<img src="http://tmp00002.learv.com/86ba2e977f677e9d60a8b429834a7752.jpg" style="zoom:50%;float:left"/>  



















Column：子元素在垂直方向依次排列

Row：子元素在水平方向依次排列

### Column

````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Column() {
      Text().boxStyle()
      Text().boxStyle()
      Text().boxStyle()
    }
  }
}

````



### Row

Row：子元素在水平方向依次排列

````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Row() {
      Text().boxStyle()
      Text().boxStyle()
      Text().boxStyle()
    }
  }
}

````



##  间距

> 在布局容器内，可以通过space属性设置排列方向上子元素的间距，使各子元素在排列方向上有等间距效果。

### Column

<img width="294" class="ne-image ne-image-preview" alt="image.png" draggable="true" src="https://cdn.nlark.com/yuque/0/2023/png/12928539/1701344538914-eac1589a-3120-4764-93b3-30453f663c7d.png?x-oss-process=image%2Fformat%2Cwebp"> 

````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Column({space: 100}) {
      Text().boxStyle()
      Text().boxStyle()
      Text().boxStyle()
    }
      .width('100%')
      .height('100%')
  }
}

````

### Row

<img width="328" class="ne-image ne-image-preview" alt="image.png" draggable="true" src="https://cdn.nlark.com/yuque/0/2023/png/12928539/1701344607169-d8d6fe4a-8f34-4f5a-b235-2e730c4edaac.png?x-oss-process=image%2Fformat%2Cwebp"> 

````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Row({space: 40}) {
      Text().boxStyle()
      Text().boxStyle()
      Text().boxStyle()
    }
      .width('100%')
      .height('100%')
  }
}

````





## Row子元素排列对齐方式

> ​    主轴：子元素默认排列方向就是主轴，Column主轴为垂直方向。Row主轴为水平方向
>
> 交叉轴：垂直于主轴方向的轴线。Row容器交叉轴为垂直方向，Column容器交叉轴为水平方向。



### 主轴/水平方向上的排列 

<img src="http://tmp00002.learv.com/9baaef9c40731a85680eff703bf6f6cc.jpg" style="zoom:70%;float:left"/> 





  







````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  // .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Row() {
      Text().boxStyle()
      Text().boxStyle().alignSelf(ItemAlign.Center)  // 留心1：使用alignSelf设置单个元素
      Text().boxStyle()
    }
    	// 留心2：必须设置宽度高度
      .width('100%')
      .height('100%')
      .backgroundColor('black')
      // .justifyContent(FlexAlign.Start)
      // .justifyContent(FlexAlign.Center)
      // .justifyContent(FlexAlign.End)
      // .justifyContent(FlexAlign.SpaceBetween)
      // .justifyContent(FlexAlign.SpaceAround) // 元素之间的距离比两侧大一倍
      .justifyContent(FlexAlign.SpaceEvenly)  // 元素之间平均分配
      // .alignItems(VerticalAlign.Top)
      // .alignItems(VerticalAlign.Center)
      .alignItems(VerticalAlign.Bottom)
  }
}

````



### 交叉轴/垂直方向上的排列

<img src="http://tmp00002.learv.com/d665ef9ecb9456edb583f81bd2e7d6e4.jpg" style="zoom:70%;float:left"/>

````
@Styles function blockStyle() {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
}


@Entry
@Component
struct LearnCol {
  build() {
    Row({space: 20}) {
      Column() {
      }.blockStyle()

      Column() {
      }.blockStyle()

      Column() {
      }.blockStyle()
      /**
       * 使用alignItems设置水平方向为竖向
       * 使用不同的枚举切换不同的对齐方式
       * 注意设置高度
       */
    }.height('100%').alignItems(VerticalAlign.Bottom).backgroundColor('rgb(242,242,242)')
  }
}
````





## Column 子元素排列对齐方式 

> ​    主轴：子元素默认排列方向就是主轴，Column主轴为垂直方向。Row主轴为水平方向
>
> 交叉轴：垂直于主轴方向的轴线。Row容器交叉轴为垂直方向，Column容器交叉轴为水平方向。



### 主轴/垂直方向上的排列 

<img src="http://tmp00002.learv.com/614c0ad0e82962196e9bdd49dd079543.jpg" style="zoom:60%;float:left"/>  























````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  // .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Column() {
      Text().boxStyle()
      Text().boxStyle().alignSelf(ItemAlign.End)
      Text().boxStyle()
    }
      .width('100%')
      .height('100%')
      .backgroundColor('black')
      // .justifyContent(FlexAlign.Start)
      // .justifyContent(FlexAlign.Center)
      // .justifyContent(FlexAlign.End)
      // .justifyContent(FlexAlign.SpaceBetween)
      // .justifyContent(FlexAlign.SpaceAround) // 元素之间的距离比两侧大一倍
      // .justifyContent(FlexAlign.SpaceEvenly)  // 元素之间平均分配
      // .alignItems(HorizontalAlign.Start)
      .alignItems(HorizontalAlign.Center)
      // .alignItems(HorizontalAlign.End)
  }
}

````



### 交叉轴/水平方向上的排列

<img src="http://tmp00002.learv.com/dc14dd14cf9066a6fd06348e47240247.jpg" style="zoom:100%;float:left"/>  

















````
@Styles function boxStyle () {
  .width(50)
  .height(50)
  .backgroundColor(Color.Red)
  // .margin(20)
}

@Entry
@Component
struct Index {

  build() {
    Column() {
      Text().boxStyle()
      Text().boxStyle().alignSelf(ItemAlign.End)
      Text().boxStyle()
    }
      .width('100%')
      .height('100%')
      .backgroundColor('black')
      // .justifyContent(FlexAlign.Start)
      // .justifyContent(FlexAlign.Center)
      // .justifyContent(FlexAlign.End)
      // .justifyContent(FlexAlign.SpaceBetween)
      // .justifyContent(FlexAlign.SpaceAround) // 元素之间的距离比两侧大一倍
      // .justifyContent(FlexAlign.SpaceEvenly)  // 元素之间平均分配
      // .alignItems(HorizontalAlign.Start)
      .alignItems(HorizontalAlign.Center)
      // .alignItems(HorizontalAlign.End)
  }
}

````





## NavBar场景

```
@Entry
@Component
struct Index {
  build() {
    Column() {
      Row() {
        Button('返回')
        Button('搜索')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Button('返回')
        Text('标题')
        Button('搜索')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Button('返回')
        Blank() //  空白填充
        Text('标题')
        Blank() //  空白填充
        // Blank() //  空白填充
        Button('搜索')
      }
      .width('100%')
    }
      .width('100%')
      .height('100%')
  }
}
```





## 自适应伸缩 

自适应缩放是指子组件随容器尺寸的变化而按照预设的比例自动调整尺寸，适应各种不同大小的设备。在线性布局中，可以使用以下两种方法实现自适应缩放

- 父容器尺寸确定时，使用百分比设置子组件和兄弟元素的宽度，使他们在任意尺寸的设备下保持固定的自适应占比。

> 4个元素、2个元素都挺好
>
> 当3个 或者 要margin、border时候  不太方便  或者就是 登录  写了文字 

- 父容器尺寸确定时，使用layoutWeight属性设置子组件和兄弟元素在主轴上的权重，忽略元素本身尺寸设置，使它们在任意尺寸的设备下自适应占满剩余空间

> 主轴：子元素 默认排列方向 就是主轴

```
@Entry
@Component
struct Index {
  build() {
    Column() {
      Row({space: 0}) {
        Text('数据1').width('25%').height(50).backgroundColor('black').fontColor('#fff')
        Text('数据2').width('25%').height(50).backgroundColor('black').fontColor('#fff')
        Text('数据3').width('25%').height(50).backgroundColor('black').fontColor('#fff')
        Text('数据4').width('25%').height(50).backgroundColor('black').fontColor('#fff')
      }

      Row({space: 20}) {
        Text('数据1').width('25%').height(50).backgroundColor('black').fontColor('#fff')
        Text('数据2').width('25%').height(50).backgroundColor('black').fontColor('#fff')
        Text('数据3').width('25%').height(50).backgroundColor('black').fontColor('#fff')
        Text('数据4').width('25%').height(50).backgroundColor('black').fontColor('#fff')
      }


      // 使用layoutWeight属性设置子组件和兄弟元素在主轴上的权重，忽略元素本身尺寸设置，使它们在任意尺寸的设备下自适应占满剩余空间
      Row({space: 10}) {
        Text('数据1').layoutWeight(1).backgroundColor('black').fontColor('#fff')
        Text('数据2').layoutWeight(1).backgroundColor('black').fontColor('#fff')
        Text('数据3').layoutWeight(1).backgroundColor('black').fontColor('#fff')
        Text('数据4').layoutWeight(1).backgroundColor('black').fontColor('#fff')
      }
    }
      .width('100%')
      .height('100%')
  }
}
```



```
@Entry
@Component
struct Index {
  build() {
    Row() {
      Text('手机号').margin({right:10})
      TextInput({placeholder:'请输入手机号'}).layoutWeight(1)
    }
      .padding(30)
  }
}
```





# 三、弹性布局 Flex

弹性布局Flex 提供更加有效的方式对容器中的子元素进行排列、对齐和分配剩余空间。容器默认存在主轴与交叉轴，子元素默认沿主轴排列，子元素在主轴方向的尺寸称为主轴尺寸，在交叉轴方向的尺寸称为交叉轴尺寸。弹性布局在开发场景中用例特别多，比如页面头部导航栏的均匀分布、页面框架的搭建、多行数据的排列等等。 

<img width="512" class="ne-image ne-image-preview" alt="image.png" draggable="true" src="https://cdn.nlark.com/yuque/0/2023/png/12928539/1701697088925-c453b9a2-dcd0-4aba-a059-2e65ac560ea9.png?x-oss-process=image%2Fformat%2Cwebp">  

1、改主轴 Row\Column

2、控制子元素换行、放大类似于layoutWeight、缩小等等



## 主轴对齐方式

通过justifyContent参数设置在主轴方向的对齐方式。

- 1. FlexAlign.Start

子组件在主轴方向起始端对齐， 第一个子组件与父元素边沿对齐，其他元素与前一个元素对齐。

- 2. FlexAlign.Center

子组件在主轴方向居中对齐

- 3. FlexAlign.End

子组件在主轴方向终点端对齐, 最后一个子组件与父元素边沿对齐，其他元素与后一个元素对齐。

- 4. FlexAlign.SpaceBetween

Flex主轴方向均匀分配弹性元素，相邻子组件之间距离相同。第一个子组件和最后一个子组件与父元素边沿对齐

- 5. FlexAlign.SpaceAround

Flex主轴方向均匀分配弹性元素，相邻子组件之间距离相同。第一个子组件到主轴起始端的距离和最后一个子组件到主轴终点端的距离是相邻元素之间距离的一半

- 6. FlexAlign.SpaceEvenly

Flex主轴方向元素等间距布局，相邻子组件之间的间距、第一个子组件与主轴起始端的间距、最后一个子组件到主轴终点端的间距均相等

```javascript
@Entry
@Component
struct Index {
  build() {
    Flex({
      // justifyContent: FlexAlign.Start,
      justifyContent: FlexAlign.Center,
      // justifyContent: FlexAlign.End,
      // justifyContent: FlexAlign.SpaceBetween,
      // justifyContent: FlexAlign.SpaceEvenly,
      // justifyContent: FlexAlign.SpaceAround,

      direction: FlexDirection.Column,  // Flex默认类似Row 水平方/主轴， 通过direction属性修改Column  垂直/交叉轴方向上的排列
    }) {
        Text("11").width(50).height(50).backgroundColor('green')
        Text("22").width(50).height(50).backgroundColor('red')
        Text("33").width(50).height(50).backgroundColor('blue')
    }
      .width('100%')
      .height(300)
      .backgroundColor('#ccc')
  }
}
```



## 交叉轴对齐方式

可以通过Flex组件的alignItems参数设置子组件在交叉轴的对齐方式。容器和子元素都可以设置交叉轴对齐方式，且子元素设置的对齐方式优先级较高。

- 1. ItemAlign.Auto

使用Flex容器中默认配置

- 2. ItemAlign.Start

交叉轴方向首部对齐

- 3. ItemAlign.Center

交叉轴方向居中对齐

- 4. ItemAlign.End

交叉轴方向底部对齐

- 5. ItemAlign.Stretch

交叉轴方向拉伸填充，在未设置尺寸时，拉伸到容器尺寸

```javascript
@Entry
@Component
struct Index {
  build() {
    Flex({
      // justifyContent: FlexAlign.Start,
      justifyContent: FlexAlign.Center,
      // justifyContent: FlexAlign.End,
      // justifyContent: FlexAlign.SpaceBetween,
      // justifyContent: FlexAlign.SpaceEvenly,
      // justifyContent: FlexAlign.SpaceAround,

      direction: FlexDirection.Column,  // Flex默认类似Row 水平方/主轴， 通过direction属性修改Column  垂直/交叉轴方向上的排列

      alignItems: ItemAlign.End
    }) {
        Text("11").width(50).height(50).backgroundColor('green')
        Text("22").width(50).height(50).backgroundColor('red')
        Text("33").width(50).height(50).backgroundColor('blue')
    }
      .width('100%')
      .height(300)
      .backgroundColor('#ccc')
  }
}
```





## alignSelf

```javascript
@Entry
@Component
struct Index {
  build() {
    Flex({
      // justifyContent: FlexAlign.Start,
      justifyContent: FlexAlign.Center,
      // justifyContent: FlexAlign.End,
      // justifyContent: FlexAlign.SpaceBetween,
      // justifyContent: FlexAlign.SpaceEvenly,
      // justifyContent: FlexAlign.SpaceAround,

      direction: FlexDirection.Column,  // Flex默认类似Row 水平方/主轴， 通过direction属性修改Column  垂直/交叉轴方向上的排列

      alignItems: ItemAlign.End
    }) {
        Text("11").width(50).height(50).backgroundColor('green')
        Text("22").width(50).height(50).backgroundColor('red').alignSelf(ItemAlign.Center)
        Text("33").width(50).height(50).backgroundColor('blue').alignSelf(ItemAlign.Start)
    }
      .width('100%')
      .height(300)
      .backgroundColor('#ccc')
  }
}
```





## wrap

```javascript
@Entry
@Component
struct Index {
  build() {
    // 默认主轴水平方向上的排列  写再多也非得挤压一行显示， 如果实现超出自动折行
    Flex({
      wrap: FlexWrap.Wrap
    }) {
        Text("11").width('50%').height(50).backgroundColor('green')
        Text("22").width('50%').height(50).backgroundColor('red')
        Text("33").width('50%').height(50).backgroundColor('blue')
    }
      .width('100%')
      .height(300)
      .backgroundColor('#ccc')
  }
}
```



## 骰子的布局

<img src="https://img0.baidu.com/it/u=112570083,3665288797&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=281" /> 

### 1点

```
@Entry
@Component
struct Index {
  build() {
    Flex({
      justifyContent: FlexAlign.Center,
      alignItems:ItemAlign.Center
    }) {
      Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
    }
    .width(100)
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor('#ccc')
  }
}
```

### 2点

````
@Entry
@Component
struct Index {
  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Text().width(20).height(20).borderRadius(10).backgroundColor('#000').alignSelf(ItemAlign.End)
      Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
    }
    .width(100)
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor('#ccc')
  }
}
````

### 3点

```
@Entry
@Component
struct Index {
  build() {
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      Text().width(20).height(20).borderRadius(10).backgroundColor('#000').alignSelf(ItemAlign.End)
      Text().width(20).height(20).borderRadius(10).backgroundColor('#000').alignSelf(ItemAlign.Center)
      Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
    }
    .width(100)
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor('#ccc')
  }
}
```

### 4点

```
@Entry
@Component
struct Index {
  build() {
    Flex({
      justifyContent:FlexAlign.SpaceBetween
    }) {
      Column() {
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
        .height('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      Column() {
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width(100)
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor('#ccc')
  }
}
```



### 5点

````
@Entry
@Component
struct Index {
  build() {
    Flex({
      justifyContent:FlexAlign.SpaceBetween
    }) {
      Column() {
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
        .height('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      Column() {
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
      .height('100%')
      .justifyContent(FlexAlign.Center)
      Column() {
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width(100)
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor('#ccc')
  }
}
````





### 6点

````
@Entry
@Component
struct Index {
  build() {
    Flex({
      justifyContent:FlexAlign.SpaceBetween
    }) {
      Column() {
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
       Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
        .height('100%')
        .justifyContent(FlexAlign.SpaceBetween)
      Column() {
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
        Text().width(20).height(20).borderRadius(10).backgroundColor('#000')
      }
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width(100)
    .height(100)
    .borderRadius(10)
    .padding(10)
    .backgroundColor('#ccc')
  }
}
````



## 自适应拉伸

在弹性布局父组件尺寸不够大的时候，通过子组件的下面几个属性设置其在父容器的占比，达到自适应布局能力。

### flex-grow 

扩大     默认0   1等分剩余空间  2比其他等分大一倍

```
@Entry
@Component
struct Index {
  build() {
    Flex({}) {
       Text().width(50).height(50).backgroundColor('green').flexGrow(0)
       Text().width(50).height(50).backgroundColor('red').flexGrow(1)
       Text().width(50).height(50).backgroundColor('blue').flexGrow(2)
    }
    .width('100%')
    .height(300)
    .backgroundColor('#ccc')
  }
}
```



### flex-shrink 

收缩   默认1 空间不足该项目缩小  0则不缩小    

````
@Entry
@Component
struct Index {
  build() {
    Flex({}) {
      Text().width('50%').height(50).backgroundColor('green')
      Text().width('50%').height(50).backgroundColor('red')
      Text().width('50%').height(50).backgroundColor('blue').flexShrink(0)
    }
    .width('100%')
    .height(300)
    .backgroundColor('#ccc')
  }
}
````



# 四、层叠布局 Stack

层叠布局（StackLayout）用于在屏幕上预留一块区域来显示组件中的元素，提供元素可以重叠的布局。层叠布局通过Stack容器组件实现位置的固定定位与层叠，容器中的子元素（子组件）依次入栈，**后一个子元素覆盖前一个子元素，子元素可以叠加，也可以设置位置。**

```
Column(){
  Stack({ }) {
    Column(){}.width('90%').height('100%').backgroundColor('#ff58b87c')
    Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
    Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000')
    // Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')  会覆盖Button
  }.width('100%').height(150).margin({ top: 50 })
}
```



## zIndex

Stack容器中兄弟组件显示层级关系可以通过Z序控制的zIndex属性改变。zIndex值越大，显示层级越高，即zIndex值大的组件会覆盖在zIndex值小的组件上方。一般来说组件的默认层级都是1，可以直接使用一些交大的数去尝试改变层级。类似前端的z-index属性。

> 注意：

> 在层叠布局中，如果后面子元素尺寸大于前面子元素尺寸，则前面子元素完全隐藏

```javascript
Column(){
    Stack({ }) {
        Column(){}.width('90%').height('100%').backgroundColor('#ff58b87c')
        // Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
        Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000').zIndex(2)
        Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')  // 会覆盖Button
    }.width('100%').height(150).margin({ top: 50 })
}
```





## 对齐方式

Stack组件通过alignContent参数实现所有子元还给位置的相对移动

```javascript
@Entry
@Component
struct Index {
  build() {
    Column(){
      // Stack({ alignContent: Alignment.Start }) {
      // Stack({ alignContent: Alignment.Center }) {
      // Stack({ alignContent: Alignment.End }) {
      // Stack({ alignContent: Alignment.BottomStart }) {
      // Stack({ alignContent: Alignment.Bottom }) {
      Stack({ alignContent: Alignment.BottomEnd }) {
        Column(){}.width('90%').height('100%').backgroundColor('#ff58b87c')
        // Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
        Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000').zIndex(2)
        Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')  // 会覆盖Button
      }.width('100%').height(150).margin({ top: 50 })
    }
  }
}
```



## offset

可以使用offset调整单个元素位置

````javascript
@Entry
@Component
struct Index {
  build() {
    Column(){
      Stack({ alignContent: Alignment.BottomEnd }) {
        Column(){}.width('90%').height('100%').backgroundColor('#ff58b87c')
        // Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
        Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000').zIndex(2).offset({x: -10, y: -20})
        Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')  // 会覆盖Button
      }.width('100%').height(150).margin({ top: 50 })
    }
  }
}
````



## 返回顶部场景  

````javascript
@Entry
@Component
struct Page2 {

  private scorller:Scroller = new Scroller()


  build() {
    Stack({
      alignContent:Alignment.BottomEnd
    }){
      Button("回到顶部").width(100).height(100).backgroundColor(Color.Orange).zIndex(1).offset({x:-10,y:-10}).onClick(()=>{
        this.scorller.scrollTo({
          xOffset:0,
          yOffset:0,
          animation:true
        })
      })

      List({scroller:this.scorller}){
        ForEach("1234567890123456789666".split(""),(item:string)=>{
          ListItem(){
            Text(item).fontSize(40).width("100%").height(70).backgroundColor(Color.Black).fontColor(Color.White)
          }.margin({bottom:10})
        })
      }



    }
    .width("100%")
    .height("100%")

  }
}
````





# 五、栅格布局 GridRow/GridCol

更方便的实现多列布局，在更宽的屏幕上显示更多的列数，咱们可以根据屏幕尺寸动态布局 

https://image.baidu.com/search/index?tn=baiduimage&ps=1&ct=201326592&lm=-1&cl=2&nc=1&ie=utf-8&dyTabStr=MCwzLDIsMSw4LDQsNiw1LDcsOQ%3D%3D&word=%E6%A0%85%E6%A0%BC 



https://www.pearvideo.com/category_1

 

栅格布局是一种通用的辅助定位工具，对移动设备的界面设计有较好的借鉴作用。主要优势包括：

1. 提供可循的规律：栅格布局可以为布局提供规律性的结构，解决多尺寸多设备的动态布局问题。通过将页面划分为等宽的列数和行数，可以方便地对页面元素进行定位和排版。
2. 统一的定位标注：栅格布局可以为系统提供一种统一的定位标注，保证不同设备上各个模块的布局一致性。这可以减少设计和开发的复杂度，提高工作效率。
3. 灵活的间距调整方法：栅格布局可以提供一种灵活的间距调整方法，满足特殊场景布局调整的需求。通过调整列与列之间和行与行之间的间距，可以控制整个页面的排版效果。
4. 自动换行和自适应：栅格布局可以完成一对多布局的自动换行和自适应。当页面元素的数量超出了一行或一列的容量时，他们会自动换到下一行或下一列，并且在不同的设备上自适应排版，使得页面布局更加灵活和适应性强。





## 设备尺寸范围

栅格系统默认断点将设备宽度分为xs、sm、md、lg四类，尺寸范围如下：

| 断点名称 | 取值范围（vp） | 设备描述           |
| -------- | -------------- | ------------------ |
| xs       | [0, 320）      | 最小宽度类型设备。 |
| sm       | [320, 520)     | 小宽度类型设备。   |
| md       | [520, 840)     | 中等宽度类型设备。 |
| lg       | [840, +∞)      | 大宽度类型设备。   |



在GridRow栅格组件中，允许开发者使用breakpoints自定义修改断点的取值范围，最多支持6个断点，除了默认的四个断点外，还可以启用xl，xxl两个断点，支持六种不同尺寸（xs, sm, md, lg, xl, xxl）设备的布局设置。

| 断点名称 | 设备描述           |
| -------- | ------------------ |
| xs       | 最小宽度类型设备。 |
| sm       | 小宽度类型设备。   |
| md       | 中等宽度类型设备。 |
| lg       | 大宽度类型设备。   |
| xl       | 特大宽度类型设备。 |
| xxl      | 超大宽度类型设备。 |



屏幕分成12个栅格    一行12个栅格

12     一行1个

6   6   一行2个

4  4 4   一行3个

2 2 2 2 2 2 一行6



````
@Entry
@Component
struct Index {

  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];

  build() {

    // Column() {
    //   ForEach(
    //     this.bgColors,
    //     (item: Color, i:number) => {
    //       Text(String(i)).width('100%').height(50).backgroundColor(item)
    //     }
    //   )
    // }


    // 栅格布局  一行12个栅格
    GridRow() {
      ForEach(
        this.bgColors,
        (item: Color, i:number) => {
          GridCol({
            span: {
              xs: 12,  //  最小屏，每个元素 占12个栅格，也就是一行1个
              sm: 6,  //  小屏设备，每个元素 占6个栅格，也就是一行2个
              md: 4,  //  中屏设备，每个元素 占4个栅格，也就是一行3个,
              lg: 2,  //  大屏设备，每个元素 占2个栅格，也就是一行6个,
            }
          }) {
            Text(String(i+1)).width('100%').height(50).backgroundColor(item)
          }
        }
      )
    }


  }
}
````



## 自定义尺寸范围

```
@Entry
@Component
struct Index {

  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];

  build() {
    // xs 最小  <200
    // sm 小    200~300之间
    // md 中    300~400之间
    // lg 大    400~500之间
    // xl 特大  大于500
    // xxl 超大 大于500  
    GridRow({
      breakpoints: {value: ['200vp', '300vp', '400vp']}
    }) {
      ForEach(this.bgColors, (color, index) => {
        GridCol({
          span: {
            xs: 12, // 在最小宽度类型设备上，栅格占12列 也就是一个栅格一行
            sm: 6, // 在小宽度类型设备上，栅格占6列 也就是二个栅格一行
            md: 4, // 在中等宽度类型设备上，栅格占4列 也就是三个栅格一行
            lg: 2, // 在大宽度类型设备上，栅格占2列 也就是六个栅格一行
          }
        }) {
          Row() {
            Text(`${index}`)
          }.width("100%").height(50)
        }.backgroundColor(color)
      })
    }
  }
}
```



## 间距

gutter

```
 GridRow({ gutter: 10 }){}
 GridRow({ gutter: { x: 20, y: 50 } }){}
```



## 梨视频案例：

```javascript
@Entry
@Component
struct Index {
  @State bgColors: Color[] = [Color.Red, Color.Orange, Color.Yellow, Color.Green, Color.Pink, Color.Grey, Color.Blue, Color.Brown];

  build() {
     // 需求：最小屏幕xs-1/行，sm小-2/行，md中-3/行

    GridRow(){
      ForEach(
        this.bgColors,
        (item:Color,i:number) => {
          GridCol({
            span: {
              xs: 12,
              sm: 6,
              md: 4,
            }
          }) {
            Text(String(i+1))
          }
          .width('100%')
          .height(100)
          .backgroundColor(item)
        }
      )
    }


  }
}
```



# 六、网格布局 Grid

网格布局是由“行”和“列”分割的单元格所组成，通过指定“项目”所在的单元格做出各种各样的布局。网格布局具有较强的页面均分能力，子组件占比控制能力，是一种重要自适应布局，其使用场景有九宫格图片展示、日历、计算器等。

<img originheight="778" originwidth="627" src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20231121183852.75534080997090101453601173782938:50001231000000:2800:792F9AB0800C826E903DF641CA1DB79809DAB5FFB9E0234F818968028617C045.png?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true" title="点击放大" width="427" height="378">      



https://www.pearvideo.com/ 

https://www.bilibili.com/ 

https://m.ctrip.com/html5/ 



网格布局是将页面中的元素划分成一个个小格子，然后控制小格子进行合并 

<img originheight="465" originwidth="2025" src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20231121183852.89903509019269690386990147418336:50001231000000:2800:EF1D47CF147D5862D2B384210F38F264AB94CCEA0BE10DA0154C9FFD1AAAC935.png?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true" title="点击放大" width="896" height="205.74814814814815">   



## 设置行列数量与占比

通过设置行列数量与尺寸占比可以确定网格布局的整体排列方式。Grid组件提供了rowsTemplate和columnsTemplate属性用于设置网格布局行列数量与尺寸占比。

rowsTemplate和columnsTemplate属性值是一个由多个空格和'数字+fr'间隔拼接的字符串，fr的个数即网格布局的行或列数，fr前面的数值大小，用于计算该行或列在网格布局宽度上的占比，最终决定该行或列的宽度。

<img originheight="430" originwidth="569" src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20231121183852.04327925987458971666528865187345:50001231000000:2800:E55F6F6727F1DC8D505DFD9E31C0FFEA0BA776B3C6CD485D8917460CD008D69E.png?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true" title="点击放大" width="569" height="430"> 

```
Grid() {
  ...
}
.rowsTemplate('1fr 1fr 1fr')
.columnsTemplate('1fr 2fr 1fr')
```

- demo 

```
@Entry
@Component
struct Index {

  @Styles style() {
    .backgroundColor(Color.Red)
  }

  build() {
    Grid() {
      GridItem().style()
      GridItem().style()
      GridItem().style()
      GridItem().style()
      GridItem().style()
      GridItem().style()
    }
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
      .height(200)
      .rowsTemplate('1fr 1fr')
      .columnsTemplate('1fr 2fr 1fr')
  }
}
```



## 设置子组件所占行列数

````
GridItem() {
  Text(key)
    ...
}
.columnStart(1)
.columnEnd(2)


GridItem() {
  Text(key)
    ...
}
.rowStart(5)
.rowEnd(6)
````

- demo

````
@Entry
@Component
struct Index {

  @Styles style() {
    .backgroundColor(Color.Red)
  }

  build() {
    Grid() {
      GridItem(){
        Text('1').fontSize(40)
      }.style()
        .columnStart(1)
        .columnEnd(2)
      GridItem() {
        Text('2').fontSize(40)
      }.style()
      GridItem() {
        Text('3').fontSize(40)
      }.style()
      GridItem() {
        Text('4').fontSize(40)
      }.style()
        .columnStart(1)
        .columnEnd(2)
        .rowStart(1)
        .rowEnd(2)
      GridItem() {
        Text('5').fontSize(40)
      }.style()
      // GridItem() {
      //   Text('6').fontSize(40)
      // }.style()
      // GridItem() {
      //   Text('7').fontSize(40)
      // }.style()
      // GridItem() {
      //   Text('8').fontSize(40)
      // }.style()
      // GridItem() {
      //   Text('9').fontSize(40)
      // }.style()
    }
      .rowsGap(10)
      .columnsGap(10)
      .width('100%')
      .height(300)
      .rowsTemplate('1fr 1fr 1fr')
      .columnsTemplate('1fr 1fr 1fr')
  }
}
````



## 计算器

例如计算器的按键布局就是常见的不均匀网格布局场景。如下图，计算器中的按键“0”和“=”，按键“0”横跨第一、二两列，按键“=”横跨第五、六两行。使用Grid构建的网格布局，其行列标号从1开始，依次编号。 

<img originheight="500" originwidth="394" src="https://alliance-communityfile-drcn.dbankcdn.com/FileServer/getFile/cmtyPub/011/111/111/0000000000011111111.20231121183852.96743220453375348691778926410350:50001231000000:2800:72F02A9B70149EFFD0CFC33EC2BEF8D6AB5108E89BFE0B159B9F200C919E9EFC.png?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true?needInitFileName=true" title="点击放大" width="394" height="500">   



````javascript
@Entry
@Component
struct Index {
  @State box: Array<string | number> = [
    0,
    'CE', 'C', '/', 'X',
    7, 8, 9, '-',
    4, 5, 6, '+',
    1, 2, 3, '=',
    0, '.',
  ]

  build() {
    Grid() {
      ForEach(this.box, (item: string | number, index: number) => {

        if (index === 0) {
          GridItem() {
            Text(item.toString()).width("100%").fontSize(40).textAlign(TextAlign.End)
          }.backgroundColor("#b2b1b6")
          .columnStart(1)
          .columnEnd(4)
          .borderRadius(15)

          // .borderRadius(20)

        } else if (index === 16) {
          GridItem() {
            Text(item.toString())
          }.backgroundColor("#b2b1b6")
          .rowStart(1)
          .rowEnd(2)
          .borderRadius(15)
        } else if (index === 17) {
          GridItem() {
            Text(item.toString())
          }.backgroundColor("#b2b1b6")
          .columnStart(1)
          .columnEnd(2)
          .borderRadius(15)
        } else {
          GridItem() {
            Text(item.toString())
          }.backgroundColor("#b2b1b6")
          .borderRadius(15)
        }


      })

    }
    .width("100%")
    .height("100%")
    .backgroundColor("#e3e3e5")
    .rowsTemplate("2fr 1fr 1fr 1fr 1fr 1fr")
    .columnsTemplate("1fr ".repeat(4))
    .rowsGap(10)
    .columnsGap(10)
  }
}
````





# 七、内置组件

下拉Refresh    https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-refresh-0000001478181429-V2
Scroll  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-scroll-0000001427902480-V2
swiper  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-swiper-0000001427744844-V2
tabs https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-tabs-0000001478181433-V2
tabsContent  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-tabcontent-0000001478341169-V2
WaterFlow  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-waterflow-0000001582933637-V2
AlphabetIndexer 字母索引  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-alphabet-indexer-0000001427744828-V2
DatePicker https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-basic-components-datepicker-0000001478061689-V2



LoadingProgress  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-basic-components-loadingprogress-0000001427744812-V2
气泡  https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/arkts-popup-and-menu-components-popup-0000001500753909-V2
菜单 https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/arkts-popup-and-menu-components-menu-0000001451074026-V2



badge  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-badge-0000001478181417-V2
ColumnSplit  https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-columnsplit-0000001478061709-V2
RowSplit https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V2/ts-container-rowsplit-0000001477981217-V2