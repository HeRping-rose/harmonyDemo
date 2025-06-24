// 百度搜索案例
import { http } from '@kit.NetworkKit'


// 百度接口：https://www.baidu.com/sugrec?prod=pc&wd=xxx

interface Info{
  type:string
  sa:string
  q: string
}

@Entry
@Component
struct Index {
  @State @Watch('change') kw: string = ''
  @State list:Info[]=[]
  build() {
    Column(){
      Row(){
        TextInput({placeholder:'请输入搜索内容',text:$$this.kw})
          .layoutWeight(1)
          .backgroundColor('#eaeceb')
        Image($rawfile('search.png')).height(20).padding({right:10,left:10})
          .onClick(() =>{
            //搜索事件处理
          })

      }
      .backgroundColor('#eaeceb')
      .borderRadius(20)

      //提示关键词信息
      ForEach(this.list, (item:Info, index) => {
        Text(item.q).width('100%')
      })
    }
  }

  change(changedPropertyName: string) {

    console.log(changedPropertyName+"变化了")//changedPropertyName就是kw

    const httpRequest=http.createHttp()
    httpRequest.request('https://www.baidu.com/sugrec?prod=pc&wd='+this.kw)
      .then((res)=>{
        this.list=JSON.parse(res.result as string).g
        // console.log(JSON.stringify(res.result))
      })
  }
}