# 一、页面路由

https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/js-apis-router-V5

路由简介：

> ```
> 普通用户：网址
> 开发人员：域名+路径
>    前端：地址+组件
>    后端：地址+处理业务逻辑函数(接收数据，判断数据是否合法，连接数据库。。。。,响应数据)
>    
> 鸿蒙里面：路由 
> ```

路由/网址/域名组成

```
协议://域名:端口/路径?参数名=数据&...&参数名=数据 
http://baidu.com:80/login?参数名=数据&...&参数名=数据 
```

路径作用：显示不同的页面（布局结构不一样、数据都不同）

参数作用：显示不同的数据（布局结构一样、数据不同）

```
留 心：路径后面一般是参数，有n种方式，一般分为两种
传参1：协议://域名:端口/路径?参数名=值&....&参数名=值    【query传参/get方式传参】
传参2：协议://域名:端口/路径/参数1/.../参数n           【params传参】

http://baidu.com/user/12          /user/:id  定义路由的去规定了
http://baidu.com/user?id=1  
```



## 1.1 路由

一个应用中有多个页面，在鸿蒙中创建页面并正常的实现跳转分为两步：

1. 创建页面
2. 配置路由

resource/base/profile/main_pages.json

```
{
  "src": [
    "pages/Index",
    "pages/Cart",
    "pages/Detail"
  ]
}
```

- 细节1：路由配置在json文件中  所以必须写 双引号，数组的最后一个不能写逗号
- 细节2：咱们后面写代码目录统一小写，组件名大写

**小技巧**：快速创建路由页面无需配置     在新建中选中pages菜单，添加页面





## 1.2 页面跳转

页面栈的最大容量为32个页面。如果超过这个限制，可以调用router.clear()方法清空历史页面栈，释放内存空间。

Router模块提供了两种跳转模式，分别是router.pushUrl()和router.replaceUrl()。这两种模式决定了目标页是否会替换当前页



### router.pushUrl()

目标页不会替换当前页，而是压入页面栈。这样可以保留当前页的状态，并且可以通过返回键或者调用router.back()方法返回到当前页

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column(){
      Text("index页面")
      Button("跳转到other页").onClick(()=>{
        router.pushUrl({
          url:'pages/Other'
        })
      })
    }
  }
}
```



### router.replaceUrl()

目标页会替换当前页，并销毁当前页。这样可以释放当前页的资源，并且无法返回到当前页。

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column(){
      Text("index页面")
      Button("跳转到other页").onClick(()=>{
        router.replaceUrl({
          url:'pages/Other'
        })
      })
    }
  }
}
```

### router.back()

返回上一页

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Other {
  build() {
    Column(){
      Text("Other页面")
      Button("返回上一页").onClick((event: ClickEvent) => {
        router.back()
      })
    }

  }
}
```

小功能：页面返回前增加一个内置的询问框

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Other {
  build() {
    Column(){
      Text("Other页面")
      Button("返回上一页").onClick((event: ClickEvent) => {

        router.showAlertBeforeBackPage({
          message:"确定要返回吗?"
        })
          
        router.back()
      })
    }

  }
}
```



## 1.3 路由传参   

### 使用params对象传参 

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column(){
      Text("index页面")
      Button("跳转到other页").onClick(()=>{
        router.pushUrl({
          url:'pages/Other',
+         params:{
+            content:"今天晚上去哪里?"
+          }
        })
      })
    }
  }
}
```

### 接收参数

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Other {
  build() {
    Column(){
      Text("Other页面")
      Button("返回上一页").onClick((event: ClickEvent) => {

        router.showAlertBeforeBackPage({
          message:"确定要返回吗?"
        })
        router.back()
      })


      Button("获取参数").onClick(()=>{
        console.log(JSON.stringify(router.getParams()))

      })
    }

  }
}
```

### 进入页面立即接收参数

```javascript
import { router } from '@kit.ArkUI'
interface ParamsType{
  content:string
}
@Entry
@Component
struct Other {

  //vue2:相当于created
  aboutToAppear(): void {
    const params = router.getParams() as ParamsType
    console.log(JSON.stringify(params))
    console.log(params.content)
  }


  build() {
    Column(){
      Text("Other页面")
      Button("返回上一页").onClick((event: ClickEvent) => {

        router.showAlertBeforeBackPage({
          message:"确定要返回吗?"
        })
        router.back()
      })


      Button("获取参数").onClick(()=>{
        console.log(JSON.stringify(router.getParams()))

      })
    }

  }
}
```



## 1.5 实例模式

### Standard

标准实例模式，也是默认情况下的实例模式。每次调用该方法都会新建一个目标页，并压入栈顶

### Single 

单实例模式。即如果目标页的url在页面栈中已经存在同url页面，则离栈顶最近的同url页面会被移动到栈顶，并重新加载；如果目标页的url在页面栈中不存在同url页面，则按照标准模式跳转。

![image-20241102115730230](images/image-20241102115730230.png)





## 1.6 知识点小结

- 路由简介：路由就是用来跳转页面的 从而展示不同的.ets组件，在ets同级resources/base/profile/main_pages.json
- 跳转模式、路由传参、返回询问可

```
pushUrl/replaceUrl({
	url
	params: {}
})

back()
```

- 实例模式（路由模式）

> 标准的  standard
>
> Single  单实例 
>
> ```
> 明确要页面站只有一个  Single 
> 明确要返回的pushUrl
> ```

- Navigator组件（声明式导航）     Navigator({    target,type   }){    文本   } .params()




# 二.本地存储

```
web实现本地存储
localStorage     持久化存储       getItem    setItem
sessionStorage   浏览器关闭数据消毁   getItem    setItem
vuex/pinia 也是存数据，内存   刷新数据消毁
```



## 场景

1、登录      存储昵称、头像     =>  为啥存 会员中心/或者界面的右上角去展示，同时开发者也要根据这个判断是否登录

2、访问历史记录       抖音观看历史       

> - 2.1 存在本地  用户手机上
> - 2.2 保存到服务器上     铺垫    大数据分析  给你推荐喜欢的 （衍生京东淘宝搜索商品 登录之后才可以）



不要用想太复杂  就是存数据的   能存储数据，能获取数据你就会了  记住语法  只不过业务逻辑可能会导致你不会



## 3.1 LocalStorage：页面级UI状态存储

> a 页面创建了storage对象 并存储了数据   其他页面想获取必须通过a页面这个实例  重新实例化没用

const storage = new LocalStorage({name: "李四"}) 

storage.set('name', '张三')     存

console.log(storage.get("name"))   取



utils/Storage.ets

```
API12
class UserinfoType {
  nickname: string = ''
  avatar: string = ''
  token: string = ''
}

export const userinfoStorage = new LocalStorage(new UserinfoType())

```

Login.ets

```
import { userinfoStorage } from '../utils/Storage'
import { promptAction, router } from '@kit.ArkUI'

@Entry
@Component
struct Login {
  build() {
    Button('登录').onClick((event: ClickEvent) => {
      // 存储
      userinfoStorage.set('nickname', '用户名')
      userinfoStorage.set('avatar', '头像')
      userinfoStorage.set('token', 'adsfadsfdsafdsf')
      // 提示
      promptAction.showToast({
        message: '登录成功'
      })
      // 跳转
      router.replaceUrl({
        url: 'pages/Member'
      }, router.RouterMode.Single)
    })
  }
}
```

Member.ets

```
import { userinfoStorage } from '../utils/Storage'

@Entry
@Component
struct Member {
  @State nickname: string = userinfoStorage.get('nickname') as string

  build() {
    Text(this.nickname)
  }
}
```

> 除了应用程序逻辑使用LocalStorage，还可以借助LocalStorage相关的两个装饰器@LocalStorageProp和@LocalStorageLink，在UI组件内部获取到LocalStorage实例中存储的状态变量。

Login.ets

````
import { userinfoStorage } from '../../utils/Storage'
import { promptAction, router } from '@kit.ArkUI'

@Entry(userinfoStorage)
@Component
struct Login {
  @LocalStorageLink('nickname') nickname: string = ''
  @LocalStorageLink('avatar') avatar: string = ''
  @LocalStorageLink('token') token: string = ''

  build() {
    Button('登录').onClick((event: ClickEvent) => {
      // 存储
      this.nickname = '教主'
      this.avatar = '头像'
      this.token = 'asdfafasdfadsf'
      // 提示
      promptAction.showToast({
        message: '登录成功'
      })
      // 跳转
      router.replaceUrl({
        url: 'pages/Member'
      }, router.RouterMode.Single)
    })
  }
}
````

Member.ets

```
import { userinfoStorage } from '../../utils/Storage'

@Entry(userinfoStorage)
@Component
struct Member {
  // @State nickname: string = userinfoStorage.get('nickname') as string

  @LocalStorageProp('nickname') nickname: string = ''

  build() {
    Text(this.nickname)
  }
}
```



## 3.2 AppStorage：应用全局的UI状态存储

// 有则修改没有则创建
AppStorage.setOrCreate('name', 'app的名字');    首次初始化   其他页面不需要导入就可以使用

console.log(AppStorage.get('name'))

AppStorage.set('name', 数据)



a页面存数据

```javascript
import { router } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  build() {
    Column(){
      Text("index页面")
      Button("登录").onClick(()=>{

        // 存数据
        AppStorage.setOrCreate("name",'jack')
        AppStorage.setOrCreate('age',18)

        router.pushUrl({
          url:'pages/Other'
        })

      })
    }
  }
}
```

b页面取数据

```javascript
import { router } from '@kit.ArkUI'
// import { userStorage } from '../utils/Storage'

@Entry
@Component
struct Other {

  @State name:string = AppStorage.get('name') as string
  @State age:number  = AppStorage.get('age') as number


  build() {
    Column(){
      Text("Other页面")

      Text(this.name)
      Text(this.age.toString())

      Button("获取数据").onClick((event: ClickEvent) => {
        console.log(AppStorage.get('name'))
        console.log(AppStorage.get('age'))
      })
    }

  }
}
```



## 3.3 LocalStorage vs AppStorage

​								使用细节										使用方便			 数据持久化（刷新数据还在的表现）							 

LocalStorage        必须同一个storage					   方便				     否

AppStorage  		入口初始化完成直接全局使用      更方便				 否       如要持久化配合PersistentStorage使用



<img src="http://tmp00002.learv.com/4b0934e97066aa5ffe39f58b41d5d1aa.jpg" /> 



# 三. 持久化存储状态

> PersistentStorage将选定的AppStorage属性保留在设备磁盘上。应用程序通过API，以决定哪些AppStorage属性应借助PersistentStorage持久化。UI和业务逻辑不直接访问PersistentStorage中的属性，所有属性访问都是对AppStorage的访问，AppStorage中的更改会自动同步到PersistentStorage。
>
> PersistentStorage和AppStorage中的属性建立双向同步。应用开发通常通过AppStorage访问PersistentStorage，另外还有一些接口可以用于管理持久化属性，但是业务逻辑始终是通过AppStorage获取和设置属性的。
>
> **切记PersistentStorage放到app启动入口才会生效！！！**



```javascript
import { router } from '@kit.ArkUI'
PersistentStorage.persistProp("name","tom")
PersistentStorage.persistProp("age",4)

@Entry
@Component
struct Index {

  @StorageLink("name") name:string = ''
  @StorageLink("age") age:number = 0

  build() {
    Column(){
      Text("index页面")
      Text("姓名"+this.name)
      Text("年龄"+this.age)

      Button("修改").onClick(()=>{

        // 存数据
        AppStorage.setOrCreate("name",'jerry')
        AppStorage.setOrCreate('age',3)


      })
    }
  }
}
```



