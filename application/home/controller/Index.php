<?php
/**
 * tpshop
 * ============================================================================
 * * 版权所有 2015-2027 guaguayin，并保留所有权利。
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
class Index extends Base {
    
    public function index(){      

        // 如果是手机跳转到 手机模块
        /*if(isMobile()){
            redirect(U('Mobile/Index/index'));
        }*/
        //热销爆品一个楼层，定制印品一个楼层，包装盒1个楼层，现货一个楼层，
        $cat_id_arr = getCatGrandson('8'); //热销爆品  获取某个商品分类的 儿子 孙子  重子重孙 的 id
        $index_hot_goods1 = S('index_hot_goods1');
        if(empty($index_hot_goods1))
        {
            $goods_where = ['is_on_sale' => 1,'is_hot' => 1, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
            $index_hot_goods1 = Db::name('goods')->where($goods_where)->cache(true)->select();
            S('index_hot_goods1',$index_hot_goods1,TPSHOP_CACHE_TIME);
        }
        if($index_hot_goods1){
            $this->assign("index_first_goods1",$index_hot_goods1);
        }

        $cat_id_arr = getCatGrandson('4'); //包装盒  获取某个商品分类的 儿子 孙子  重子重孙 的 id
        $index_hot_goods2 = S('index_hot_goods2');
        if(empty($index_hot_goods2))
        {
            $goods_where = ['is_on_sale' => 1,'is_hot' => 1, 'exchange_integral' => 0, 'cat_id' => ['in', $cat_id_arr]];
            $index_hot_goods2 = Db::name('goods')->where($goods_where)->cache(true)->select();
            S('index_hot_goods2',$index_hot_goods2,TPSHOP_CACHE_TIME);
        }
        if($index_hot_goods2){
            $this->assign("index_first_goods2",$index_hot_goods2);
        }

        return $this->fetch();
    }
 
    /**
     *  公告详情页
     */
    public function notice(){
        return $this->fetch();
    }

    /**
     *  加盟详情页
     */
    public function jiameng(){
        return $this->fetch();
    }

    /**
     *  关于我们详情页
     */
    public function about(){
        return $this->fetch();
    }

    /**
     *  反馈详情页
     */
    public function feedback(){
        return $this->fetch();
    }
    
    // 二维码
    public function qr_code_raw(){        
        ob_end_clean();
        // 导入Vendor类库包 Library/Vendor/Zend/Server.class.php
        //http://www.guaguayin.cn/Home/Index/erweima/data/www.99soubao.com
         //require_once 'vendor/phpqrcode/phpqrcode.php';
         vendor('phpqrcode.phpqrcode'); 
          //import('Vendor.phpqrcode.phpqrcode');
            error_reporting(E_ERROR);            
            $url = urldecode($_GET["data"]);
            \QRcode::png($url);
			exit;        
    }
    
    // 二维码
    public function qr_code()
    {
        ob_end_clean();
        vendor('topthink.think-image.src.Image');
        vendor('phpqrcode.phpqrcode');

        error_reporting(E_ERROR);
        $url = isset($_GET['data']) ? $_GET['data'] : '';
        $url = urldecode($url);
        $head_pic = input('get.head_pic', '');
        $back_img = input('get.back_img', '');
        $valid_date = input('get.valid_date', 0);
        
        $qr_code_path = UPLOAD_PATH.'qr_code/';
        if (!file_exists($qr_code_path)) {
            mkdir($qr_code_path);
        }
        
        /* 生成二维码 */
        $qr_code_file = $qr_code_path.time().rand(1, 10000).'.png';
        \QRcode::png($url, $qr_code_file, QR_ECLEVEL_M);
        
        /* 二维码叠加水印 */
        $QR = Image::open($qr_code_file);
        $QR_width = $QR->width();
        $QR_height = $QR->height();

        /* 添加背景图 */
        if ($back_img && file_exists($back_img)) {
            $back =Image::open($back_img);
            $back->thumb($QR_width, $QR_height, \think\Image::THUMB_CENTER)
             ->water($qr_code_file, \think\Image::WATER_NORTHWEST, 60);//->save($qr_code_file);
            $QR = $back;
        }
        
        /* 添加头像 */
        if ($head_pic) {
            //如果是网络头像
            if (strpos($head_pic, 'http') === 0) {
                //下载头像
                $ch = curl_init();
                curl_setopt($ch,CURLOPT_URL, $head_pic); 
                curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
                $file_content = curl_exec($ch);
                curl_close($ch);
                //保存头像
                if ($file_content) {
                    $head_pic_path = $qr_code_path.time().rand(1, 10000).'.png';
                    file_put_contents($head_pic_path, $file_content);
                    $head_pic = $head_pic_path;
                }
            }
            //如果是本地头像
            if (file_exists($head_pic)) {
                $logo = Image::open($head_pic);
                $logo_width = $logo->height();
                $logo_height = $logo->width();
                $logo_qr_width = $QR_width / 5;
                $scale = $logo_width / $logo_qr_width;
                $logo_qr_height = $logo_height / $scale;
                $logo_file = $qr_code_path.time().rand(1, 10000);
                $logo->thumb($logo_qr_width, $logo_qr_height)->save($logo_file, null, 100);
                $QR = $QR->thumb($QR_width, $QR_height)->water($logo_file, \think\Image::WATER_CENTER);     
                unlink($logo_file);
            }
            if ($head_pic_path) {
                unlink($head_pic_path);
            }
        }
        
        if ($valid_date && strpos($url, 'weixin.qq.com') !== false) {
            $QR = $QR->text('有效时间 '.$valid_date, "./vendor/topthink/think-captcha/assets/zhttfs/1.ttf", 7, '#00000000', Image::WATER_SOUTH);
        }
        $QR->save($qr_code_file, null, 100);
        
        $qrHandle = imagecreatefromstring(file_get_contents($qr_code_file));
        unlink($qr_code_file); //删除二维码文件
        header("Content-type: image/png");
        imagepng($qrHandle);
        imagedestroy($qrHandle);
        exit;
    }
    
    // 验证码
    public function verify()
    {
        //验证码类型
        $type = I('get.type') ? I('get.type') : '';
        $fontSize = I('get.fontSize') ? I('get.fontSize') : '40';
        $length = I('get.length') ? I('get.length') : '4';
        
        $config = array(
            'fontSize' => $fontSize,
            'length' => $length,
            'useCurve' => true,
            'useNoise' => false,
        );
        $Verify = new Verify($config);
        $Verify->entry($type);    
		exit();    
    }

    function truncate_tables (){
        $tables = DB::query("show tables");
        $table = array('tp_admin','tp_config','tp_region','tp_system_module','tp_admin_role','tp_system_menu','tp_article_cat','tp_wx_user');
        foreach($tables as $key => $val)
        {                                    
            if(!in_array($val['Tables_in_tpshop2.0'], $table))                             
                echo "truncate table ".$val['Tables_in_tpshop2.0'].' ; ';
                echo "<br/>";         
        }                
    }

    /**
     * 猜你喜欢
     * @author lxl
     * @time 17-2-15
     */
    public function ajax_favorite(){
        $p = I('p/d',1);
        $i = I('i',5); //显示条数
        $time = time();
        $where = ['is_on_sale'=>1 , 'is_virtual' => ['exp' ,"=0 or virtual_indate > $time"]];
        $favourite_goods = Db::name('goods')->where($where)->order('goods_id DESC')->page($p,$i)->cache(true,TPSHOP_CACHE_TIME)->select();//首页推荐商品
        $this->assign('favourite_goods',$favourite_goods);
        return $this->fetch();
    }
    public function linkmongo(){
        $conn = new MongoClient();
        $db = $conn->qyquan;
        $prefix = 'pic';
        $collection = $db->getGridFS($prefix);
    }
}