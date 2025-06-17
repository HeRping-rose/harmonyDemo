// 封装京东 底部导航栏组件



@Preview //预览装饰器
@Component
 struct TabBar {
  @State isDisabled:boolean = true
  build() {
    Column() {
      Row() {
        //首页
        if(this.isDisabled){
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/67550/26/12426/5094/5d9c4b13Eea435a3f/81328b0609c60a3c.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled})
            .enabled( false)
        }else {
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/81741/30/12345/4140/5d9c4b13E726f0a1e/82c582e7c375e4b3.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled})
            .enabled(true)
        }
        //分类
        if(this.isDisabled){
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/56507/6/12787/3168/5d9c4b12Ef363dd8d/4af32f42575509d8.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled})
        }else {
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/48787/24/12910/3390/5d9c4b12Ee63270e4/4481f5b3dbad979d.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled}).enabled(false)
        }

        //购物车
        if(this.isDisabled){
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/64954/4/12406/3529/5d9c4b12Ee7a82735/f2fe0a88bf344736.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled})
        }else {
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/45205/32/12889/3890/5d9c4b12E7bc2c425/dd60fafbde8542ca.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled}).enabled( false)
        }

        //我的
        if(this.isDisabled){
          Image('https://img12.360buyimg.com/img/s130x100_jfs/t1/203343/14/10880/3097/61641568E184a8e0b/4522f6ec5bb9b10b.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled})
        }else {
          Image('https://img11.360buyimg.com/jdphoto/s130x100_jfs/t1/47480/36/12929/3209/5d9c4b13E97caa63a/4dc0ec8a7e47c2b7.png').width(60).onClick(()=>{this.isDisabled = !this.isDisabled}).enabled(false)
        }


      }
      .width('100%')
      .height(50)
      .backgroundColor(Color.Gray)
      .justifyContent(FlexAlign.SpaceAround)
    }
  }
}
export { TabBar }
