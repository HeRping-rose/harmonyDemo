//商品类数据类型
@Observed
export default  class GoodsItem {
  name:string
  img: string
  price:number
  buyNum:number
  checked: boolean
  constructor(name:string,img: string,price:number,buyNum:number,checked: boolean) {
    this.name = name
    this.img = img
    this.price = price
    this.buyNum = buyNum
    this.checked = checked
  }
}