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
        'purchaser'=>[
            'domain'=>'self.openapi.xunmall.com'
        ],
        'trade-api'=>[
            //'domain'=>'api.trade.klagri.com.cn/api'//本地 需要单独端口跑PHP
            'domain'=>'dev-api.trade.klagri.com.cn/api'//测试，供APP端使用
        ],
        'inner'=>[
            'domain'=>'self.inner.openapi.xunmall.com:88'
        ],
        'supplier'=>[
            'domain'=>'self.supplier.openapi.xunmall.com:88'
        ],
        'standard'=>[
            'domain'=>'self.glib.openapi.xunmall.com:88'
        ],
        'datamap' =>[
            'domain'=>'self.datamap.openapi.xunmall.com:88'
        ]
    ],
    'email_address'=>'lz.apidoc.xunmall.com',

];