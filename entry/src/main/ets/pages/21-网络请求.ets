// 网络请求
// 导入`http模块
// 创建HttpRequest实例   通过http.createRequest()方法
// 调用request方法 发送网络请求 传递参数 请求地址  配置对象
// 返回一个Promise对象,调用then方法获取服务器数据并处理
import { http } from '@kit.NetworkKit'


@Entry
@Component
struct Index {
  build() {
    Column(){
      Button('点击请求数据')
        .onClick(()=>{
          // 创建网络请求对象
          const httpRequest=http.createHttp()

          httpRequest.request('http://123.56.141.187:81/fsdy/film/recommend',{
            // 请求方式
            method:http.RequestMethod.GET,
            // post请求传参  extraData      get传参通过在地址后问号形式传参
            // extraData:'id=1',
            // 请求头
            // header:{ 'Content-Type': 'application/x-www-form-urlencoded'}

          }).then((res)=>{
            // 返回的是一个promise对象
            // console.log( JSON.stringify(result))
            AlertDialog.show({
              // 返回的真正的数据res.result的属性上
              message: JSON.stringify(res.result,null,2)
            })
          })

          httpRequest.destroy();//请求使用完毕时，调用destroy方法主动销毁对象

          })
    }
  }
}






