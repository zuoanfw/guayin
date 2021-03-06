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
use think\Db;
use think\Page;

class Article extends Base {
    
    public function index(){       
        $article_id = I('article_id/d',38);
    	$article = Db::name('article')->where("article_id", $article_id)->find();
    	$this->assign('article',$article);
        return $this->fetch();
    }
 
    /**
     * 文章内列表页
     */
    public function articleList(){
        //$article_cat = M('ArticleCat')->where("parent_id  = 0")->select();
        $cat_id = I('cat_id/d',2);
        $count = Db::name('article')->where("cat_id", $cat_id)->count();
        $page = new Page($count, 20);
        $article = Db::name('article')->where("cat_id", $cat_id)->order('article_id desc')->limit($page->firstRow . ',' . $page->listRows)->select();
        $this->assign('article',$article);
        $this->assign('page', $page);// 赋值分页输出
        return $this->fetch();
    }    
    /**
     * 文章内容页
     */
    public function detail(){
    	$article_id = I('article_id/d',1);
    	$article = Db::name('article')->where("article_id", $article_id)->find();
    	if($article){
    		$parent = Db::name('article_cat')->where("cat_id",$article['cat_id'])->find();
            $this->assign('cat_id',$article['cat_id']);
    		$this->assign('cat_name',$parent['cat_name']);
    		$this->assign('article',$article);
    	}
        return $this->fetch();
    } 
    
    /**
     * 获取服务协议
     * @return mixed
     */
    public function agreement(){
    	$doc_code = I('doc_code','agreement');
    	$article = Db::name('system_article')->where('doc_code',$doc_code)->find();
    	if(empty($article)) $this->error('抱歉，您访问的页面不存在！');
    	$this->assign('article',$article);
    	return $this->fetch();
    }

}