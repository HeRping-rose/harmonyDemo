// 轮播图案例
import { http } from '@kit.NetworkKit'

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
  @State swiperList: Info[] = []

  aboutToAppear(): void {
    this.getSwiperImage()
  }


  getSwiperImage(){
    const HttpRequest=http.createHttp()
    HttpRequest.request('http://123.56.141.187:81/fsdy/film/recommend')
      .then((res)=>{

        // console.log(typeof (res.result))//string
        this.swiperList=JSON.parse(res.result as string).data
        console.log(JSON.stringify(this.swiperList))
        // this.swiperList=(res.result as RootObject).data//类型断言确定是RootObject 这个类型
        //
        // console.log(JSON.stringify(this.swiperList))
      })
  }
  build() {
    Column(){
    //   轮播图 组件
      Swiper() {
        ForEach(this.swiperList,(item:Info)=>{
          Image(item.poster)
            .width('100%')
            // .backgroundColor(Color.Gray)
        })
        // Image('https://avatars.githubusercontent.com/u/103038543?v=4')
        // Image('https://avatars.githubusercontent.com/u/103038543?v=4')
        // Image('https://avatars.githubusercontent.com/u/103038543?v=4')

      }
      .width('100%')
      .height(200)
      .loop(true)
      .autoPlay(true)
      .interval(2000)
      .indicator(
        Indicator.dot()
          .left('25%')
          .itemWidth(15)
          .itemHeight(15)
          .selectedItemWidth(30)
          .selectedItemHeight(15)
          .color(Color.Gray)
          .selectedColor(Color.Blue))
      .displayArrow({
        showBackground: true,
        isSidebarMiddle: true,
        backgroundSize: 24,
        backgroundColor: Color.White,
        arrowSize: 18,
        arrowColor: Color.Blue
      }, false)
      .vertical(false)//横向

    }
  }
}