//简单计算器案例
@Entry
@Component
struct Index {
  //使用Array
  button: Array<Array<number|string>> = [
    [7, 8, 9, '+'],
    [4, 5, 6, '-'],
    [1, 2, 3, '×'],
    [0, 'AC', '=', '÷']
  ]
  //运算数、运算符和结果定义
  public num: number[] = []
  public operator: string[] = []
  @State equation: string = ''
  @State result: string = '0'
  //拼接运算数
  public currentNumber: string = ''
  //是否是新的运算数
  public isNewNumber: boolean = true

  //封装函数，进行计算
  onResult(data: string) {
    //计算结果
    if (data === '=') {
      if (this.currentNumber) {
        this.num.push(Number(this.currentNumber))
        this.currentNumber = ""
      }
      //索引：  0  1  2  3
      //运算数：12 3  23 45
      //运算符：  +  *  -
      for(let i = 0; i < this.operator.length; i++) {
        switch (this.operator[i]) {
          case '×':
            //保存运算结果
            this.num[i] = Number(this.num[i]) * Number(this.num[i+1])
            //删除运算符
            this.operator.splice(i,1)
            //删除num中index+1的元素
            this.num.splice(i+1,1)
            i--
            break
          case '÷':
            this.num[i] = Number(this.num[i]) / Number(this.num[i+1])
            this.operator.splice(i,1)
            this.num.splice(i+1,1)
            i--
            break
          default:
            break
        }
      }
      for(let i = 0; i < this.operator.length; i++) {
        switch (this.operator[i]) {
          case '+':
            this.num[i] = Number(this.num[i]) + Number(this.num[i+1])
            this.operator.splice(i,1)
            this.num.splice(i+1,1)
            i--
            break
          case '-':
            this.num[i] = Number(this.num[i]) - Number(this.num[i+1])
            this.operator.splice(i,1)
            this.num.splice(i+1,1)
            i--
            break
          default:
            break
        }
      }
      this.result = String(this.num)
      return
    }
    //清除操作
    if (data === 'AC') {
      this.num = []
      this.operator = []
      this.equation = ''
      this.result = '0'
      this.currentNumber = ""
      this.isNewNumber = true
      this.num.length=0
      this.operator.length=0
      return
    }
    //判断点击的是否是'+','-','x','÷'
    if (['+','-','×','÷'].includes(data)) {
      //拼接运算式
      this.equation += data
      if (this.currentNumber) {
        this.num.push(Number(this.currentNumber))
        this.currentNumber = ""
      }
      //将运算符存入operator
      this.operator.push(data)
      this.isNewNumber = true
      return
    }
    if (['0','1','2','3','4','5','6','7','8','9'].includes(data)) {
      //拼接运算式
      this.equation += data
      if (this.isNewNumber) {
        this.currentNumber = data
        this.isNewNumber = false
      } else {
        this.currentNumber += data
      }
    }
  }

  build() {
    Column({space: 5}) {
      //结果栏
      Text(this.equation)
        .width('100%')
        .fontColor(Color.White)
        .fontSize(40)
        .fontWeight(300)
        .textAlign(TextAlign.End)
        .align(Alignment.Bottom)
        .layoutWeight(3)
      Text(this.result)
        .width('100%')
        .fontColor(Color.White)
        .fontSize(60)
        .fontWeight(500)
        .textAlign(TextAlign.End)
        .layoutWeight(1)
      //按钮栏
      //遍历[7, 8, 9, '+']第一层
      ForEach(this.button, (item1: Array<number|string>) => {
        Row() {
          //遍历7第二层
          ForEach(item1, (item2: number|string, index2: number) => {
            Text(item2.toString())
              .width(75).height(75)
              .borderRadius(75)
              .backgroundColor(index2 == 3 ? '#daaa60' : '#333')
              .fontColor(Color.White)
              .fontSize(40)
              .textAlign(TextAlign.Center)
              .onClick(() => {
                this.onResult(item2.toString())
              })
              .stateStyles({
                pressed: {
                  .backgroundColor('#ccc')
                }
              })
          })
        }.width('100%')
        .justifyContent(FlexAlign.SpaceEvenly)
      })
    }.width('100%').height('100%')
    .backgroundColor(Color.Black)
  }
}