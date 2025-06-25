import axios, { AxiosResponse } from '@ohos/axios'
import instance from '../utils/request'


import request from '../utils/request'


/*
 * axios使用  导入
 * 语法  第一套
 * axios ({
 *  method: 'get|post|put|delete',
 *  url: 'https://www.baidu.com',
 *  params: {}//get传参
 *
 * data:{}  //post put传参
 * }).then((res) => {})
 *
 *
 * 语法第二套  (常用)  封装成工具使用 utils /request
 * 创建实例 const instance=axios.create({//配置项
 * baseURL: 'https://www.baidu.com',//基础地址请求根路径
 * //...
 *
 *
 * })
 *
 * */

@Preview

@Component
export struct Axios {
  build() {
    Column() {
      Text('Axios')
        .fontSize(36)
        .fontColor(Color.Red)
        .onClick(() => {
          // axios({
          //   method: 'get',
          //   url: 'https://www.baidu.com',//地址
          // })
          //   //类型说明
          //   .then((res:AxiosResponse) => {
          //     console.log(JSON.stringify(res))
          //   })


          //方法二 封装成工具使用
          // request({
          //   method: 'get',
          //   url: 'https://www.baidu.com',//可以省略基础URL
          // }).then((res: AxiosResponse) => {
          //   console.log(JSON.stringify(res))
          // })
        })
    }
  }
}