@Entry
// 京东商品详情页
@Component
struct Index {
  @State isCollect: boolean = false;
  build() {
    //布局从大到小,从左至右

    Column(){
      //   1.商品图片
      Image('https://img10.360buyimg.com/n2/s195x195_jfs/t1/295248/2/13853/55889/684bfc94F276d1214/08046a9ea562dd33.jpg')
        .width('100%')
      //   2.商品价格
      Row(){
        //   价格
        Column(){
          Row(){
            Text('到手价 ').fontColor(Color.White)
            Text('7499').fontColor(Color.White).fontWeight(800)
          }
          Row(){
            Text('日常价 ').fontColor(Color.White)
            Text('7899').fontColor(Color.White).fontWeight(400)
          }
        }
        //   补贴
        Column(){
          Text('国家补贴').fontColor(Color.White).fontWeight(600)
          Text('领取国补减400').fontColor(Color.White)
        }
      }.width('100%')
      .height(60)
      .padding({left:10,right:10})
      .justifyContent(FlexAlign.SpaceBetween)
      .backgroundColor('#0ecb61')
      //   3.商品描述信息
      Row(){
        Image('https://storage.360buyimg.com/jxfe/ppms/c/202411/19/5e3e0db9-7d02-4879-b53e-e855c6ed06b0.png')
          .height(15)
        Image('https://storage.360buyimg.com/jxfe/ppms/c/202411/20/841a9119-0d76-4eb1-8832-b681b9369133.png')
          .height(15)
        Text('HUAWEI Pura 80 Pro+ 16GB+1TB 釉青一英寸高动态主摄 个性色卡AI辅助构图 华为鸿蒙智能手机')
          .padding(10)
          .fontWeight(700)
          .fontSize(18)
          .fontColor(Color.Black)
      }.width('100%')

      Text('低于同款均价100%')
        .width('100%')
        .padding({left:10})
        .fontSize(12)
        .fontColor('#cc')
        .margin({bottom:10})
      //   4.商品排行榜
      Row(){
        Row(){
          Image('https://img10.360buyimg.com/img/jfs/t1/20724/31/20118/5100/6386d180Ef7435661/b73a0d4e3f653a22.png').height(20)
          Text('入选6月新机排行榜 top 前20').fontColor('#d91a1f')
        }
        Image('https://m.360buyimg.com/rank/jfs/t1/206038/6/18674/1888/61bc390aE2a46f19b/321efee30a5a8e65.png').height(20)

      }.width('100%')
      .height(30)
      .backgroundColor('#feecea')
      .margin({top:20,bottom:10})
      .borderRadius(15)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({bottom:10})
      //   5.商品分享
      Row(){
        Row(){
          Image('https://img11.360buyimg.com/img/jfs/t1/185923/19/38125/325/64fad71dFeef526f9/f11f072077880807.png')
            .height(20)
          Text('分享')
        }
        Row(){
          if(this.isCollect){
            Image('https://img10.360buyimg.com/img/jfs/t1/102190/6/45012/397/64fad71dF756823e2/d39f976bcb0a7e1f.png')
              .height(20)
          }else {
            Image('https://img10.360buyimg.com/img/jfs/t1/115254/5/42710/538/64fad71dF7984c6ef/95fc02a25845ca69.png')
              .height(20)
          }

          Text('收藏')
        }.onClick(()=>{
          this.isCollect = !this.isCollect;
        })
        Row(){
          Image('https://img11.360buyimg.com/img/jfs/t1/143406/40/38936/332/64fad71dF85fe799a/be862fbe6f0efb0d.png')
            .height(20)
          Text('降价通知')
        }
      }.width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

    }
    .width('100%')
    .height('100%')
    // .backgroundColor(Color.Gray)
  }
}