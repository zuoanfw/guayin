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

class Goods extends Base
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
        //构建手机端URL
        $ShareLink = urlencode("http://{$_SERVER['HTTP_HOST']}/index.php?m=Mobile&c=Goods&a=goodsInfo&id={$goods['goods_id']}");
        $this->assign('ShareLink', $ShareLink);
        $this->assign('point_rate', $point_rate);
        return $this->fetch();
    }

    public function activity()
    {
        $goods_id = input('goods_id/d');//商品id
        $item_id = input('item_id/d');//规格id
        $goods_num = input('goods_num/d');//欲购买的商品数量
        $num_key = input('num_key');  //欲购买的商品数量的 数组 对应的key  ，为了获取当前的单价
        $Goods = new \app\common\model\Goods();
        $goods = $Goods::get($goods_id);
        $goodsPromFactory = new GoodsPromFactory();  //商品活动工厂类
        //prom_type  0默认1抢购2团购3优惠促销4预售5虚拟(5其实没用)6拼团7搭配购
        if ($goodsPromFactory->checkPromType($goods['prom_type'])) {  //判断是否有参加活动
            //这里会自动更新商品活动状态，所以商品需要重新查询
            if ($item_id) {
                $specGoodsPrice = SpecGoodsPrice::get($item_id);
                $goodsPromLogic = $goodsPromFactory->makeModule($goods, $specGoodsPrice);
            } else {
                $goodsPromLogic = $goodsPromFactory->makeModule($goods, null);
            }
            if ($goodsPromLogic->checkActivityIsAble()) {
                $goods = $goodsPromLogic->getActivityGoodsInfo();
                $goods['activity_is_on'] = 1;
                $this->ajaxReturn(['status' => 1, 'msg' => '该商品参与活动', 'result' => ['goods' => $goods]]);
            } else {
                if (!empty($goods['price_ladder'])) {
                    $goodsLogic = new GoodsLogic();
                    $goods->shop_price = $goodsLogic->getGoodsPriceByLadder($goods_num, $goods['shop_price'], $goods['price_ladder']);
                }
                $goods['activity_is_on'] = 0;
                $this->ajaxReturn(['status' => 1, 'msg' => '该商品没有参与活动', 'result' => ['goods' => $goods]]);
            }
        }
        if (!empty($goods['price_ladder'])) {
            $goodsLogic = new GoodsLogic();
            $goods->shop_price = $goodsLogic->getGoodsPriceByLadder($goods_num, $goods['shop_price'], $goods['price_ladder']);
        }
        //判断爆品印品 获取 商品数量 和 价格 字符串 第一个值
        if (!empty($goods['goods_num'])) {
            $goods_price = explode(',',$goods['shop_price']);
            $goods->shop_price = $goods_price[$num_key];
        }
        //halt($specGoodsPrice);
        if ($item_id) {  //印品时候用判断规格价格组合 是否有效
            $specGoodsPrice = SpecGoodsPrice::get($item_id);
        }
        if($specGoodsPrice['is_active'] == '1'){
            $this->ajaxReturn(['status' => 0, 'msg' => '无效组合', 'result' => '']);
        }else{
            $this->ajaxReturn(['status' => 1, 'msg' => '该商品没有参与活动', 'result' => ['goods' => $goods]]);
        }

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
        $goods_where = ['is_on_sale' => 1, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
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
     * 爆品快购列表页
     */
    public function fastBuy()
    {

        /*$key = md5($_SERVER['REQUEST_URI'] . I('start_price') . '_' . I('end_price'));
        $html = S($key);
        if (!empty($html)) {
            return $html;
        }*/

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

        //halt($cateArr);exit;
        // 帅选 品牌 规格 属性 价格
        $cat_id_arr = getCatGrandson($id);
        $goods_where = ['is_on_sale' => 1, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
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
        // print_r($filter_menu);
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
        //S($key, $html);
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
     * 商品搜索列表页
     */
    public function search()
    {
        //C('URL_MODEL',0);
        $filter_param = array(); // 帅选数组                        
        $id = I('get.id/d', 8); // 当前分类id
        $brand_id = I('brand_id', 0);
        $sort = I('sort', 'sort'); // 排序
        $sort_asc = I('sort_asc', 'desc'); // 排序
        $price = I('price', ''); // 价钱
        $start_price = trim(I('start_price', '0')); // 输入框价钱
        $end_price = trim(I('end_price', '0')); // 输入框价钱
        if ($start_price && $end_price) $price = $start_price . '-' . $end_price; // 如果输入框有价钱 则使用输入框的价钱
        $q = urldecode(trim(I('q', ''))); // 关键字搜索
        empty($q) && $this->error('请输入搜索词');
        $id && ($filter_param['id'] = $id); //加入帅选条件中                       
        $brand_id && ($filter_param['brand_id'] = $brand_id); //加入帅选条件中
        $price && ($filter_param['price'] = $price); //加入帅选条件中
        $q && ($_GET['q'] = $filter_param['q'] = $q); //加入帅选条件中
        $goodsLogic = new GoodsLogic(); // 前台商品操作逻辑类
        $SearchWordLogic = new SearchWordLogic();
        $where = $SearchWordLogic->getSearchWordWhere($q);
        $where['is_on_sale'] = 1;
        /*Db::name('search_word')->where('keywords', $q)->setInc('search_num');
        //通过搜索关键词
        $goodsHaveSearchWord = Db::name('goods')->where($where)->count();
        if ($goodsHaveSearchWord) {
            //如果搜索的关键词商品存在记录关键词
            $SearchWordIsHave = Db::name('search_word')->where('keywords', $q)->find();
            if ($SearchWordIsHave) {
                Db::name('search_word')->where('id', $SearchWordIsHave['id'])->update(['goods_num' => $goodsHaveSearchWord]);
            } else {
                $SearchWordData = [
                    'keywords' => $q,
                    'pinyin_full' => $SearchWordLogic->getPinyinFull($q),
                    'pinyin_simple' => $SearchWordLogic->getPinyinSimple($q),
                    'search_num' => 1,
                    'goods_num' => $goodsHaveSearchWord
                ];
                Db::name('search_word')->insert($SearchWordData);
            }
        }*/
        //爆品分类下的商品id
        if ($id) {
            $cat_id_arr = getCatGrandson($id);//获取某个商品分类的 儿子 孙子  重子重孙 的 id
            $where['cat_id'] = array('in', implode(',', $cat_id_arr));
        }
        $search_goods = M('goods')->where($where)->getField('goods_id,cat_id');
        $filter_goods_id1 = array_keys($search_goods);

        //包装分类下的商品id
        $cat_list = M('goods_category')->where(['is_show' => 1,'level'=>1,'cat_group'=>1])->field('id')->order('sort_order')->select();//所有分类
        //halt($cat_list);
        $cat_id_arrs = array();
        foreach ($cat_list as $k=>$v){
            $cat_id_arr = getCatGrandson($v['id']); //包装专区  获取某个商品分类的 儿子 孙子  重子重孙 的 id
            $cat_id_arrs = array_merge($cat_id_arrs,$cat_id_arr);
        }
        $where['cat_id'] = array('in', implode(',', $cat_id_arrs));
        $search_goods = M('goods')->where($where)->getField('goods_id,cat_id');
        $filter_goods_id2 = array_keys($search_goods);

        $goods_list1 = M('goods')->where(['is_on_sale' => 1, 'goods_id' => ['in', implode(',', $filter_goods_id1)]])->order([$sort => $sort_asc])->select();
        $goods_list2 = M('goods')->where(['is_on_sale' => 1, 'goods_id' => ['in', implode(',', $filter_goods_id2)]])->order([$sort => $sort_asc])->select();

        if($goods_list1){
            //爆品印品 要拆分数量和价格
            foreach ($goods_list1 as $key => $vo){
                if($vo['goods_num']){
                    $goods_list1[$key]['goods_num'] = explode(',',$vo['goods_num']);
                    $goods_list1[$key]['shop_price'] = explode(',',$vo['shop_price']);
                }
            }
        }
        if($goods_list2){
            //包装商品 要加包装标示
            foreach ($goods_list2 as $key => $vo){
                    $goods_list2[$key]['goods_baozhuang'] = '1';
            }
        }

        $goods_list = array_merge($goods_list1,$goods_list2);

        $filter_goods_id_img = get_arr_column($goods_list, 'goods_id'); //获取数组中的某一列
        if ($filter_goods_id_img)
            $goods_images = M('goods_images')->where("goods_id", "in", implode(',', $filter_goods_id_img))->select();


        $this->assign('goods_list', $goods_list);
        $this->assign('goods_images', $goods_images);  // 相册图片
        $this->assign('filter_param', $filter_param); // 帅选条件
        $this->assign('cat_id', $id);
        $this->assign('q', I('q'));
        C('TOKEN_ON', false);
        return $this->fetch();
    }

    /**
     * 商品咨询ajax分页
     */
    public function ajax_consult()
    {
        $goods_id = I("goods_id/d", '0');
        $consult_type = I('consult_type', '0'); // 0全部咨询  1 商品咨询 2 支付咨询 3 配送 4 售后
        $where = ['parent_id' => 0, 'goods_id' => $goods_id, 'is_show' => 1];
        $consult_type > 0 ? $where['consult_type'] = $consult_type : false;
        $goodsConsultModel = new  \app\common\model\GoodsConsult();
        $count = $goodsConsultModel->where($where)->count();
        $page = new AjaxPage($count, 5);
        $consultList = $goodsConsultModel->where($where)->order("id desc")->limit($page->firstRow, $page->listRows)->order('add_time desc')->select();
        $this->assign('consultList', $consultList);// 商品咨询
        $this->assign('page', $page);// 赋值分页输出
        return $this->fetch();
    }

    /**
     * 商品评论ajax分页
     */
    public function ajaxComment()
    {
        $goods_id = I("goods_id/d", '0');
        $commentType = I('commentType', '1'); // 1 全部 2好评 3 中评 4差评
        $where = ['is_show' => 1, 'goods_id' => $goods_id, 'parent_id' => 0];
        if ($commentType == 5) {
            $where['img'] = ['<>', ''];
        } else {
            $typeArr = array('1' => '0,1,2,3,4,5', '2' => '4,5', '3' => '3', '4' => '0,1,2');
            $where['ceil((deliver_rank + goods_rank + service_rank) / 3)'] = ['in', $typeArr[$commentType]];
        }
        $count = M('Comment')->where($where)->count();
        $page = new AjaxPage($count, 10);
        $show = $page->show();

        $list = M('Comment')->alias('c')->join('__USERS__ u', 'u.user_id = c.user_id', 'LEFT')->where($where)->order("sort asc , add_time desc")->limit($page->firstRow . ',' . $page->listRows)->select();

//        $replyList = M('Comment')->where(['is_show'=>1,'goods_id'=>$goods_id,'parent_id'=>['>',0]])->order("add_time desc")->select();

        foreach ($list as $k => $v) {
            $list[$k]['img'] = unserialize($v['img']); // 晒单图片
            $replyList[$v['comment_id']] = M('Comment')->where(['is_show' => 1, 'goods_id' => $goods_id, 'parent_id' => $v['comment_id']])->order("add_time desc")->select();
        }
        $this->assign('commentlist', $list);// 商品评论
        $this->assign('replyList', $replyList); // 管理员回复
        $this->assign('page', $show);// 赋值分页输出
        return $this->fetch();
    }

    /**
     *  商品咨询
     */
    public function consult()
    {
        header('Content-Type:application/json; charset=utf-8');
        $goods_id = input("goods_id/d", '0'); // 商品id
        $company = trim(input('company', ''));
        $company_address = trim(input('company_address', ''));
        $consult_type = input("consult_type", '1'); // 商品咨询类型
        $linkname = trim(input("linkname", '')); // 网友咨询
        $username = trim(input("username")); // 网友咨询 电话
        $content = trim(input("content", '')); // 咨询内容
        $verify_code = input('verify_code');
        if (strlen($content) > 500) {
            $this->ajaxReturn(['status' => 0, 'msg' => '内容不得超过500字符']);
        }
        if($verify_code){
            $verify = new Verify();
            if (!$verify->check($verify_code, 'consult')) {
                $this->ajaxReturn(['status' => 0, 'msg' => '验证码错误']);
            }
        }
        if(!check_mobile($username) && !check_telephone($username) ){
            $this->ajaxReturn(['status' => 0, 'msg' => '请输入有效的联系方式']);
        }
        $data = array(
            'goods_id' => $goods_id,
            'consult_type' => $consult_type,
            'company' => $company,
            'company_address' => $company_address,
            'username' => $username,
            'linkname' => $linkname,
            'content' => $content,
            'is_show' => 1,
            'add_time' => time(),
        );
        //halt($data);
        Db::name('goodsConsult')->add($data);
        $this->ajaxReturn(['status' => 1, 'msg' => '内容已提交!']);
    }

    /**
     * 用户收藏商品
     */
    public function collect_goods()
    {
        $goods_ids = I('goods_ids/a', []);
        if (empty($goods_ids)) {
            $this->ajaxReturn(['status' => 0, 'msg' => '请至少选择一个商品', 'result' => '']);
        }
        $goodsLogic = new GoodsLogic();
        $result = [];
        foreach ($goods_ids as $key => $val) {
            $result[] = $goodsLogic->collect_goods(cookie('user_id'), $val);
        }
        $this->ajaxReturn(['status' => 1, 'msg' => '已添加至我的收藏', 'result' => $result]);
    }

    /**
     * 加入购物车弹出
     */
    public function open_add_cart()
    {
        return $this->fetch();
    }

    /**
     * 瓜豆商城
     */
    public function integralMall()
    {
        $cat_id = I('get.id/d');
        $minValue = I('get.minValue');
        $maxValue = I('get.maxValue');
        $brandType = I('get.brandType');
        $point_rate = tpCache('shopping.point_rate');
        $is_new = I('get.is_new', 0);
        $exchange = I('get.exchange', 0);
        $goods_where = array(
            'is_on_sale' => 1,  //是否上架
            'is_virtual' => 0,
        );
        //瓜豆兑换筛选
        $exchange_integral_where_array = array(array('gt', 0));
        // 分类id
        if (!empty($cat_id)) {
            $goods_where['cat_id'] = array('in', getCatGrandson($cat_id));
        }
        //瓜豆截止范围
        if (!empty($maxValue)) {
            array_push($exchange_integral_where_array, array('elt', $maxValue));
        }
        //瓜豆起始范围
        if (!empty($minValue)) {
            array_push($exchange_integral_where_array, array('egt', $minValue));
        }
        //瓜豆+金额
        if ($brandType == 1) {
            array_push($exchange_integral_where_array, array('exp', ' < shop_price* ' . $point_rate));
        }
        //全部瓜豆
        if ($brandType == 2) {
            array_push($exchange_integral_where_array, array('exp', ' = shop_price* ' . $point_rate));
        }
        //新品
        if ($is_new == 1) {
            $goods_where['is_new'] = $is_new;
        }
        //我能兑换
        $user_id = cookie('user_id');
        if ($exchange == 1 && !empty($user_id)) {
            $user_pay_points = intval(M('users')->where(array('user_id' => $user_id))->getField('pay_points'));
            if ($user_pay_points !== false) {
                array_push($exchange_integral_where_array, array('lt', $user_pay_points));
            }
        }

        $goods_where['exchange_integral'] = $exchange_integral_where_array;
        $goods_list_count = M('goods')->where($goods_where)->count();   //总页数
        $page = new Page($goods_list_count, 15);
        $goods_list = M('goods')->where($goods_where)->limit($page->firstRow . ',' . $page->listRows)->select();
        $goods_category = M('goods_category')->where(array('level' => 1))->select();

        $this->assign('goods_list', $goods_list);
        $this->assign('page', $page->show());
        $this->assign('goods_list_count', $goods_list_count);
        $this->assign('goods_category', $goods_category);//商品1级分类
        $this->assign('point_rate', $point_rate);//兑换率
        $this->assign('nowPage', $page->nowPage);// 当前页
        $this->assign('totalPages', $page->totalPages);//总页数
        return $this->fetch();
    }
    /**
     * 瓜豆商城列表
     */
    public function integralList()
    {
        $cat_id = I('get.id/d');
        $minValue = I('get.minValue');
        $maxValue = I('get.maxValue');
        $brandType = I('get.brandType');
        $point_rate = tpCache('shopping.point_rate');
        $is_new = I('get.is_new', 0);
        $exchange = I('get.exchange', 0);
        $goods_where = array(
            'is_on_sale' => 1,  //是否上架
            'is_virtual' => 0,
        );
        //瓜豆兑换筛选
        $exchange_integral_where_array = array(array('gt', 0));
        // 分类id
        if (!empty($cat_id)) {
            $goods_where['cat_id'] = array('in', getCatGrandson($cat_id));
        }
        //瓜豆截止范围
        if (!empty($maxValue)) {
            array_push($exchange_integral_where_array, array('elt', $maxValue));
        }
        //瓜豆起始范围
        if (!empty($minValue)) {
            array_push($exchange_integral_where_array, array('egt', $minValue));
        }
        //瓜豆+金额
        if ($brandType == 1) {
            array_push($exchange_integral_where_array, array('exp', ' < shop_price* ' . $point_rate));
        }
        //全部瓜豆
        if ($brandType == 2) {
            array_push($exchange_integral_where_array, array('exp', ' = shop_price* ' . $point_rate));
        }
        //新品
        if ($is_new == 1) {
            $goods_where['is_new'] = $is_new;
        }
        //我能兑换
        $user_id = cookie('user_id');
        if ($exchange == 1 && !empty($user_id)) {
            $user_pay_points = intval(M('users')->where(array('user_id' => $user_id))->getField('pay_points'));
            if ($user_pay_points !== false) {
                array_push($exchange_integral_where_array, array('lt', $user_pay_points));
            }
        }

        $goods_where['exchange_integral'] = $exchange_integral_where_array;
        $goods_list_count = M('goods')->where($goods_where)->count();   //总页数
        $page = new Page($goods_list_count, 15);
        $goods_list = M('goods')->where($goods_where)->limit($page->firstRow . ',' . $page->listRows)->select();
        $goods_category = M('goods_category')->where(array('level' => 1))->select();

        $this->assign('goods_list', $goods_list);
        $this->assign('page', $page->show());
        $this->assign('goods_list_count', $goods_list_count);
        $this->assign('goods_category', $goods_category);//商品1级分类
        $this->assign('point_rate', $point_rate);//兑换率
        $this->assign('nowPage', $page->nowPage);// 当前页
        $this->assign('totalPages', $page->totalPages);//总页数
        return $this->fetch();
    }
    /**
     * 瓜豆商城商品详情页
     */
    public function integralInfo()
    {
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
        //$filter_spec = $goodsLogic->get_spec($goods_id);//规格参数
        $freight_free = tpCache('shopping.freight_free'); // 全场满多少免运费
        $spec_goods_price = M('spec_goods_price')->where("goods_id", $goods_id)->getField("key,item_id,price,store_count,goods_send_date,goods_weight,goods_volume,market_price"); // 规格 对应 价格 库存表
        M('Goods')->where("goods_id", $goods_id)->save(array('click_count' => $goods['click_count'] + 1)); //统计点击数
        //$commentStatistics = $goodsLogic->commentStatistics($goods_id);// 获取某个商品的评论统计
        $point_rate = tpCache('shopping.point_rate');//<!-- 瓜豆兑换比 -->
        $this->assign('freight_free', $freight_free);// 全场满多少免运费
        $this->assign('spec_goods_price', json_encode($spec_goods_price, true)); // 规格 对应 价格 库存表
        $this->assign('navigate_goods', navigate_goods($goods_id, 1));// 面包屑导航
        //$this->assign('commentStatistics', $commentStatistics);//评论概览
        $this->assign('goods_attribute', $goods_attribute);//属性值
        $this->assign('goods_attr_list', $goods_attr_list);//属性列表
        //$this->assign('filter_spec', $filter_spec);//规格参数
        //var_dump($filter_spec);exit;
        $this->assign('goods_images_list', $goods_images_list);//商品缩略图
        //$this->assign('siblings_cate', $goodsLogic->get_siblings_cate($goods['cat_id']));//相关分类
        //$this->assign('look_see', $goodsLogic->get_look_see($goods));//看了又看
        $this->assign('goods', $goods);
        //构建手机端URL
        //$ShareLink = urlencode("http://{$_SERVER['HTTP_HOST']}/index.php?m=Mobile&c=Goods&a=goodsInfo&id={$goods['goods_id']}");
        //$this->assign('ShareLink', $ShareLink);
        $this->assign('point_rate', $point_rate);
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


    /**
     * 获取搭配购列表
     * @author lxl
     * @time17-4-18
     */
    public function combination()
    {
        $goods_id = input('goods_id/d');
        $item_id = input('item_id/d', 0);
        if (empty($goods_id)) {
            $this->ajaxReturn(['status' => 0, 'msg' => '参数错误']);
        }
        $master_combination_ids = Db::name('combination_goods')->distinct(true)->where(['goods_id' => $goods_id, 'item_id' => $item_id])->column('combination_id');
        if (empty($master_combination_ids)) {
            $this->ajaxReturn(['status' => 1, 'msg' => '没有数据', 'result' => []]);
        }
        $Combination = new Combination();
        $combination_list = $Combination
            ->with(['combination_goods'])
            ->where(['is_on_sale' => 1, 'start_time' => ['lt', time()], 'end_time' => ['gt', time()], 'combination_id' => ['IN', $master_combination_ids]])
            ->select();
        if ($combination_list) {
            $combination_list = collection($combination_list)->toArray();
            //遍历拿头像
            foreach ($combination_list as $k => $v) {
                $combination_list[$k]['count_price'] = 0;
                foreach ($v['combination_goods'] as $kk => $vv) {
                    $spce = '';
                    if ($vv['item_id']) {
                        //有规格先查规格的图片
                        $spce = getGoodsSpecImg($vv['goods_id'], $vv['item_id']);
                        $combination_list[$k]['combination_goods'][$kk]['original_img'] = $spce;
                    }
                    if ($spce == '') {
                        //没有规格的图片就拿商品的图片
                        $combination_list[$k]['combination_goods'][$kk]['original_img'] = goods_thum_images($vv['goods_id'], 248, 248);
                    }

                    if ($vv['goods_id'] == $goods_id && $vv['item_id'] == $item_id) {
                        $combination_list[$k]['combination_goods'][$kk]['selected'] = true;
                    } else {
                        $combination_list[$k]['combination_goods'][$kk]['selected'] = false;
                    }
                    $combination_list[$k]['count_price'] += $vv['original_price'] - $vv['price'];
                }
            }
            $this->assign('combination', $combination_list);
            $this->ajaxReturn(['status' => 1, 'msg' => '获取成功', 'result' => $combination_list]);
        } else {
            $this->ajaxReturn(['status' => 1, 'msg' => '没有数据', 'result' => []]);
        }
    }
}