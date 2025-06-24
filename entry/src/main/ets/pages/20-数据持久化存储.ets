//应用级别存储  是在内存中的 当应用关闭时候数据就销毁了  第二次打开时 数据是不存在的
// 持久化存储 persistentStorage
// persistentStorage 是配合AppStorage一起使用 要写在程序的入口处
import { router } from '@kit.ArkUI'


// PersistentStorage.persistProp('name', '') //持久化属性
// PersistentStorage.persistProp('age', 0)


@Entry
@Component
struct Index {

  @StorageLink('name') name: string = ''
  @StorageLink('age') age: number = 0


  build() {
    Column(){
      Text('IndexPage')


      Button('去app存储数据  取数据页面')
        .onClick(()=>{

          // 存取数据
        // AppStorage.SetOrCreate('nickname','ron')
        // AppStorage.SetOrCreate('age',12)

          this.name = 'ron'
          this.age = 12
        router.pushUrl({url:'pages/GetAppStorage'})
      })


     Text('name:'+this.name)
     Text('age:'+this.age)

      Button('修改')
        .onClick(()=>{
          AppStorage.setOrCreate('name','ron')
          AppStorage.setOrCreate('age',12)
        })
    }
  }
}

/*
 *
 *
 *
 *
 * */