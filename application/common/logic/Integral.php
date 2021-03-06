<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 guaguayin，并保留所有权利。
 * 网站地址: http://www.guaguayin.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * 如果商业用途务必到官方购买正版授权, 以免引起不必要的法律纠纷.
 * ============================================================================
 * Author: dyr
 * Date: 2016-08-09
 */

namespace app\common\logic;

use app\common\model\Goods;
use app\common\model\Shop;
use app\common\model\UserAddress;
use app\common\model\Users;
use app\common\util\TpshopException;
use think\Db;
use app\common\model\SpecGoodsPrice;

/**
 * 瓜豆商品计算和购买类
 * Class Integral
 * @package app\common\logic
 */
class Integral
{
    private $goods;
    private $specGoodsPrice;
    private $buyNum;
    protected $goods_file_id; //印刷文件
    private $user;
    private $userAddress;
    private $userMoney;
    private $shop;//自提点

    /**
     * 设置购买的商品
     * @param $goods_id
     */
    public function setGoodsById($goods_id){
        if($goods_id > 0){
            $this->goods = Goods::get($goods_id);
        }
    }

    /**
     * 设置购买的商品规格模型
     * @param $item_id
     */
    public function setSpecGoodsPriceById($item_id){
        if($item_id > 0){
            $this->specGoodsPrice = SpecGoodsPrice::get($item_id);
        }
    }

    /**
     * 设置购买多少件
     * @param $buyNum
     */
    public function setBuyNum($buyNum){
        $this->buyNum = $buyNum;
    }
    public function setGoodsFileId($goods_file_id){
        $this->goods_file_id = $goods_file_id;
    }

    /**
     * 设置购买用户
     * @param $user_id
     */
    public function setUserById($user_id){
        if($user_id > 0){
            $this->user = Users::get($user_id);
        }
    }

    /**
     * 设置配送地址
     * @param $address_id
     */
    public function setUserAddressById($address_id){
        if($address_id > 0){
            $this->userAddress = UserAddress::get($address_id);
        }
    }

    /**
     * 获取用户地址
     * @return mixed
     */
    public function getUserAddress()
    {
        return $this->userAddress;
    }

    /**
     *  设置使用余额
     * @param $userMoney
     */
    public function useUserMoney($userMoney){
        $this->userMoney = $userMoney;
    }

    public function setShopById($shop_id)
    {
        if($shop_id){
            $this->shop = Shop::get($shop_id);
        }
    }
    /**
     * 购买前检查
     * @throws TpshopException
     */
    public function checkBuy()
    {
        if(empty($this->user)){
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '请登录']);
        }
        if(empty($this->goods)){
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '该商品不存在']);
        }
        if ($this->goods['is_on_sale'] != 1) {
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '商品已下架']);
        }
        if ($this->goods['exchange_integral'] <= 0) {
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '该商品不属于瓜豆兑换商品']);
        }
        if ($this->goods['store_count'] == 0) {
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '商品库存为零']);
        }
        if ($this->buyNum > $this->goods['store_count']) {
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '商品库存不足，剩余' . $this->goods['store_count'] . '份']);
        }
        $total_integral = $this->goods['exchange_integral'] * $this->buyNum;
        if (empty($this->specGoodsPrice)) {
            $goods_spec_list = SpecGoodsPrice::all(['goods_id' => $this->goods['goods_id']]);
            if (count($goods_spec_list) > 0) {
                throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '请传递规格参数', 'result' => '']);
            }
            //没有规格
        } else {
            //有规格
            if ($this->buyNum > $this->specGoodsPrice['store_count']) {
                throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => '该商品规格库存不足，剩余' . $this->specGoodsPrice['store_count'] . '份']);
            }
        }
        $integral_use_enable = tpCache('shopping.integral_use_enable');
        //购买设置必须使用瓜豆购买，而用户的瓜豆不足以支付
        if ($total_integral > $this->user['pay_points'] && $integral_use_enable == 1) {
            throw new TpshopException('瓜豆兑换', 0, ['status' => 0, 'msg' => "你的账户可用瓜豆为:" . $this->user['pay_points']]);
        }
    }

    /**
     * 瓜豆商品购买计算
     * @return Pay
     * @throws TpshopException
     */
    public function pay()
    {
        if (empty($this->userAddress)) {
            throw new TpshopException('瓜豆兑换', 0,['status' => -3, 'msg' => '请先填写收货人信息', 'result' => '']);
        }
        $integralGoods = $this->goods;
        $total_integral = $this->goods['exchange_integral'] * $this->buyNum;//需要兑换的总瓜豆
        if (empty($this->specGoodsPrice)) {
            //没有规格
            $integralGoods['goods_price'] = $this->goods['shop_price'];
            $integralGoods['goods_file_id'] = $this->goods_file_id;
            $integralGoods['sku'] = $this->goods['sku'];
        } else {
            //有规格
            $integralGoods['goods_price'] = $this->specGoodsPrice['price'];
            $integralGoods['spec_key'] = $this->specGoodsPrice['key'];// 商品规格
            $integralGoods['spec_key_name'] = $this->specGoodsPrice['key_name'];// 商品规格名称
            $integralGoods['sku'] = $this->specGoodsPrice['sku'];
            $integralGoods['goods_file_id'] = $this->goods_file_id;
        }
        $integralGoods['goods_num'] = $this->buyNum;
        $goodsList[0] = $integralGoods;
        $pay = new Pay();
        $pay->setUserId($this->user['user_id']);
        $pay->setShopById($this->shop['shop_id']);
        $pay->payGoodsList($goodsList);
        //echo 'a';exit;
        $pay->delivery($this->userAddress['district']);
        //echo 'a';exit;
        $pay->usePayPoints($total_integral, true);
        $pay->useUserMoney($this->userMoney);
        return $pay;
    }

}