
export default  interface GoodsItem {
  tags: string;
  cate_id: number;
  goods_id: number;
  goods_name: string;
  goods_name_style: string;
  goods_number: number;
  goods_img: string;
  goods_imgs: string;
  market_price: number;
  shop_price: number;
  is_delete: number;
  is_best: number;
  is_new: number;
  is_hot: number;
  is_sell: number;
  created_at: string;
  updated_at: string;
  total_sell: number;
  info: string;
  choose_state: number;
  latitude: number;
  longitude: number;
  goods_imgs2: string[];
}