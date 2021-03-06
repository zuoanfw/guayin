<?php
/**
 * tpshop
 * ============================================================================
 * * 版权所有 2015-2027 guaguayin，并保留所有权利。
 * 网站地址: http://www.guaguayin.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 采用最新Thinkphp5助手函数特性实现单字母函数M D U等简写方式
 * ============================================================================
 * $Author:  2015-08-10 $
 */

namespace app\home\controller;

use app\common\logic\FreightLogic;  //运费
use app\common\logic\GoodsPromFactory;
use app\common\logic\SearchWordLogic;
use app\common\logic\GoodsLogic;
use app\common\model\Combination;
use app\common\model\SpecGoodsPrice;
use think\AjaxPage;
use think\Page;
use think\Verify;
use think\Db;
use think\Cookie;

class Sheji extends Base
{
    public function index()
    {
        return $this->fetch();
    }


    /**
     * 商品详情页
     */
    public function goodsInfo()
    {
        //C('TOKEN_ON',true);
        $goodsLogic = new GoodsLogic();
        $goods_id = I("get.id/d");
        $Goods = new \app\common\model\Goods();
        $goods = $Goods::get($goods_id);
        if (empty($goods) || ($goods['is_on_sale'] == 0)  || ($goods['is_sheji'] != "1")|| ($goods['is_virtual'] == 1 && $goods['virtual_indate'] <= time())) {
            $this->error('该商品已经下架', U('Index/index'));
        }
        if (cookie('user_id')) {
            //用户浏览记录
            $goodsLogic->add_visit_log(cookie('user_id'), $goods);
        }
        $goods_images_list = M('GoodsImages')->where("goods_id", $goods_id)->select(); // 商品 图册
        $goods_attribute = M('GoodsAttribute')->getField('attr_id,attr_name'); // 查询属性
        $goods_attr_list = M('GoodsAttr')->where("goods_id", $goods_id)->select(); // 查询商品属性表
        $filter_spec = $goodsLogic->get_spec($goods_id);//规格参数
        $freight_free = tpCache('shopping.freight_free'); // 全场满多少免运费
        $spec_goods_price = M('spec_goods_price')->where("goods_id", $goods_id)->getField("key,item_id,goods_num,price,store_count,goods_send_date,goods_weight,goods_volume,market_price"); // 规格 对应 价格 库存表
        //遍历规格获取价格数组
        foreach ($spec_goods_price as $key=>$vo){
            $spec_goods_price[$key]['price'] = explode(',',$vo['price']);
        }
        //halt($spec_goods_price);
        M('Goods')->where("goods_id", $goods_id)->save(array('click_count' => $goods['click_count'] + 1)); //统计点击数
        //$commentStatistics = $goodsLogic->commentStatistics($goods_id);// 获取某个商品的评论统计
        $point_rate = tpCache('shopping.point_rate');//<!-- 瓜豆兑换比 -->

        //如果 是爆品印品 需读取商品购买数量 价格 拆分
        if($goods['goods_num']){
            $goods_num =  explode(',',$goods['goods_num']);
            $this->assign('goods_num',$goods_num);
            $this->assign('goods_num_str',$goods['goods_num']);
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
    /**
     * 获取可发货地址
     */
    public function getRegion()
    {
        $goodsLogic = new GoodsLogic();
        $region_list = $goodsLogic->getRegionList();//获取配送地址列表
        $region_list['status'] = 1;
        $this->ajaxReturn($region_list);
    }

    /**
     * 爆品商品列表页
     */
    public function goodsList()
    {

        $key = md5($_SERVER['REQUEST_URI'] . I('start_price') . '_' . I('end_price'));
        $html = S($key);
        if (!empty($html)) {
            return $html;
        }

        //删除已选择的设计
        $sheji = M('cart')->where("is_sheji", '1')->delete();// 当前分类

        $filter_param = array(); // 帅选数组                        
        $id = I('get.id/d', 1); // 当前分类id
        $brand_id = I('get.brand_id', 0);
        $spec = I('get.spec', 0); // 规格
        $attr = I('get.attr', ''); // 属性
        $sort = I('get.sort', 'sort'); // 排序
        $sort_asc = I('get.sort_asc', 'desc'); // 排序
        $price = I('get.price', ''); // 价钱
        $start_price = trim(I('post.start_price', '0')); // 输入框价钱
        $end_price = trim(I('post.end_price', '0')); // 输入框价钱
        if ($start_price && $end_price) $price = $start_price . '-' . $end_price; // 如果输入框有价钱 则使用输入框的价钱

        $filter_param['id'] = $id; //加入帅选条件中                       
        $brand_id && ($filter_param['brand_id'] = $brand_id); //加入帅选条件中
        $spec && ($filter_param['spec'] = $spec); //加入帅选条件中
        $attr && ($filter_param['attr'] = $attr); //加入帅选条件中
        $price && ($filter_param['price'] = $price); //加入帅选条件中

        $goodsLogic = new GoodsLogic(); // 前台商品操作逻辑类

        // 分类菜单显示
        $goodsCate = M('GoodsCategory')->where("id", $id)->find();// 当前分类
        //($goodsCate['level'] == 1) && header('Location:'.U('Home/Channel/index',array('cat_id'=>$id))); //一级分类跳转至大分类馆        
        $cateArr = $goodsLogic->get_goods_cate($goodsCate);

        // 帅选 品牌 规格 属性 价格 is_sheji 是否是设计
        $cat_id_arr = getCatGrandson($id);
        $goods_where = ['is_on_sale' => 1,'is_sheji' => 1, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
        $filter_goods_id = Db::name('goods')->where($goods_where)->cache(true)->getField("goods_id", true);
        // 过滤帅选的结果集里面找商品        
        if ($brand_id || $price)// 品牌或者价格
        {
            $goods_id_1 = $goodsLogic->getGoodsIdByBrandPrice($brand_id, $price); // 根据 品牌 或者 价格范围 查找所有商品id
            $filter_goods_id = array_intersect($filter_goods_id, $goods_id_1); // 获取多个帅选条件的结果 的交集
        }
        if ($spec)// 规格
        {
            $goods_id_2 = $goodsLogic->getGoodsIdBySpec($spec); // 根据 规格 查找当所有商品id
            $filter_goods_id = array_intersect($filter_goods_id, $goods_id_2); // 获取多个帅选条件的结果 的交集
        }
        if ($attr)// 属性
        {
            $goods_id_3 = $goodsLogic->getGoodsIdByAttr($attr); // 根据 规格 查找当所有商品id
            $filter_goods_id = array_intersect($filter_goods_id, $goods_id_3); // 获取多个帅选条件的结果 的交集
        }

        $filter_menu = $goodsLogic->get_filter_menu($filter_param, 'goodsList'); // 获取显示的帅选菜单
        $filter_price = $goodsLogic->get_filter_price($filter_goods_id, $filter_param, 'goodsList'); // 帅选的价格期间
        $filter_brand = $goodsLogic->get_filter_brand($filter_goods_id, $filter_param, 'goodsList'); // 获取指定分类下的帅选品牌
        $filter_spec = $goodsLogic->get_filter_spec($filter_goods_id, $filter_param, 'goodsList', 1); // 获取指定分类下的帅选规格
        $filter_attr = $goodsLogic->get_filter_attr($filter_goods_id, $filter_param, 'goodsList', 1); // 获取指定分类下的帅选属性

        $count = count($filter_goods_id);
        $page = new Page($count, 20);
        if ($count > 0) {
            $goods_list = M('goods')->where("goods_id", "in", implode(',', $filter_goods_id))->order([$sort => $sort_asc])->limit($page->firstRow . ',' . $page->listRows)->select();
            $filter_goods_id2 = get_arr_column($goods_list, 'goods_id');
            if ($filter_goods_id2)
                $goods_images = M('goods_images')->where("goods_id", "in", implode(',', $filter_goods_id2))->cache(true)->select();
        }
        if($goods_list) {
            foreach ($goods_list as $key => $vo) {
                if ($vo['goods_num']) {
                    $goods_list[$key]['goods_num'] = explode(',', $vo['goods_num']);
                    $goods_list[$key]['shop_price'] = explode(',', $vo['shop_price']);
                }
            }
        }
        //halt($goods_list);
        $goods_category = M('goods_category')->where('is_show=1')->cache(true)->getField('id,name,parent_id,level'); // 键值分类数组
        $navigate_cat = navigate_goods($id); // 面包屑导航         
        $this->assign('goods_list', $goods_list);
        $this->assign('navigate_cat', $navigate_cat);
        $this->assign('goods_category', $goods_category);
        $this->assign('goods_images', $goods_images);  // 相册图片
        $this->assign('filter_menu', $filter_menu);  // 帅选菜单
        $this->assign('filter_spec', $filter_spec);  // 帅选规格
        $this->assign('filter_attr', $filter_attr);  // 帅选属性
        $this->assign('filter_brand', $filter_brand);  // 列表页帅选属性 - 商品品牌
        $this->assign('filter_price', $filter_price);// 帅选的价格期间
        $this->assign('goodsCate', $goodsCate);
        $this->assign('cateArr', $cateArr);
        $this->assign('filter_param', $filter_param); // 帅选条件
        $this->assign('cat_id', $id);
        $this->assign('page', $page);// 赋值分页输出
        $html = $this->fetch();
        S($key, $html);
        return $html;
    }


    /**
     * 设计下一步选择商品详情页
     */
    public function shejiInfo()
    {

        //获取已选择的设计
        $shejiinfo = M('cart')->where("is_sheji", '1')->find();

        //C('TOKEN_ON',true);
        $goodsLogic = new GoodsLogic();
        $goods_id = I("get.id/d");
        $Goods = new \app\common\model\Goods();
        $goods = $Goods::get($goods_id);
        if (empty($goods) || ($goods['is_on_sale'] == 0) || ($goods['is_virtual'] == 1 && $goods['virtual_indate'] <= time())) {
            $this->error('该商品已经下架', U('Index/index'));
        }
        if (cookie('user_id')) {
            //用户浏览记录
            $goodsLogic->add_visit_log(cookie('user_id'), $goods);
        }
        $goods_images_list = M('GoodsImages')->where("goods_id", $goods_id)->select(); // 商品 图册
        $goods_attribute = M('GoodsAttribute')->getField('attr_id,attr_name'); // 查询属性
        $goods_attr_list = M('GoodsAttr')->where("goods_id", $goods_id)->select(); // 查询商品属性表
        $filter_spec = $goodsLogic->get_spec($goods_id);//规格参数
        $freight_free = tpCache('shopping.freight_free'); // 全场满多少免运费
        $spec_goods_price = M('spec_goods_price')->where("goods_id", $goods_id)->getField("key,item_id,goods_num,price,store_count,goods_send_date,goods_weight,goods_volume,market_price"); // 规格 对应 价格 库存表
        //遍历规格获取价格数组
        foreach ($spec_goods_price as $key=>$vo){
            $spec_goods_price[$key]['price'] = explode(',',$vo['price']);
        }
        //halt($spec_goods_price);
        M('Goods')->where("goods_id", $goods_id)->save(array('click_count' => $goods['click_count'] + 1)); //统计点击数
        //$commentStatistics = $goodsLogic->commentStatistics($goods_id);// 获取某个商品的评论统计
        $point_rate = tpCache('shopping.point_rate');//<!-- 瓜豆兑换比 -->

        //如果 是爆品印品 需读取商品购买数量 价格 拆分
        if($goods['goods_num']){
            $goods_num =  explode(',',$goods['goods_num']);
            $this->assign('goods_num',$goods_num);
            $this->assign('goods_num_str',$goods['goods_num']);
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
        $this->assign('shejiinfo', $shejiinfo);
        //构建手机端URL
        /*$ShareLink = urlencode("http://{$_SERVER['HTTP_HOST']}/index.php?m=Mobile&c=Goods&a=goodsInfo&id={$goods['goods_id']}");
        $this->assign('ShareLink', $ShareLink);*/
        $this->assign('point_rate', $point_rate);
        return $this->fetch();
    }

    /**
     * 设计下一步选择爆品商品列表页
     */
    public function shejiList()
    {

        $key = md5($_SERVER['REQUEST_URI'] . I('start_price') . '_' . I('end_price'));
        $html = S($key);
        if (!empty($html)) {
            return $html;
        }

        //获取已选择的设计
        $shejiinfo = M('cart')->where("is_sheji", '1')->find();
        //halt($sheji);

        $filter_param = array(); // 帅选数组
        $id = I('get.id/d', 1); // 当前分类id
        $brand_id = I('get.brand_id', 0);
        $spec = I('get.spec', 0); // 规格
        $attr = I('get.attr', ''); // 属性
        $sort = I('get.sort', 'sort'); // 排序
        $sort_asc = I('get.sort_asc', 'desc'); // 排序
        $price = I('get.price', ''); // 价钱
        $start_price = trim(I('post.start_price', '0')); // 输入框价钱
        $end_price = trim(I('post.end_price', '0')); // 输入框价钱
        if ($start_price && $end_price) $price = $start_price . '-' . $end_price; // 如果输入框有价钱 则使用输入框的价钱

        $filter_param['id'] = $id; //加入帅选条件中
        $brand_id && ($filter_param['brand_id'] = $brand_id); //加入帅选条件中
        $spec && ($filter_param['spec'] = $spec); //加入帅选条件中
        $attr && ($filter_param['attr'] = $attr); //加入帅选条件中
        $price && ($filter_param['price'] = $price); //加入帅选条件中

        $goodsLogic = new GoodsLogic(); // 前台商品操作逻辑类

        // 分类菜单显示
        $goodsCate = M('GoodsCategory')->where("id", $id)->find();// 当前分类
        //($goodsCate['level'] == 1) && header('Location:'.U('Home/Channel/index',array('cat_id'=>$id))); //一级分类跳转至大分类馆
        $cateArr = $goodsLogic->get_goods_cate($goodsCate);

        // 帅选 品牌 规格 属性 价格
        $cat_id_arr = getCatGrandson($id);
        $goods_where = ['is_on_sale' => 1,'is_sheji' => 0, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
        $filter_goods_id = Db::name('goods')->where($goods_where)->cache(true)->getField("goods_id", true);
        // 过滤帅选的结果集里面找商品
        if ($brand_id || $price)// 品牌或者价格
        {
            $goods_id_1 = $goodsLogic->getGoodsIdByBrandPrice($brand_id, $price); // 根据 品牌 或者 价格范围 查找所有商品id
            $filter_goods_id = array_intersect($filter_goods_id, $goods_id_1); // 获取多个帅选条件的结果 的交集
        }
        if ($spec)// 规格
        {
            $goods_id_2 = $goodsLogic->getGoodsIdBySpec($spec); // 根据 规格 查找当所有商品id
            $filter_goods_id = array_intersect($filter_goods_id, $goods_id_2); // 获取多个帅选条件的结果 的交集
        }
        if ($attr)// 属性
        {
            $goods_id_3 = $goodsLogic->getGoodsIdByAttr($attr); // 根据 规格 查找当所有商品id
            $filter_goods_id = array_intersect($filter_goods_id, $goods_id_3); // 获取多个帅选条件的结果 的交集
        }

        $filter_menu = $goodsLogic->get_filter_menu($filter_param, 'goodsList'); // 获取显示的帅选菜单
        $filter_price = $goodsLogic->get_filter_price($filter_goods_id, $filter_param, 'goodsList'); // 帅选的价格期间
        $filter_brand = $goodsLogic->get_filter_brand($filter_goods_id, $filter_param, 'goodsList'); // 获取指定分类下的帅选品牌
        $filter_spec = $goodsLogic->get_filter_spec($filter_goods_id, $filter_param, 'goodsList', 1); // 获取指定分类下的帅选规格
        $filter_attr = $goodsLogic->get_filter_attr($filter_goods_id, $filter_param, 'goodsList', 1); // 获取指定分类下的帅选属性

        $count = count($filter_goods_id);
        $page = new Page($count, 20);
        if ($count > 0) {
            $goods_list = M('goods')->where("goods_id", "in", implode(',', $filter_goods_id))->order([$sort => $sort_asc])->limit($page->firstRow . ',' . $page->listRows)->select();
            $filter_goods_id2 = get_arr_column($goods_list, 'goods_id');
            if ($filter_goods_id2)
                $goods_images = M('goods_images')->where("goods_id", "in", implode(',', $filter_goods_id2))->cache(true)->select();
        }
        if($goods_list) {
            foreach ($goods_list as $key => $vo) {
                if ($vo['goods_num']) {
                    $goods_list[$key]['goods_num'] = explode(',', $vo['goods_num']);
                    $goods_list[$key]['shop_price'] = explode(',', $vo['shop_price']);
                }
            }
        }
        //halt($goods_list);
        $goods_category = M('goods_category')->where('is_show=1')->cache(true)->getField('id,name,parent_id,level'); // 键值分类数组
        $navigate_cat = navigate_goods($id); // 面包屑导航
        $this->assign('goods_list', $goods_list);
        $this->assign('navigate_cat', $navigate_cat);
        $this->assign('goods_category', $goods_category);
        $this->assign('goods_images', $goods_images);  // 相册图片
        $this->assign('filter_menu', $filter_menu);  // 帅选菜单
        $this->assign('filter_spec', $filter_spec);  // 帅选规格
        $this->assign('filter_attr', $filter_attr);  // 帅选属性
        $this->assign('filter_brand', $filter_brand);  // 列表页帅选属性 - 商品品牌
        $this->assign('filter_price', $filter_price);// 帅选的价格期间
        $this->assign('goodsCate', $goodsCate);
        $this->assign('cateArr', $cateArr);
        $this->assign('filter_param', $filter_param); // 帅选条件
        $this->assign('cat_id', $id);
        $this->assign('shejiinfo', $shejiinfo);
        $this->assign('page', $page);// 赋值分页输出
        $html = $this->fetch();
        S($key, $html);
        return $html;
    }

    /**
     *  查询配送地址，并执行回调函数
     */
    public function region()
    {
        $fid = I('fid/d');
        $callback = I('callback');
        $parent_region = M('region')->field('id,name')->where(array('parent_id' => $fid))->cache(true)->select();
        echo $callback . '(' . json_encode($parent_region) . ')';
        exit;
    }

    /**
     * 商品物流配送和运费
     */
    public function dispatching()
    {
        $goods_id = I('goods_id/d');//143
        $region_id = I('region_id/d');//28242
        $goods_num = I('goods_num/d',1);//商品数量
        $item_id = I("item_id/d",0); // 商品规格id
        $Goods = new \app\common\model\Goods();
        $goods = $Goods->cache(true)->where('goods_id', $goods_id)->find();
        $freightLogic = new FreightLogic();
        $freightLogic->setGoodsModel($goods);
        $freightLogic->setRegionId($region_id);
        $freightLogic->setGoodsNum($goods_num);
        $freightLogic->setSpecGoodsPriceById($item_id);
        $isShipping = $freightLogic->checkShipping();//是否支持配送
        if ($isShipping) {
            $freightLogic->doCalculation();
            $freight = $freightLogic->getFreight();
            $dispatching_data = ['status' => 1, 'msg' => '可配送', 'result' => ['freight' => $freight]];
        } else {
            $dispatching_data = ['status' => 0, 'msg' => '该地区不支持配送', 'result' => ''];
        }
        //halt($dispatching_data);
        $this->ajaxReturn($dispatching_data);
    }
    /**
     * 加入购物车弹出
     */
    public function open_add_cart()
    {
        return $this->fetch();
    }

    /**
     * 全部商品分类
     * @author lxl
     * @time17-4-18
     */
    public function all_category()
    {
        return $this->fetch();
    }

    /**
     * 全部品牌列表
     * @author lxl
     * @time17-4-18
     */
    public function all_brand()
    {
        return $this->fetch();
    }

}