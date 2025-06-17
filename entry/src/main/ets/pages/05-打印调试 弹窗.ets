// 打印调试 Text()中是字符串 console.log()也是字符串
// AlertDialog.show({message: }) message:之后也是字符串
// this.getUIContext().showAlertDialog({message:this.msg})

@Entry
@Component
struct Index {
  @State msg: string = "hello world"
  @State num: number = 0
  @State arr:string[]=["1","2","3"]
  build() {
    Column(){
      Text(this.msg)
      Text(this.num.toString())//转为字符串
      Text(JSON.stringify(this.arr))//转为字符串
      Button('打印')
        .onClick(()=>{
          this.num++
          // 打印 弹窗最新
          this.getUIContext().showAlertDialog({message:this.msg})
          console.log(this.msg)
          console.log(this.num.toString())
          console.log(JSON.stringify(this.arr))
          AlertDialog.show({message:this.msg})
          AlertDialog.show({message:this.num.toString()})
          AlertDialog.show({message:JSON.stringify(this.arr)})
        })
      Checkbox()
      Radio({group:"1",value:"1"})
      Radio({group:"1",value:"2"})

    }
  }
}