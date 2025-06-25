# 一. 网络请求

背景：前端的数据一定是要与后端的数据进行交互才能生成动态的数据页面。

```javascript
原生js: XMLHttpRequest    fetch    
第三方库:  axios ....

// 1.原生js:  XMLHttpRequest
let xhr = new XMLHttpRequest();
xhr.open("get", "http://123.56.141.187:81/fsdy/film/recommend");
xhr.send();

 xhr.onload = function () {
     console.log(JSON.parse(xhr.response));
};

// 2.原生js: fetch

fetch("http://123.56.141.187:81/fsdy/film/recommend")
  .then((response) => response.json())
  .then((data) => console.log(data));




// 基本的get请求
    fetch('https://api.example.com/data', {
      method: 'GET',
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error fetching data: ', error));


// 带有参数的get请求
    let url = 'https://api.example.com/data?param1=value1&param2=value2';
    fetch(url, {
      method: 'GET',
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error fetching data: ', error));


// post请求
    let url = 'https://api.example.com/data';
    let body = { param1: 'value1', param2: 'value2' };
    fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(body),
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error fetching data: ', error));

// 带有认证的请求
    let url = 'https://api.example.com/data';
    let user = 'user';
    let password = 'password';
    fetch(url, {
      method: 'GET',
      headers: {
        'Authorization': 'Basic ' + btoa(user + ':' + password),
      },
    })
    .then(response => response.json())
    .then(data => console.log(data))
    .catch(error => console.error('Error fetching data: ', error));


```





## 1.发送请求API语法

步骤：

1、导入http模块
2、创建httpRequest实例，基于createHttp函数
3、调用request函数  传递两个实参   第一个-请求地址，第二个-配置对象
4、返回promise对象 .then   res.responseCode === 200  后  通过res.result 获取服务器数据

``` javascript
import http from '@ohos.net.http';

const httpRequest = http.createHttp();

httpRequest.request(
 请求地址?参数名=数据&....&参数名=数据,  // ?当get请求用来传递参数
      {
           method: http.RequestMethod.GET/POST,     
           extraData: { // 当post请求用
             "param1": "value1",
             "param2": "value2",
           },
    	   headers:{
               ...
           }
	  }
)	
  .then(res => {
     if (res.responseCode === 200) { 
       console.log('后端给的数据：', res.result)
     }
  })
  

```

细节1： 90% 都可以在preview里面直接用，但是10%必须模拟器用

细节2：网络请求和图片一样  模拟器必须配置权限



## 2.申请网络访问权限

在进行网络请求前，您需要在module.json5文件中申明网络访问权限

{
    "module" : {
        "requestPermissions":[
           {
             "name": "ohos.permission.INTERNET"
           }
        ]
    }
}



> 应用访问网络需要申请ohos.permission.INTERNET权限，因为HarmonyOS提供了一种访问控制机制即应用权限，用来保证这些数据或功能不会被不当或恶意使用。关于应用权限的的详细信息开发者可以参考：访问控制。



## 3.首页轮播图案例

```javascript
import { http } from '@kit.NetworkKit'
import { JSON } from '@kit.ArkTS';

interface Info {
  id: number;
  cinema_id: number;
  type: number;
  poster: string;
  name: string;
  grade: string;
  actors: string;
  nation: string;
  runtime: string;
  category: string;
  filmType: string;
  synopsis: string;
  photos: string;
  recommend: number;
  created_at: string;
  address: string;
}

interface RootObject {
  state: number;
  msg: string;
  data: Info[];
}

@Entry
@Component
struct Index {
  @State imgs:Info[] = []

  aboutToAppear(): void {
      this.getData()
  }

  getData(){
    const httpRequest = http.createHttp()
    httpRequest.request('http://123.56.141.187:81/fsdy/film/recommend',{
      method:http.RequestMethod.GET
    }).then((res)=>{
       if(res.responseCode===200){
         console.log("qf",'ok')
         const result = JSON.parse(res.result as string) as RootObject
         this.imgs = result.data
         console.log('qf',JSON.stringify(this.imgs))
       }
    })
  }


  build() {
    Column(){
      Text("hello")
      Swiper() {
        ForEach(this.imgs,(item:Info,Index:number)=>{
          Image(item.poster).width("100%").height(200)
        })
      }
      .loop(true)

      // ForEach(this.imgs,(item:Info,Index:number)=>{
      //   Image(item.poster).width("100%").height(200)
      // })

      Button("发送").onClick(()=>{
         this.getData()
      })
    }
  }
}
```



## 3.百度搜索案例

接口：http://www.baidu.com/sugrec?prod=pc&wd=htm 

````javascript
import { http } from '@kit.NetworkKit'
interface SearchItem {
  type:string
  sa:string
  q:string
}

@Entry
@Component
struct Index {

  @State list:SearchItem[] = []

  build() {
    Column(){

      TextInput({placeholder:'请输入关键词'}).onChange((value)=>{
        // console.log(value)

        const httpRequest = http.createHttp()

        const p = httpRequest.request(encodeURI("http://www.baidu.com/sugrec?prod=pc&wd="+value))

        p.then((res)=>{
          // console.log(JSON.stringify(res))
          if(res.responseCode===200){
            // console.log(res.result as string)
            this.list = JSON.parse(res.result as string).g
          }
        })
      })

      ForEach(this.list,(item:SearchItem)=>{
        Text(item.q).width("100%").fontSize(20)
      })

    }
  }
}
````



# 二.京东综合案例

接口文档

https://console-docs.apipost.cn/preview/d29e86bb50ca7ea9/383749660f04f9aa

## 1.布局

<img src="http://tmp00002.learv.com/733d67f64ba9044769b01523276a96f3.jpg" />



### 1.1 首页

> <img src="http://tmp00002.learv.com/933f75905c6492481e3fd7f45c7313d1.jpg" width="200"/>    

Index.ets

```javascript
import NavBar from '../components/NavBar'
import TabBar from '../components/TabBar'

@Entry
@Component
struct Index {
  @State title:string = "首页"
  build() {
    Column(){
       NavBar({title:this.title})
       Column(){
          Text("首页")
       }.layoutWeight(1)
       TabBar()
    }.width("100%").height("100%")
  }
}
```

components/NavBar.ets

```javascript
@Component
export default struct NavBar {

  @Prop title:string = "京东商城"
  @Prop left:string = ""
  @Prop right:string = ""

  build() {
    Row(){
      Text(this.left).fontColor(Color.White).fontSize(24)
      Text(this.title).fontColor(Color.White).fontSize(24)
      Text(this.right).fontColor(Color.White).fontSize(24)
    }.width("100%")
    .height(50)
    .backgroundColor(Color.Black)
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({left:10,right:10})
  }
}
```

components/TabBar.ets

```javascript
@Component
export default struct TabBar {
  build() {
    Row(){
      Text("首页").fontSize(24).fontColor(Color.White).width("25%").textAlign(TextAlign.Center)
      Text("分类").fontSize(24).fontColor(Color.White).width("25%").textAlign(TextAlign.Center)
      Text("购物车").fontSize(24).fontColor(Color.White).width("25%").textAlign(TextAlign.Center)
      Text("我的").fontSize(24).fontColor(Color.White).width("25%").textAlign(TextAlign.Center)
    }.width("100%")
    .height(60)
    .backgroundColor(Color.Black)
  }
}
```



### 1.2 首页商品列表

<img src="http://tmp00002.learv.com/1385ab2e0581bd5f23d5813ddba222cd.jpg" height="450" />    

```javascript
@Component
export default struct Goods {
  build() {
    Row(){
      Image('https://img0.baidu.com/it/u=3749404169,3428955615&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500')
        .width(100).height(100)
      Column(){
        Text('商品1').fontSize(20)
        Text("¥159.9元").fontSize(18)
        Button("加入购物车")
      }
    }.width("100%")
    .padding(10)
    .border({
      width:{bottom:1},
      style:BorderStyle.Dotted
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

### 1.3 购物车页面

<img src="http://tmp00002.learv.com/a444b662bb420ce2cb2be66c0a37902a.jpg" height="450" />

Cart.ets

```javascript
import NavBar from '../components/NavBar'
import TabBar from '../components/TabBar'
@Entry
@Component
struct Cart {
  @State title:string = "购物车"
  build() {
    Column(){
      
      NavBar({title:this.title})

      Column(){
        Text("购物车")
      }.layoutWeight(1)

      TabBar({index:2})
    }.width("100%")
    .height("100%")
  }
}
```

修改TabBar页面，让对应的页面高亮

```javascript
@Extend(Text) function textStyles(state:boolean){
  .fontSize(24)
  .fontColor(state?Color.Red:Color.White)
  .width("25%")
  .textAlign(TextAlign.Center)
}


@Component
export default struct TabBar {

  @Prop index:number = 0

  build() {
    Row(){
      Text("首页").textStyles(this.index===0)
      Text("分类").textStyles(this.index===1)
      Text("购物车").textStyles(this.index===2)
      Text("我的").textStyles(this.index===3)
    }.width("100%")
    .height(60)
    .backgroundColor(Color.Black)
  }
}
```

创建购物车商品组件CartGoods.ets

```javascript
@Component
export default struct Goods {
  build() {
    Row(){
      Image('https://img0.baidu.com/it/u=3749404169,3428955615&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500')
        .width(100).height(100)
      Column(){
        Text('商品1').fontSize(20)
        Text("¥159.9元").fontSize(18)
        Row(){
          // Counter() {
          //   Text("5")
          // }
          // .onInc(() => {
          //   // this.value++
          // })
          // .onDec(() => {
          //   // this.value--
          // })

          Text("-").fontSize(20).padding({left:10,right:10}).backgroundColor("#ccc")
          Text("5").padding({left:10,right:10})
          Text("+").fontSize(20).padding({left:10,right:10}).backgroundColor("#ccc")
          Text("删除").margin({left:10})
        }
      }
    }.width("100%")
    .padding(10)
    .border({
      width:{bottom:1},
      style:BorderStyle.Dotted
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
```

### 1.4 注册

![](images/ebcfb1fec034ce692cbea751c6b4f88c.jpg)       

```javascript
@Entry
@Component
struct Registry {
  build() {
    Column({space:20}){
      Text("注册页").fontSize(50)
      TextInput({placeholder:"请输入手机号"})
      Row(){
        TextInput({placeholder:"请输入验证码"}).layoutWeight(1)
        Button('获取验证码')
      }
      Button("立即注册").width("100%")
      Navigator({target:'pages/Login',type:NavigationType.Replace}){
        Text("已有账号? 立即登录")
      }

    }.width("100%")
    .height("100%")
    .padding(20)
  }
}
```



### 1.5 登录

> ![](images/e382c630fbaaa2ee96eabf4abf088cc4.jpg)   

````javascript
@Entry
@Component
struct Login {
  build() {
    Column({space:20}){
      Text("登录页").fontSize(50)
      TextInput({placeholder:"请输入手机号"})
      Row(){
        TextInput({placeholder:"请输入验证码"}).layoutWeight(1)
        Button('获取验证码')
      }
      Button("立即登录").width("100%")
      Navigator({target:'pages/Registry',type:NavigationType.Replace}){
        Text("还没账号? 立即注册")
      }
    }.width("100%")
    .height("100%")
    .padding(20)
  }
}
````

### 1.6.封装获取验证码组件

components/Sms.ets

```javascript
@Component
export default struct Sms {
  // 倒计时
  @State content:string = '获取验证码'
  @State time:number = 10
  @State isAbled:boolean = true
  private timer:number = 0

  build() {
    Button(this.content)
      .enabled(this.isAbled)
      .onClick(()=>{
        this.isAbled = false
        this.timer = setInterval(()=>{
          if(this.time<=0){
            clearInterval(this.timer)
            this.time = 10
            this.isAbled = true
            this.content = '获取验证码'
            return
          }
          this.time--
          this.content = `还剩${this.time}秒`
        },1000)


      //todo:发送请求获取验证码
        console.log("得到验证码")

    })
  }
}
```

## 2.axios使用

第三方工具库：https://ohpm.openharmony.cn/#/cn/home

axios是一个第三方的发送请求获取数据的库，在鸿蒙开发中获取数据如果要使用axios，需要三个步骤

1. 下载和安装ohpm   （最新编辑器自带       ohpm -v测试）
2. 下载和安装axios
3. 使用axios

第一步：下载和安装axios

```typescript
//进入项目目录，然后输入下面命令
ohpm install @ohos/axios
```

第二步：使用axios

```typescript
//导入axios
import axios from '@ohos/axios'

//发送请求并处理响应
axios.get(
	url:xxxxx,
    {
        params:{'param1':'value1'}          //get请传参
		data:{'param1':'value1'}            //post请求传参
    }
).then(response=>{
    if(response.status!==200){
        console.log("查询失败")
    }else{
        console.log("查询失败")
    }
}).catch(error=>{
    console.log('查询失败',JSON.stringfy(error))
})
```

三.类似vue开发中封装工具函数utils/request.ets

```javascript
import axios,{InternalAxiosRequestConfig, AxiosResponse,AxiosError,AxiosRequestConfig,AxiosInstance} from '@ohos/axios';
import router from '@ohos.router';
import { http } from '@kit.NetworkKit';

interface ApiResponse<T> { //根据项目实际项目修改
  data?: T;
  msg?: string;
  state?: number;
  total?:number
  list?:T
}

// 创建实例
const instance = axios.create({
  baseURL: 'http://123.56.141.187:8001', //修改为自己项目的实际地址
  // timeout: 10000,//超时
  // headers: { 'Content-Type': 'application/json' },
})

// 请求拦截器
instance.interceptors.request.use((config:InternalAxiosRequestConfig) => {
  // 对请求数据做点什么
  return config;
}, (error:AxiosError) => {
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 添加响应拦截器
instance.interceptors.response.use((response:AxiosResponse)=> {
  return response.data;
}, (error:AxiosError)=> {
  console.log("AxiosError",JSON.stringify(error.response))
  return Promise.reject(error);
});

export default <T>(config:AxiosRequestConfig): Promise<ApiResponse<T>>=> {
  return instance(config);
}

```

四. 创建api文件夹封装对应的函数

```javascript
import request from "../utils/request";
 
interface LoginParams{
  phone:string;
  code:string|number;
}
 
 
//测试登录
export function TestLogin<T>(data:LoginParams){
  return request<T>({
    url: "/test/login",
    method: "post",
    data
  });
}
 
//测试信息列表
export function parkList<T>(params:Record<string,string>){
  return request<T>({
    url: "/test/parks",
    method: "get",
    params
  });
}
```

五.组件中调用

```javascript
 
import {TestLogin } from "../api/index"
// 定义返回内容
interface ResponseLogin{
  name:string;
  code:string
}
@Entry
@Component
struct Index {
 
  async setTestLogin(){
    const result = await TestLogin<ResponseLogin>({phone:'13111111',code:352})
    if(result){
      console.log('result',JSON.stringify(result))
      console.log('code',JSON.stringify(result.code))
      console.log('data',JSON.stringify(result.data))
    }
  }
 
  build() {
    RelativeContainer() {
      Button('测试').onClick(()=>{
        this.setTestLogin();
      })
    }
    .height('100%')
    .width('100%')
  }
}
```

## 3 首页展示商品数据



## 4.注册功能

1.封装登录时验证码接口

```javascript
import request from '../utils/request'

// 获取登录短信接口
interface SmsType {
  mobile:string
  type:string
}
export const SmsApi = <T>(data:SmsType)=>{
  return request<T>({
    method:'post',
    url:'/sms/send',
    data
  })
}

//短信注册
export interface RegisterType {
  mobile:string
  code:string
}
export const registerApi = <T>(data:RegisterType)=>{
  return request<T>({
    method:'post',
    url:'/sms/registry',
    data
  })
}

// 登录
export interface LoginType {
  mobile:string
  code:string
}
export const loginApi = <T>(data:LoginType)=>{
  return request<T>({
    method:'post',
    url:'/sms/login',
    data
  })
}
```



### 4.1 获取短信

   ````javascript
import {SmsApi} from '../api/user'
import { promptAction } from '@kit.ArkUI'

interface SmsType {
}

@Component
export default struct Sms {

  @Prop mobile:string
  @Prop type:string


  @State content:string = '获取验证码'
  @State time:number = 10
  @State isAbled:boolean = true
  private timer:number = 0



  async getSms(){
    const res = await SmsApi<SmsType>({
        mobile:this.mobile,
        type:this.type
    })

    console.log(JSON.stringify(res))
    promptAction.showToast({
      message:res.msg,
      bottom:"50%"
    })

  }

  build() {
    Button(this.content)
      .enabled(this.isAbled)
      .onClick(async ()=>{
        this.isAbled = false
        this.timer = setInterval(()=>{
          if(this.time<=0){
            clearInterval(this.timer)
            this.time = 10
            this.isAbled = true
            this.content = '获取验证码'
            return
          }
          this.time--
          this.content = `还剩${this.time}秒`
        },1000)


      //todo:发送请求获取验证码
        this.getSms()

    })
  }
}
   ````





### 4.2 服务器注册

````javascript
import Sms from '../components/Sms'
import axios,{AxiosResponse} from '@ohos/axios'
import { promptAction, router } from '@kit.ArkUI'
import {RegisterType,registerApi} from '../api/user'

interface RegisterResType {

}

@Entry
@Component
struct Registry {

  @State formData:RegisterType= {
    mobile:'13886883211',
    code:''
  }

  async onSubmit(){
    const res = await registerApi<RegisterResType>(this.formData)

    promptAction.showToast({
      message:res.msg,
      bottom:"50%"
    })

  }


  build() {
    Column({space:20}){
      Text("注册页").fontSize(50)
      TextInput({placeholder:"请输入手机号",text:$$this.formData.mobile})
      Row(){
        TextInput({placeholder:"请输入验证码",text:$$this.formData.code}).layoutWeight(1)
        Sms({
          mobile:this.formData.mobile,
          type:'other'
        })
      }
      Button("立即注册").width("100%").onClick(()=>{
         this.onSubmit()
      })
      Navigator({target:'pages/Login',type:NavigationType.Replace}){
        Text("已有账号? 立即登录")
      }

    }.width("100%")
    .height("100%")
    .padding(20)
  }
}
````





## 5 登录&数据持久化

````javascript
  async onSubmit(){
     const res = await loginApi<LoginResType>(this.formData)
     // console.log(JSON.stringify(res))

     if(res.state===200){
     //   成功
       AppStorage.setOrCreate("userinfo",JSON.stringify(res.data))
       
       promptAction.showToast({
         message:res.msg,
         bottom:'50%'
       })
       router.pushUrl({
         url:'pages/My'
       })
     }
  }
````



```javascript
PersistentStorage.PersistProp('userinfo', JSON.stringify({
  nickname: '',
  avatar: '',
  mobile:'',
  token:''
}));  // 切记就存字符串把，因为后续数据持久化了也是字符串
```



My.ets

````javascript
import router from '@ohos.router'
@Component
export default struct Index {

  userinfo: UserinfoType = JSON.parse(AppStorage.Get('userinfo'))

  build() {
    Column() {
      if (this.userinfo.token) {
        Text('昵称：' + this.userinfo.nickname)
        Text('头像：' + this.userinfo.avatar)
        Image(this.userinfo.avatar).width(100).height(100)
        Text('手机号：' + this.userinfo.mobile)
        Text('唯一标识：' + this.userinfo.token)
      } else {
        Button('登录').onClick(() => {
          router.pushUrl({
            url: "pages/user/Login"
          })
        })
      }
    }
  }
}
````





## 6 退出

```javascript
import router from '@ohos.router'
@Component
export default struct Index {

  @State userinfo: UserinfoType = JSON.parse(AppStorage.Get('userinfo'))

  build() {
    Column() {
      if (this.userinfo.token) {
        Text('昵称：' + this.userinfo.nickname)
        // Text('头像：' + this.userinfo.avatar)
        Image(this.userinfo.avatar).width(100).height(100)
        Text('手机号：' + this.userinfo.mobile)
        Text('唯一标识：' + this.userinfo.token)

        Button('退出').onClick(() => {
            // 清空userinfo  页面才会响应式出现登录两个
          this.userinfo = new UserinfoType('', '', '', '')
          // 清除数据持久化 否则后续就来自动登录了
          AppStorage.Set('userinfo', JSON.stringify(this.userinfo))
        })
      } else {
        Button('登录').onClick(() => {
          router.pushUrl({
            url: "pages/user/Login"
          })
        })
      }
    }
  }
}
```



## 7 加入购物车

### 7.1  封装方法

```javascript
export interface addCartType {
  goods_id: number
  buyNum: string
}

export const addCartApi = <T>(data: addCartType) => {
  return request<T>({
    method: 'post',
    url: '/cart/create',
    data
  })
}
```



### 7.2 设置token

```javascript
// 请求拦截器
instance.interceptors.request.use((config: InternalAxiosRequestConfig) => {

  const token: string | undefined = AppStorage.get('token')
  if (token) {
    config.headers.Authorization = token
  }


  // 对请求数据做点什么
  return config;
}, (error: AxiosError) => {
  // 对请求错误做些什么
  return Promise.reject(error);
});
```



### 2.5.2 加入购物车

1、给加入购物车按钮绑定点击事件

2、判断用户是否登录 通过本地存储数据    没有-跳转登录，有-请求接口加入购物车

```javascript
 Button("加入购物车").onClick(async () => {
          if (!this.token) {
            AlertDialog.show(
              {
                title: '暂未登录,立即登录?',
                subtitle: '',
                message: '',
                autoCancel: true,
                alignment: DialogAlignment.Center,
                primaryButton: {
                  value: 'cancel',
                  action: () => {
                    console.info('Callback when the first button is clicked')
                  }
                },
                secondaryButton: {
                  enabled: true,
                  defaultFocus: true,
                  style: DialogButtonStyle.HIGHLIGHT,
                  value: 'ok',
                  action: () => {
                    router.pushUrl({ url: "pages/Login" })
                  }
                }
              }
            )
          } else {
            const res = await addCart<AddCartResType>({ goods_id: this.item.goods_id, buyNum: "1" })
            if (res.state === 201) {
              AlertDialog.show(
                {
                  title: '添加到购物车成功',
                  subtitle: '',
                  message: '',
                  autoCancel: true,
                  alignment: DialogAlignment.Center,
                  primaryButton: {
                    value: '再逛逛',
                    action: () => {
                      console.info('Callback when the first button is clicked')
                    }
                  },
                  secondaryButton: {
                    enabled: true,
                    defaultFocus: true,
                    style: DialogButtonStyle.HIGHLIGHT,
                    value: '去购物车',
                    action: () => {
                      router.pushUrl({ url: "pages/Cart" })
                    }
                  }
                }
              )
            }

          }
        })
```



## 8 购物车列表

```
import { GoodsType } from '../model/cart' // 首页商品数据和购物车商品数据是有区别
import { ResultType } from '../model/result'
import { get } from '../utils/request'
@Entry
@Component
struct Cart {

  @State goods: GoodsType[] = []

  build() {
      Column() {
        Button('获取购物车数据')
          .onClick(() => {
              // 1 类型限制  =》 根据接口返回的数据
              // 2 声明goods状态 数组里面是对象
              // 3 视图循环展示   默认没数据所以一个看不到
              // 4 请求服务器获取数据   因为@State修饰符数据变了会重新同步到视图层
            console.log('qf cart')
              get(
                'http://123.56.141.187:8001/cart/index',
                ( serverData: ResultType<GoodsType[]>    ) => {

                      console.log('qf ', JSON.stringify(serverData))

                    this.goods = serverData.data
                }
              )
          })

        ForEach(
          this.goods,
          (item: GoodsType) => {
              Row() {
                // Image('https://img10.360buyimg.com/babel/s380x300_jfs/t1/137725/40/32662/12626/63981b35E679f6253/e07f8ecfb8cccb2a.png')
                Image(item.goods_img2)
                  .width(150)
                Column(){
                  Text(item.goods_name).fontSize(30)
                  Text(`￥${item.shop_price}元`).fontSize(26)
                  Row() {
                    Text('-').fontSize(30).backgroundColor('#ccc')
                    Text(String(item.goods_number)).margin({left:5,right:5})
                    Text('+').fontSize(30).backgroundColor('#ccc')
                  }
                }
              }
                .margin({top:20,bottom:20})
                .padding({top:20,bottom:20})
                .border({
                  width:{bottom:2},
                  style: BorderStyle.Dotted,
                  color: '#ccc'
                })
          }
        )
      }
        .padding(30)
  }
}
```











# 三、生命周期



特殊的函数



![](images/1e8e434bd8b6549a1a81df789b7bac28.jpg)   

## 页面@Entry

aboutToAppear:

aboutToDisappear

onPageShow
页面每次显示时触发一次，包括路由过程、应用进入前台等场景，仅@Entry装饰的自定义组件生效。
onPageHide
页面每次隐藏时触发一次，包括路由过程、应用进入前后台等场景，仅@Entry装饰的自定义组件生效。
onBackPress
当用户点击返回按钮时触发，仅@Entry装饰的自定义组件生效。

``` 
import router from '@ohos.router'
@Entry
@Component
struct Test1 {

  onPageShow() {  // 访问量PV +1
    console.log("qf 每次显示触发")
  }

  onPageHide() {
    console.log('qf 每次隐藏触发')
  }

  build() {
    Column() {
      Text('test1页').fontSize(40)
      Button('跳转Test2')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Test2'
          })
        })
    }
  }
}



import router from '@ohos.router'
@Entry
@Component
struct Test2 {

  onBackPress() {
    console.log("qf 返回触发")
  }

  build() {
    Column() {
      Text('test2页').fontSize(40)
      Button('跳转Test1')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Test1'
          })
        })
    }
  }
}
```





## 组件@Component

**有aboutToAppear**   发送网络请求
组件即将出现时回调该接口，具体时机为在创建自定义组件的新实例后，在执行其build()函数之前执行。只会在组件创建的时候调用一次。可按照当前业务场景，再该接口请求数据或者初始化
**有aboutToDisappear**
在自定义组件析构销毁之前执行。不允许在aboutToDisappear函数中改变状态变量，特别是@Link变量的修改可能会导致应用程序行为不稳定。

**没有onPageShow与onPageHide**



````
import router from '@ohos.router'
@Entry
@Component
struct Test1 {

  onPageShow() {
    console.log("qf 每次显示触发")
  }

  onPageHide() {
    console.log('qf 每次隐藏触发')
  }

  aboutToAppear() {
    console.log("qf 组件首次渲染触发")
  }

  aboutToDisappear() {
    console.log("qf 卸载触发")
  }


  build() {
    Column() {

      Text('test1页').fontSize(40)

      Button('跳转Test2 pushUrl')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Test2'
          })
        })

      Button('跳转Test2 replaceUrl')
        .onClick(() => {
          router.replaceUrl({
            url: 'pages/Test2'
          })
        })


    }
  }
}




import router from '@ohos.router'
@Entry
@Component
struct Test2 {

  onBackPress() {
    console.log("qf 返回触发")
  }

  build() {
    Column() {
      Text('test2页').fontSize(40)
      Button('跳转Test1')
        .onClick(() => {
          router.replaceUrl({
            url: 'pages/Test1'
          })
        })
    }
  }
}
````



# 四、列表组件 

## 简介

循环渲染适用于短列表，当构建具有大量列表项的长列表时，如果直接采用循环渲染方式，会一次性加载所有的列表元素，会导致页面启动时间过长，影响用户体验。因此，推荐使用数据懒加载（LazyForEach）方式实现按需迭代加载数据，从而提升列表性能

文档：

https://developer.harmonyos.com/cn/docs/documentation/doc-guides-V3/arkts-layout-development-create-list-0000001451074018-V3#section94148431926



![](images/052635ceca1ed447304f2b50bb3fbe31.gif)  



## 语法

```javascript
@Entry
@Component
struct Index {
  build() {
    Column(){

      List(){
          ForEach("1234567890123456789012345678901234567890666".split(''),(item:string)=>{
            ListItem(){
                Text(item).fontSize(20)
            }
          })     
      }
    }
  }
}
```

## 首页商品列表

新增上拉加载更多功能

```javascript

import NavBar from '../components/NavBar'
import TabBar from '../components/TabBar'
import Goods from '../components/Goods'
import {getGoodsListApi} from '../api/Goods'
import {GoodsItem} from '../model/Goods'
import { promptAction } from '@kit.ArkUI'

@Entry
@Component
struct Index {

  @State title:string = "首页"
  @State pagenum:number = 0
  @State pagesize:number = 10
  @State goodsList:GoodsItem[] = []
  private total:number = 0

  aboutToAppear(): void {
    this.getList()
  }

  async getList(){
    const res = await getGoodsListApi<GoodsItem[]>({pagenum:this.pagenum,pagesize:this.pagesize})

    // 加载更多 数组 = [...原数组，...新数组]
    this.goodsList = [...this.goodsList,...res.list  as GoodsItem[]]

    // this.goodsList =  res.list as GoodsItem[]
    this.total = res.total as number

  }


  build() {
    Column(){
    // 导航栏
      NavBar({title:this.title})
    // 内容
      Column(){

        List(){
          ForEach(this.goodsList,(item:GoodsItem)=>{
             ListItem(){
               Goods({
                 item:item
               })
             }
          })
        }.onReachEnd(()=>{
          // console.log("到底了！！！ ok")
          if(this.total&&this.goodsList.length>=this.total){
            promptAction.showToast({
              message:'没有更多数据'
            })
            return
          }

          this.pagenum++
          this.getList()

        })
        // .onScrollIndex((start:number,end:number)=>{
        //   // console.log("列表展示开始索引:"+start,"列表展示结束索引:"+end)
        //   if(this.goodsList.length-1===end){
        //     console.log("到底了！！！")
        //   }
        // })


      }.layoutWeight(1)

      // TabBar
      TabBar({index:0})

    }.width("100%").height("100%")

  }
}
```





























