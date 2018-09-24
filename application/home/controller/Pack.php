<?php
/**
 * tpshop
 * ============================================================================
 * * 版权所有 2015-2027 guaguayin，并保留所有权利。
 * 网站地址: http://www.tpshop.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 个人学习免费, 如果商业用途务必到guaguayin官网购买授权.
 * 采用最新Thinkphp5助手函数特性实现单字母函数M D U等简写方式
 * ============================================================================
 * $Author:  2015-08-10 $
 *
 */ 
namespace app\home\controller;
use think\Page;
use think\Verify;
use think\Image;
use think\Db;
class Pack extends Base {
    
    public function index(){      

        // 如果是手机跳转到 手机模块
        if(isMobile()){
            redirect(U('Mobile/Index/index'));
        }
        $hot_goods = $hot_cate = $cateList = $recommend_goods = array();
        $sql = "select a.goods_name,a.goods_id,a.shop_price,a.goods_remark,a.cat_id,b.parent_id_path,b.name from ".C('database.prefix')."goods as a left join ";
        $sql .= C('database.prefix')."goods_category as b on a.cat_id=b.id where a.is_hot=1 and a.is_on_sale=1 order by a.sort";//二级分类下热卖商品       
        $index_hot_goods = S('index_hot_goods');
        if(empty($index_hot_goods))
        {
            $index_hot_goods = Db::query($sql);//首页热卖商品
            S('index_hot_goods',$index_hot_goods,TPSHOP_CACHE_TIME);
        }
       
        if($index_hot_goods){
              /*foreach($index_hot_goods as $val){
                  $cat_path = explode('_', $val['parent_id_path']);
                  $hot_goods[$cat_path[1]][] = $val;
              }*/
              $this->assign("index_first_goods",$index_hot_goods);
        }
        
        $sql2 = "select a.goods_name,a.goods_id,a.shop_price,a.market_price,a.cat_id,b.parent_id_path,b.name from ".C('database.prefix')."goods as a left join ";
        $sql2 .= C('database.prefix')."goods_category as b on a.cat_id=b.id where a.is_recommend=1 and a.is_on_sale=1 order by a.sort";//二级分类下热卖商品
        $index_recommend_goods = S('index_recommend_goods');
        if(empty($index_recommend_goods))
        {
        	$index_recommend_goods = Db::query($sql2);//首页推荐商品
        	S('index_recommend_goods',$index_recommend_goods,TPSHOP_CACHE_TIME);
        }
         
        if($index_recommend_goods){
        	/*foreach($index_recommend_goods as $va){
        		$cat_path2 = explode('_', $va['parent_id_path']);
        		$recommend_goods[$cat_path2[1]][] = $va;
        	}*/
            $this->assign("index_second_goods",$index_recommend_goods);
        }

        /*$hot_category = M('goods_category')->where("is_hot=1 and level=3 and is_show=1")->cache(true,TPSHOP_CACHE_TIME)->select();//热门三级分类
        foreach ($hot_category as $v){
        	$cat_path = explode('_', $v['parent_id_path']);
        	$hot_cate[$cat_path[1]][] = $v;
        }*/
        //halt($this->cateTrre);
        foreach ($this->cateTrre as $k=>$v){
            /*if($v['is_hot']==1){
        		$v['hot_goods'] = empty($hot_goods[$k]) ? '' : $hot_goods[$k];
        		$v['recommend_goods'] = empty($recommend_goods[$k]) ? '' : $recommend_goods[$k];
        		$v['hot_cate'] = empty($hot_cate[$k]) ? array() : $hot_cate[$k];
        		$cateList[]=$goods_category_tree[] = $v;
        	}else{
                $goods_category_tree[] = $v;
            }*/
            $goods_category_tree[] = $v;
        }
        //halt($goods_category_tree);
        $this->assign('cateList',$cateList);
        $this->assign('goods_category_tree',$goods_category_tree);
        return $this->fetch();
    }
    
    
}