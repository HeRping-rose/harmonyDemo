import axios, { AxiosError, AxiosRequestConfig, AxiosResponse, InternalAxiosRequestConfig } from '@ohos/axios'
import router from '@ohos.router';
import { http } from '@kit.NetworkKit';


const  instance=axios.create({
  baseURL:'http://123.56.141.187:8001',//基础地址 默认是空
  // timeout:5000
})

// interface ApiResponse<T> { //根据项目实际项目修改
//   data?: T;
//   msg?: string;
//   state?: number;
//   total?:number
//   list?:T
// }
//
// // 创建实例
// const instance = axios.create({
//   baseURL: 'http://123.56.141.187:8001', //修改为自己项目的实际地址
//   // timeout: 10000,//超时
//   // headers: { 'Content-Type': 'application/json' },
// })
//
// // 请求拦截器
// instance.interceptors.request.use((config:InternalAxiosRequestConfig) => {
//   // 对请求数据做点什么
//   return config;
// }, (error:AxiosError) => {
//   // 对请求错误做些什么
//   return Promise.reject(error);
// });
//
// // 添加响应拦截器
// instance.interceptors.response.use((response:AxiosResponse)=> {
//   return response.data;
// }, (error:AxiosError)=> {
//   console.log("AxiosError",JSON.stringify(error.response))
//   return Promise.reject(error);
// });
//
// export default <T>(config:AxiosRequestConfig): Promise<ApiResponse<T>>=> {
//   return instance(config);
// }

//拦截器  请求  响应  添加 拦截器
export default  instance