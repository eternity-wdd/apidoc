<?php

return [
    'adminEmail' => 'coder_lizheng@163.com',
    'max_time_difference' => '300',
    'uploadUrl' => 'http://self.api.xunmall.com:88',
    'bannerImgUrl' => 'http://self.shop.xunmall.com:88/',
/*     'email_validata'=>'http://self.documen' */
	'reflshTime' => '500',
    'md5_key' =>'jinglan_api',
    'api'=>[
        'trade-api'=>[
            //'domain'=>'api.trade.klagri.com.cn/api'//本地 需要单独端口跑PHP
            'domain'=>'dev-api.trade.klagri.com.cn/api'//测试，供APP端使用
        ],
        'facility'=>[
            'domain'=>'self.facility-klagri.com/facility'
        ],
        'decision'=>[
            'domain'=>'self.decision-klagri.com/facility'
        ],
        'cloud-weather'=>[
            'domain'=>'https://apiwx.klagri.com.cn/weather/v1/'
        ],
    ],
    'email_address'=>'lz.apidoc.xunmall.com',

];