<?php
/**
 * tpshop
 * ============================================================================
 * * 版权所有 2015-2027 guaguayin，并保留所有权利。
 * ----------------------------------------------------------------------------
 * 采用最新Thinkphp5助手函数特性实现单字母函数M D U等简写方式
 * ============================================================================
 * $Author:  2015-08-10 $
 *
 */ 
namespace app\home\controller;
use app\common\logic\SearchWordLogic;
use app\common\logic\GoodsLogic;
use app\common\model\SpecGoodsPrice;
use think\AjaxPage;
use think\Page;
use think\Verify;
use think\Image;
use think\Db;
class Yinpin extends Base {
    
    public function index(){      

        $cat_id_arr = getCatGrandson('15'); //包装专区  获取某个商品分类的 儿子 孙子  重子重孙 的 id

        $printsgoods = S('printsgoods');
        if(empty($printsgoods))
        {
            $goods_where = ['is_on_sale' => 1, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
            $printsgoods = Db::name('goods')->where($goods_where)->cache(true)->select();
            S('printsgoods',$printsgoods,TPSHOP_CACHE_TIME);
        }
        if($printsgoods){
              $this->assign("printsgoods",$printsgoods);
        }
        //halt($printsgoods);
        return $this->fetch();
    }

    /**
     * 商品详情页
     */
    public function yinpinInfo()
    {
        //C('TOKEN_ON',true);
        $goodsLogic = new GoodsLogic();
        $goods_id = I("get.id/d");
        $Goods = new \app\common\model\Goods();
        $goods = $Goods::get($goods_id);
        if (empty($goods) || ($goods['is_on_sale'] == 0) || ($goods['is_virtual'] == 1 && $goods['virtual_indate'] <= time())) {
            $this->error('该商品已经下架', U('Index/index'));
        }
        /*if (cookie('user_id')) {
            //用户浏览记录
            $goodsLogic->add_visit_log(cookie('user_id'), $goods);
        }*/
        $goods_images_list = M('GoodsImages')->where("goods_id", $goods_id)->select(); // 商品 图册
        $goods_attribute = M('GoodsAttribute')->getField('attr_id,attr_name'); // 查询属性
        $goods_attr_list = M('GoodsAttr')->where("goods_id", $goods_id)->select(); // 查询商品属性表
        $filter_spec = $goodsLogic->get_spec($goods_id);//规格参数
        $freight_free = tpCache('shopping.freight_free'); // 全场满多少免运费
        $spec_goods_price = M('spec_goods_price')->where("goods_id", $goods_id)->getField("key,item_id,goods_num,price,store_count,goods_send_date,goods_weight,goods_volume,market_price,is_active"); // 规格 对应 价格 库存表
        //遍历规格获取价格数组
        foreach ($spec_goods_price as $key=>$vo){
            $spec_goods_price[$key]['price'] = explode(',',$vo['price']);
        }
        //halt($spec_goods_price);
        //M('Goods')->where("goods_id", $goods_id)->save(array('click_count' => $goods['click_count'] + 1)); //统计点击数
        //$commentStatistics = $goodsLogic->commentStatistics($goods_id);// 获取某个商品的评论统计
        $point_rate = tpCache('shopping.point_rate');//<!-- 瓜豆兑换比 -->

        //如果 是爆品印品 需读取商品购买数量 价格 拆分
        if($goods['goods_num']){
            $goods_num =  explode(',',$goods['goods_num']);
            $this->assign('goods_num',$goods_num);
            $goods_price = explode(',',$goods['shop_price']);
            $this->assign('goods_price',json_encode($goods_price,true));
        }

        $this->assign('freight_free', $freight_free);// 全场满多少免运费
        $this->assign('spec_goods_price', json_encode($spec_goods_price, true)); // 规格 对应 价格 库存表
        $this->assign('navigate_goods', navigate_goods($goods_id, 1));// 面包屑导航
        //$this->assign('commentStatistics', $commentStatistics);//评论概览
        $this->assign('goods_attribute', $goods_attribute);//属性值
        $this->assign('goods_attr_list', $goods_attr_list);//属性列表
        $this->assign('filter_spec', $filter_spec);//规格参数
        //var_dump($filter_spec);exit;
        $this->assign('goods_images_list', $goods_images_list);//商品缩略图
        $this->assign('siblings_cate', $goodsLogic->get_siblings_cate($goods['cat_id']));//相关分类
        //$this->assign('look_see', $goodsLogic->get_look_see($goods));//看了又看
        $this->assign('goods', $goods);
        //构建手机端URL
        $ShareLink = urlencode("http://{$_SERVER['HTTP_HOST']}/index.php?m=Mobile&c=Goods&a=goodsInfo&id={$goods['goods_id']}");
        $this->assign('ShareLink', $ShareLink);
        $this->assign('point_rate', $point_rate);
        return $this->fetch();
    }
    
}