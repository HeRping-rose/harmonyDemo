
// 待办列表

class Todo {
  public id:number
  public name:string
  public completed:boolean
  constructor(id: number, name: string, completed: boolean) {
    this.id = id
    this.name = name
    this.completed = completed
  }
}

@Entry
@Component
struct Index {
  @State todoList:Todo[] = [
    new Todo(1,'早起晨练',true),
    new Todo(2,'准备早餐',false),
    new Todo(3,'阅读名著',true),
    new Todo(4,'学习React',false),
    new Todo(5,'学习Vue',false)
  ]
  @State task:string = ''

  build() {
    Column({space:10}){
      //标题
      Text('待办').fontSize(40).width('100%').fontColor(Color.Black).fontWeight(FontWeight.Bold)
      //输入框

      Row({space:10}){
        TextInput({placeholder:'请输入待办事项',text:this.task}).fontSize(20).width('80%').backgroundColor(Color.White).layoutWeight(1).height(50)
          .onChange((value)=>{
            this.task = value
            console.log(this.task)
          })
        Button('添加').height(50)
          .type(ButtonType.ROUNDED_RECTANGLE)//圆角矩形
          .onClick(()=>{
            //添加待办事项
            if(this.task != ''){
              this.todoList.push(new Todo(this.todoList.length+1,this.task,false))
              this.task = ''
            }
          })
        Button('删除').height(50)
          .type(ButtonType.ROUNDED_RECTANGLE)//圆角矩形
          .onClick(()=>{
            //添加待办事项
              this.todoList.shift()
          })
      }
      // 列表

      ForEach(this.todoList,(item:Todo,index:number)=>{
        Row({space:10}){
          Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)///圆角矩形
            .select( item.completed )
            .onChange((value)=>{
              console.log(value.toString())
              let temp=this.todoList[index]//获取当前数据
              this.todoList[index]= new Todo(temp.id,temp.name,!temp.completed)//改变状态
          })
          Text(item.name).fontSize(20)
            .fontColor(item.completed?Color.Gray:Color.Black)
            .decoration({
              type: item.completed?TextDecorationType.LineThrough:TextDecorationType.None,
              color: Color.Gray,
              style: TextDecorationStyle.SOLID
            })//删除线  装饰线
        }
        .width('100%')
        .height(60)
        .borderRadius(20)
        .backgroundColor(Color.White)
        .padding(10)
      })

      //
      // Row({space:10}){
      //   Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)
      //     .select( true )
      //   Text('早起晨练').fontSize(20).fontColor(Color.Gray)
      //     .decoration({
      //       type: TextDecorationType.LineThrough,
      //       color: Color.Gray,
      //       style: TextDecorationStyle.SOLID
      //     })//删除线  装饰线
      // }
      // .width('100%')
      // .height(60)
      // .borderRadius(20)
      // .backgroundColor(Color.White)
      // .padding(10)
      //
      // Row({space:10}){
      //   Checkbox().shape(CheckBoxShape.ROUNDED_SQUARE)
      //     .select( false )
      //   Text('准备早餐').fontSize(20).fontColor(Color.Black)
      // }
      // .width('100%')
      // .height(60)
      // .borderRadius(20)
      // .backgroundColor(Color.White)
      // .padding(10)



    }
    .width('100%')
    .height('100%')
    .backgroundColor('#edf2f5')
    .padding(20)
  }
}
