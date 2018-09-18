<?php
/**
 * tpshop
 * ============================================================================
 * 版权所有 2015-2027 guaguayin，并保留所有权利。
 * 网站地址: http://www.guaguayin.cn
 * ----------------------------------------------------------------------------
 * 这不是一个自由软件！您只能在不用于商业目的的前提下对程序代码进行修改和使用 .
 * 不允许对程序代码以任何形式任何目的的再发布。
 * ============================================================================
 * Author: 
 * Date: 2015-09-09
 */
namespace app\common\model;
use think\Db;
use think\Model;
class DeliveryDoc extends Model {

    public function getFullAddressAttr($value, $data)
    {
        $region = Db::name('region')->where('id', 'IN', [$data['store_address_province_id'], $data['store_address_city_id'], $data['store_address_district_id']])->column('name');
        return implode('', $region) . $data['store_address'];
    }
}
