<?php
return array(
    'code'=> 'banktrans',
    'name' => '银行转账',
    'version' => '1.0',
    'author' => '',
    'desc' => '银行转账付款插件 ',
    'icon' => 'logo.jpg',    
	'scene' =>0,  // 使用场景 0 PC+手机 1 手机 2 PC
    'config' => array(
        array('name' => 'code_desc','label'=>'配送描述',           'type' => 'text',   'value' => ''),       
    ),    	
);