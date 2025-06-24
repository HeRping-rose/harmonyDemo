@Entry
@Component
struct GetAppStorage {
  @State message: string = '获取appStorage存储的数据';


  // 常用
  @StorageProp('name') name: string = '';//绑定数据 取出存储的数据
  @StorageProp('age') age: number = 0;

  build() {


    Column() {
      Text(this.message)
      //
      // Text('name:'+AppStorage.get('nickname'))
      // Text('age:'+AppStorage.get('age'))

      Text('name:'+this.name)//常用
      Text('age:'+this.age)

    }
    .height('100%')
    .width('100%')
  }
}