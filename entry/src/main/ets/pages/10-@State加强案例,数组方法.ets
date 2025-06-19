
//@State 加强理解练习案例

/*
 * 复杂类型具有嵌套结构
 *
 * */
class  Goods {
  public id: number
  public name: string
  public price: number

  constructor(id: number, name: string, price: number) {
    this.id = id
    this.name = name
    this.price = price
  }
}


@Entry
@Component
struct Index {
  @State goodsList: Goods[] = [
    new Goods(1,'张三',10),
    new Goods(2,'张三',10),
    new Goods(3,'张三',10),
  ]


  build() {
    Column() {
      Text(JSON.stringify(this.goodsList))
        .onClick(()=>{
          // this.goodsList.push(new Goods(4,'李四',10)) //作用：向数组的末尾添加一个或多个元素。返回值：返回新数组的长度。
          // this.goodsList.pop()//删除  作用：删除数组的最后一个元素。返回值：返回被删除的元素。
          // this.goodsList.shift()//删除  作用：删除数组的第一个元素。返回值：返回被删除的元素
          // this.goodsList.unshift(new Goods(4,'张三',10))//添加  作用：向数组的开头添加一个或多个元素。返回值：返回新数组的长度。
          // this.goodsList.splice(0,1,new Goods(4,'张三',10))//从指定位置开始，删除或替换数组中的元素，也可以插入新元素。 参数说明：第一个参数：起始索引；第二个参数：要删除的元素个数；后续参数（可选）：要添加的新元素；返回值：返回被删除的元素组成的数组。
//使用 @State 的情况下，ArkTS 的响应式机制不会自动检测到数组的下标赋值或直接通过 .length = xxx 改变长度的操作。因此推荐使用上述数组方法来触发 UI 更新。

          let temp =this.goodsList[0]
          this.goodsList[0] = new Goods(temp.id,temp.name,++temp.price)
          this.goodsList[0] = new Goods(temp.id,temp.name,temp.price+1)
        })
    }
  }
}