# 昨日回顾

```javascript
1.组件化思想：页面结构封装起来，方便复用

​	使用：导入与导出

​	组件分类：公共组件与页面组件



2.组件传值

2.1.父子单向

  父怎么传： Son({自定义属性名：要传的值})

  子怎么收：@Prop  自定义属性名:类型 = “可以设置默认值"

  子组件可不可以修改父传的值? 可以改   父组件数据没有同步



2.2.父子双向

     父怎么传： Son({自定义属性名：要传的值})

     子怎么收：@Link 自定义属性名:类型      (不能设置默认值)

     子组件可不可以修改父传的值? 可以   父组件数据同步



2.3.跨层级组件传值

    祖先：提供数据    @Provide  数据变量名：类型 = 值

    后代：消费数据    @Consume  数据变量名：类型          (不能设置默认值)

    后代组件可不可以修改祖先传的值?   可以   祖先组件数据同步



3.@State加强

@State做什么：实现数据与UI层（视图）响应式

private 数值：类型 = 值   1.UI层可以显示  ，但是数据发生了变化，UI层没有同步的

@State content= ”发送验证码“      
private  timer = 0         
@State   time=60             
private  disabled = true



@State: 基本数据   => 同步UI层

@State: 复杂数据   数组或对象 只有一层  =>  同步UI层

@State: 复杂数据   数组或对象有嵌套  =>  修改嵌套数据  （数据变化  没有同步UI层）



4.分支与循环

    4.1 if/else if/else 

    4.2 ForEach(数据源，（）=>{},)


```



| 修饰符      | 支持                                              | 默认值 | 响应式 | 双向 | **场景**             |
| ----------- | ------------------------------------------------- | ------ | ------ | ---- | -------------------- |
| 不写        | 都支持                                            | 可以   | /      | /    | 不推荐               |
| @Prop       | old - 仅支持 number/string/boolean 、现在：都支持 | 可以   | 有     | /    | 父传子单向           |
| @Link       | 通@Prop                                           | 没有   | 有     | 有   | 子修改父             |
| @Consume    | 都支持                                            | 没有   | 有     | 有   | 多层级               |
| @ObjectLink | 仅支持 对象类型                                   | 没有   | 有     | 有   | 引用类型对象不响应式 |



# 一.@ObjectLink与@Observerd

@ObjectLink    和    @Observed类装饰器    用于在涉及嵌套   对象和数组     的场景中进行双向数据同步

- 被@Observed修饰的类，可以被观察到属性的变化
- 子组件中通过@ObjectLink装饰器装饰的状态变量用于接收@Observed装饰的类的实例

```javascript
@Observed
class Person {
  name: string
  money: number

  constructor(name: string, money: number) {
    this.name = name
    this.money = money
  }
}


@Component
struct Son {
  @ObjectLink item: Person

  build() {
    Row() {
      Text(this.item.name)
      Text(this.item.money.toString())
      Button("花钱")
        .width(50)
        .height(30)
        .onClick(() => {
          this.item.money--
        })
    }
  }
}

@Entry
@Component
struct Index {
  @State person: Person[] = [
    new Person('jack', 1000),
    new Person('rose', 1000)
  ]

  build() {
    Column() {
      Row() {
        Text("姓名")
        Text("存款")
        Text("操作")
      }

      ForEach(this.person, (item: Person, index: number) => {
        Son({ item: item })
      })

    }
  }
}
```



# 二.@Watch

> @Watch用于监听状态变量的变化，当状态变量变化时，@Watch的回调方法将被调用。@Watch在ArkUI框架内部判断数值有无更新使用的是严格相等（===），遵循严格相等规范。当在严格相等为false的情况下，就会触发@Watch的回调。
>
> - 建议开发者避免无限循环。循环可能是因为在@Watch的回调方法里直接或者间接地修改了同一个状态变量引起的。为了避免循环的产生，建议不要在@Watch的回调方法里修改当前装饰的状态变量；
> - 不建议在@Watch函数中调用async await，因为@Watch设计的用途是为了快速的计算，异步行为可能会导致重新渲染速度的性能问题。



## 2.1 语法

> @Prop @Watch('onUpdMsg')  msg:string   
>

```
@Entry
@Component
struct Index {
  @State @Watch("onCountChange") count:number = 0
  @State @Watch("onArrayChange") arr:Array<number> = [1,2,3]
  onCountChange(){
    console.log("count变化了")
  }

  onArrayChange(){
    console.log("Array变化了")
  }

  build() {
     Column(){
       Text("数值:"+this.count)
       Button("+1").onClick(()=>{
         this.count++
       })


       Text("数组中的值:"+this.arr[0])
       Button("+1").onClick(()=>{
         this.arr[0]++
       })
     }
  }
}
```



## 2.2 案例

场景1： 数据筛选

1、布局   TextInput、Text.......

2、搞一个数据库db  [假数据,....]    再搞一个filter 页面基于它展示数据    也就是页面ForEach

3、把输入框数据保存到content状态

4、@Watch监控content状态变化写逻辑

```
// 1.准备页面结构
// 2.准备假数据datas 无需响应式，不在页面中展示
// 3.准备展示数据result，响应式数据，需要页面中展示
// 4.展示数据
//   方案1：给textInput绑定改变事件，获取数据，过滤数据给result


@Entry
@Component
struct Index {
  private datas: Array<string> = [
    "linzhiling",
    "linzhiying",
    "linzhixuan",
    "xiaosa",
    "xiaozhan"
  ]
  @State result: string[] = []
  @State @Watch("onContentUpdata") content: string = ''
  

  onContentUpdata() {
    this.result = this.datas.filter((item) => {
      return item.includes(this.content)
    })
  }

  build() {
    Column() {
      Text(this.content)
      TextInput({ placeholder: "请输入名称" })
        .onChange((value) => {
          this.content = value
        })
      ForEach(this.result, (item: string) => {
        Text(item)
      })
    }
  }
}
```





# 三、实战案例：京东购物车（略难）

<img src="http://tmp00002.learv.com/bfbb7948a7e10973b7f403fb463ccf79.jpg" width="300" />         

## 3.1 页面布局

```javascript
// 1.导航栏组件
@Component
struct Nav {
  @Prop title: string = '京东商城'

  build() {
    Row() {
      Text("<").fontColor(Color.White).fontSize(30)
      Text(this.title).fontColor(Color.White).fontSize(30)
      Text("")
    }
    .width("100%")
    .height(50)
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
  }
}

// 底部tabbar
@Component
struct Footer {
  build() {
    Row() {
      Text("首页").fontColor(Color.White).fontSize(20).width("25%").textAlign(TextAlign.Center)
      Text("分类").fontColor(Color.White).fontSize(20).width("25%").textAlign(TextAlign.Center)
      Text("购物车").fontColor(Color.Red).fontSize(20).width("25%").textAlign(TextAlign.Center)
      Text("我的").fontColor(Color.White).fontSize(20).width("25%").textAlign(TextAlign.Center)
    }.width("100%")
    .height(50)
    .backgroundColor(Color.Black)
  }
}

@Component
struct Goods {
  build() {
    Row() {
      Checkbox()
      Image("https://img0.baidu.com/it/u=3749404169,3428955615&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500")
        .width(100)
        .height(100)
        .margin({ left: 20, right: 30 })
      Column() {
        Text("商品1").fontSize(30)
        Text("¥1").fontSize(20).fontColor(Color.Red).fontWeight(700)

        Row() {
          Text('-').fontWeight(700)
          Text('1').margin({ left: 20, right: 20 })
          Text('+').fontWeight(700)
          Text('删除').margin({ left: 20 })
        }
      }
    }
    .width("100%")
    .height(120)
    .backgroundColor(Color.White)
    .padding(20)
    .border({
      width: { bottom: 2 },
      style: BorderStyle.Dashed
    })
  }
}


@Entry
@Component
struct Index {
  build() {
    Column() {

      // 1.导航栏
      Nav({ title: '购物车' })
      // 2.购物车商品
      Column() {
        Goods()
        Goods()
        Goods()
      }
      .width("100%")
      .layoutWeight(1)
      .backgroundColor("#ccc")

      // 3.统计信息
      Row() {
        Row() {
          Checkbox()
          Text('全选')
        }

        Text(`已选2件，合计：¥100元`)
      }.width("100%").justifyContent(FlexAlign.SpaceBetween)

      // 4.底部tabbar
      Footer()
    }.width("100%")
  }
}
```



## 3.2 商品展示 

components 公共组件

model  类型限制 导出    

page 入口文件   



定义模型   model/Goods.ets  

```javascript
export class GoodsType {
  checked: boolean 
  img: string  
  title: string  
  price: number  
  buyNum: number

  constructor(
    title: string,
    img: string,
    price: number,
    buyNum: number,
    checked: boolean
  ) {

    this.checked = checked
    this.img = img
    this.title = title
    this.price = price
    this.buyNum = buyNum
  }
}
```

假数据

```javascript
@State goods: GoodsType[] = [
    // {title: '', img: '', price:1, buyNum:1, checked: true}
    new GoodsType('商品1', 'https://img10.360buyimg.com/mobilecms/s234x234_jfs/t1/174852/14/37589/154717/65e02085Fb8461a8e/96939aa689988941.jpg!q70.dpg.webp', 1, 1, false),
    new GoodsType('商品2', 'https://img10.360buyimg.com/mobilecms/s234x234_jfs/t1/245155/36/1862/104221/659cfee7F1e4a4979/16c48823d0fe3b34.jpg!q70.dpg.webp', 2, 2, true),
    new GoodsType('商品3', 'https://img10.360buyimg.com/n2/s240x240_jfs/t1/147185/26/35165/278034/63d87bacF3a6c93ee/3dbd31c52cef4a9f.jpg!q70.jpg.webp', 3, 3, false),
  ]

```

父组件传数据

```javascript
Column() {
    ForEach(this.goods, (item: GoodsType) => {
        Goods({
            item: item
        })
    })


}
.width("100%")
.layoutWeight(1)
.backgroundColor("#ccc")
```

子组件接收数据

```javascript
@Component
struct Goods {
  @Prop item: GoodsType

  build() {
    Row() {
      Checkbox().select(this.item.checked)
      Image(this.item.img)
        .width(100)
        .height(100)
        .margin({ left: 20, right: 30 })
      Column() {
        Text(this.item.title).fontSize(30)
        Text(`¥${this.item.price}`).fontSize(20).fontColor(Color.Red).fontWeight(700)

        Row() {
          Text('-').fontWeight(700)
          Text(`${this.item.buyNum}`).margin({ left: 20, right: 20 })
          Text('+').fontWeight(700)
          Text('删除').margin({ left: 20 })
        }
      }
    }
    .width("100%")
    .height(120)
    .backgroundColor(Color.White)
    .padding(20)
    .border({
      width: { bottom: 2 },
      style: BorderStyle.Dashed
    })
  }
}
```

## 3.3 商品数据自增自减

```javascript
import { promptAction } from '@kit.ArkUI';


Row() {
    Text('-').fontWeight(700).onClick(() => {
        if (this.item.buyNum <= 1) {
            promptAction.showToast({
                message: '数量不能小于1件商品',
                duration: 2000,
                bottom: "50%"
            });
            return
        }
        this.item.buyNum--
    })
    Text(`${this.item.buyNum}`).margin({ left: 20, right: 20 })
    Text('+').fontWeight(700).onClick(() => {
        this.item.buyNum++
    })
    Text('删除').margin({ left: 20 })
}
```

## 3.4 删除商品

```javascript
//父组件
 ForEach(this.goods, (item: GoodsType, index: number) => {
     Goods({
          item: item,
+         goods: $goods,
+         i: index
     })
 })


//子组件
Text('删除')
    .margin({ left: 20 })
    .onClick(() => {
    //数组.splice(index,1)
    //缺谁：数据与索引
    this.goods.splice(this.i, 1)

})
```

## 3.5 全选与反选

```
// 全选&全不选
// 1 定义响应式模型 allChecked:boolean = false
// 2 给allChecked复选框绑定点击事件
// - 2.1 把allChecked改成取反
// - 2.2 遍历所有商品 挨个修改checked状态 （商品被修改了会自动同步到视图展示 @State）
// 3 商品点击控制全选&全不选  3.1-先改自身状态，3.2-声明临时状态,遍历检测状态,同步结果到父
// @State allChecked: boolean = false
@Provide allChecked: boolean = false
```

## 3.6 统计信息

````
1、父声明状态、并试图层使用
@Provide totalNum:number = 0
@Provide totalPrice:number = 0

2、子监控 遍历统计
@ObjectLink @Watch('onUpdItem') item:GoodsType 

````



> Code

````
import Goods from '../../components/Goods'
import { GoodsType } from '../../model/Goods'

@Component
struct Index {

  /*
   let obj1: object = {a:1,b:1}
   class Stu {
      a = 1
      b = 2
   }
   let obj2: object = new Stu()  // {a:1,b:2}

   * */

  @State goods: GoodsType[] =  [
    // {title: '', img: '', price:1, buyNum:1, checked: true}
    new GoodsType('商品1', 'https://img10.360buyimg.com/mobilecms/s234x234_jfs/t1/174852/14/37589/154717/65e02085Fb8461a8e/96939aa689988941.jpg!q70.dpg.webp', 1, 1, false),
    new GoodsType('商品2', 'https://img10.360buyimg.com/mobilecms/s234x234_jfs/t1/245155/36/1862/104221/659cfee7F1e4a4979/16c48823d0fe3b34.jpg!q70.dpg.webp', 2, 2, false),
    new GoodsType('商品3', 'https://img10.360buyimg.com/n2/s240x240_jfs/t1/147185/26/35165/278034/63d87bacF3a6c93ee/3dbd31c52cef4a9f.jpg!q70.jpg.webp', 3, 3, false),
  ]

  // 全选&全不选
  // 1 定义响应式模型 allChecked:boolean = false
  // 2 给allChecked复选框绑定点击事件
  // - 2.1 把allChecked改成取反
  // - 2.2 遍历所有商品 挨个修改checked状态 （商品被修改了会自动同步到视图展示 @State）
  // @State allChecked: boolean = false
  @Provide allChecked: boolean = false


  @Provide totalNum:number = 0
  @Provide totalPrice:number = 0

  build() {
    Column() {
      // 商品
      ForEach(
        this.goods,
        (item: GoodsType, i:number) => {
          // Goods({item: item, goods: this.goods})
          // Goods({item: item, goods: $goods, i: i})
          Goods({item, goods: $goods, i})
        }
      )
      // 统计：勾选框、已经统计、合计
      Row() {
          Checkbox()
            .select(this.allChecked)
            .onClick(() => {
              // - 2.1 把allChecked改成取反
              this.allChecked = !this.allChecked
              // - 2.2 遍历所有商品 挨个修改checked状态 （商品被修改了会自动同步到视图展示 @State）
              this.goods.forEach((item:GoodsType)=> {
                item.checked = this.allChecked // 最新取反的状态  你true 我也true 你false我也false
              })
            })
          Text('全选').fontSize(20).margin({right:80})
          Text(`已选${this.totalNum}件，合计：￥${this.totalPrice}元`)
          // Text('已选2件，合计：￥100元')
          // Text('已选'+this.totalNum+'件，合计：￥'+this.totalPrice+'元')
      }
        .width('100%')
        .backgroundColor('#fff')
        .border({
          width: {top:2,bottom:2},
          color: '#000',
          style: BorderStyle.Dotted
        })
        .margin({top:90})
    }
  }
}

export default Index
````





```
import { GoodsType } from '../model/Goods'
@Component
struct Goods {

  // @ObjectLink item:GoodsType
  @ObjectLink @Watch('onUpdItem') item:GoodsType

  @Link goods:GoodsType[]

  @Prop i:number

  @Consume allChecked: boolean
  @Consume totalNum:number
  @Consume totalPrice:number


  // 统计
  // 核心1：父组件布局不能写死  要使用模型数据
  // 核心2：什么时候改 、数据哪里来
  // - 什么时候改  加号、减号、删除触发时候就得统计勾选  =》方案1：+按钮,-按钮，del按钮挨个加点击事件； 方案2：用@Watch监控item数据变化
  // - 数据哪里来： this.goods checked是true的就是数据

  // onUpdItem = () => {}   这种格式和Watch配搭失效
  onUpdItem() {
    // console.log('额滴个亲娘数据变化啦')
    // 1 定义临时变量存放  总数量、总价格
    let totalPrice:number = 0
    let totalNum:number = 0
    // 2 遍历数据     循环体里面判断是否勾选  勾选类 累计数据
    this.goods.forEach((item:GoodsType) => {
        if (item.checked) {
          // totalNum++
          // totalNum = 累计数据+当前的数据
          // totalNum = totalNum+item.buyNum
          totalNum += item.buyNum
          // totalPrice =  之前统计的数据+当前新数据
          // totalPrice =  totalPrice + (item.price * item.buyNum)
          totalPrice += (item.price * item.buyNum)   // TODO: 如果这个地方看不懂 私聊
        }
    })
    // 3 循环结束后  保存结果
    this.totalNum = totalNum
    this.totalPrice = totalPrice
  }

  build() {
    Row() {
      Checkbox()
        // .select(false) // 点击父组件的勾选，需要所有商品都打勾，其实就是item.checked=true
        .select(this.item.checked)
        .onClick(() => {
          // 一、把当前的item改一下状态
          this.goods[this.i].checked = !this.goods[this.i].checked

          // 二、再去判断
          // 切记：console.log只能打印字符串
          // 因此：打印对象类型得使用内置的语法  JSON.stringify(对象)
          // console.log(JSON.stringify(this.goods))
          // 需求：任意商品的复选框点击，则循环所有商品 假设有一个是false则就不能全选
          // 1 姑且假设应该全选 所以定义变量 state = true
          let state = true
          // 2 通过for循环遍历所有商品  但凡有一个没勾 则state改成false 退出循环 后面不看了  有一个没勾则全选复选框就不等你勾
          for (let i=0; i<this.goods.length;i++) {
            // this.goods数组
            // this.goods数组[i] 获取每个商品
            // this.goods数组[i].checked  每个商品都有一个checked属性
            // if (this.goods[i].checked) {  属性是真true就算了
            if (!this.goods[i].checked) {  //咱们取反如果是假  !true false   !false true
                state = false
                break // 退出for循环 后面不走了  假设要循环10次  第二次的时候遇到了break 后面8次就不会走 ；
                // return是退出函数  breka是退出for循环
            }
          }
          // 3 控制全选全不选复选框 也就是修改 allChecked = state
          // 留心：咱们子里面要修改父的allChecked 因此得双向数据共享
          // 结果：通过@Link
          // 起飞：组件
          this.allChecked = state

          console.log('最终allChecked状态：'+this.allChecked)
        })
      // Image('https://img10.360buyimg.com/mobilecms/s234x234_jfs/t1/174852/14/37589/154717/65e02085Fb8461a8e/96939aa689988941.jpg!q70.dpg.webp')
      Image(this.item.img)
        .width(100)
        .height(100)
        .margin({left:20,right:20})
      Column() {
        // Text('商品标题').fontSize(30).fontWeight(FontWeight.Bold)
        // Text('￥10').fontSize(30).fontWeight(FontWeight.Bold).fontColor('red')
        Text(this.item.title).fontSize(30).fontWeight(FontWeight.Bold)
        Text('￥'+this.item.price).fontSize(30).fontWeight(FontWeight.Bold).fontColor('red')
        Row() {
          Text('-')
            .fontSize(30)
            .backgroundColor(this.item.buyNum<=1?'#ccc': '#fff')
            .onClick(() => {
              if (this.item.buyNum<=1) return
              console.log(' this.item.buyNum--')
              this.item.buyNum--
            })
          Text(String(this.item.buyNum)).fontSize(16).margin({left:20,right:20})
          Text('+').fontSize(30)
            .onClick(() => {
              console.log(' this.item.buyNum++')
              this.item.buyNum++
            })
          Text('删除').fontSize(18).margin(20)
            .onClick(() => {
              // 语法：原数组.splice(索引,个数)
              this.goods.splice(this.i, 1)
            })
        }
      }
    }
    .width('100%')
    .padding(20)
    .backgroundColor('#fff')
    .border({
      width: {bottom:2},
      color: 'black',
      style: BorderStyle.Dotted
    })
  }
}

export default Goods
```



